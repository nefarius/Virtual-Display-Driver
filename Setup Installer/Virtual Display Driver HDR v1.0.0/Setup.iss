#define MyAppName "Virtual Display Driver HDR"
#define MyAppVersion "1.0.0"
#define MyAppURL "https://github.com/timminator/Virtual-Display-Driver"
#define InstallPath "C:\IddSampleDriver"

[Setup]
SignTool=signtool $f
AppId={{3A1D1EE3-1A2D-4EA2-AA99-58D631C25263}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={#InstallPath}
MinVersion=10.0.22621
DisableDirPage=yes
UsePreviousAppDir=yes
LicenseFile=..\..\LICENSE
DisableProgramGroupPage=yes
PrivilegesRequired=admin
OutputBaseFilename={#MyAppName}-v{#MyAppVersion}-setup-x64
SetupIconFile=..\{#MyAppName}.ico
Compression=lzma
SolidCompression=yes
WizardStyle=classic
UninstallDisplayName={#MyAppName}
UninstallDisplayIcon={uninstallexe}   

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: "{app}"; Permissions: everyone-full

[Files]
Source: ".\iddsampledriver.cat"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\IddSampleDriver.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Virtual_Display_Driver.cer"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\IddSampleDriver.inf"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Setup.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\option.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\NumberofMonitors.bat"; DestDir: "{app}"; Flags: ignoreversion; AfterInstall: AfterInstall
Source: ".\nefconw.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\LICENSE_nefcon.txt"; Flags: dontcopy

[Code]
var
  LicenseAcceptedRadioButtons: array of TRadioButton;

procedure CheckLicenseAccepted(Sender: TObject);
begin
  // Update Next button when user (un)accepts the license
  WizardForm.NextButton.Enabled :=
    LicenseAcceptedRadioButtons[TComponent(Sender).Tag].Checked;
end;

procedure LicensePageActivate(Sender: TWizardPage);
begin
  // Update Next button when user gets to second license page
  CheckLicenseAccepted(LicenseAcceptedRadioButtons[Sender.Tag]);
end;

function CloneLicenseRadioButton(
  Page: TWizardPage; Source: TRadioButton): TRadioButton;
begin
  Result := TRadioButton.Create(WizardForm);
  Result.Parent := Page.Surface;
  Result.Caption := Source.Caption;
  Result.Left := Source.Left;
  Result.Top := Source.Top;
  Result.Width := Source.Width;
  Result.Height := Source.Height;
  // Needed for WizardStyle=modern / WizardResizable=yes
  Result.Anchors := Source.Anchors;
  Result.OnClick := @CheckLicenseAccepted;
  Result.Tag := Page.Tag;
end;

var
  LicenseAfterPage: Integer;

procedure AddLicensePage(LicenseFileName: string);
var
  Idx: Integer;
  Page: TOutputMsgMemoWizardPage;
  LicenseFilePath: string;
  RadioButton: TRadioButton;
begin
  Idx := GetArrayLength(LicenseAcceptedRadioButtons);
  SetArrayLength(LicenseAcceptedRadioButtons, Idx + 1);

  Page :=
    CreateOutputMsgMemoPage(
      LicenseAfterPage, SetupMessage(msgWizardLicense),
      SetupMessage(msgLicenseLabel), SetupMessage(msgLicenseLabel3), '');
  Page.Tag := Idx;

  // Shrink license box to make space for radio buttons
  Page.RichEditViewer.Height := WizardForm.LicenseMemo.Height;
  Page.OnActivate := @LicensePageActivate;

  // Load license
  // Loading ex-post, as Lines.LoadFromFile supports UTF-8,
  // contrary to LoadStringFromFile.
  ExtractTemporaryFile(LicenseFileName);
  LicenseFilePath := ExpandConstant('{tmp}\' + LicenseFileName);
  Page.RichEditViewer.Lines.LoadFromFile(LicenseFilePath);
  DeleteFile(LicenseFilePath);

  // Clone accept/do not accept radio buttons
  RadioButton :=
    CloneLicenseRadioButton(Page, WizardForm.LicenseAcceptedRadio);
  LicenseAcceptedRadioButtons[Idx] := RadioButton;

  RadioButton :=
    CloneLicenseRadioButton(Page, WizardForm.LicenseNotAcceptedRadio);
  // Initially not accepted
  RadioButton.Checked := True;

  LicenseAfterPage := Page.ID;
end;

var
  Page: TWizardPage;
  MonitorsEdit: TEdit;
  MonitorsLabel: TLabel;

procedure InitializeWizard();
begin
  LicenseAfterPage := wpLicense;
  AddLicensePage('LICENSE_nefcon.txt');
  // Create a custom page
  Page := CreateCustomPage(LicenseAfterPage, 'Virtual Display Configuration', 
    'Choose how many virtual displays you want to add to your system.');
  
  // Create a label for the message
  MonitorsLabel := TLabel.Create(Page);
  MonitorsLabel.Parent := Page.Surface;
  MonitorsLabel.Caption := 'Choose how many virtual displays you want to add to your system.'#13#10'A maximum of 4 displays is recommended.';
  MonitorsLabel.Left := 10;
  MonitorsLabel.Top := 10;
  MonitorsLabel.Width := Page.SurfaceWidth - 20;
  MonitorsLabel.AutoSize := True;
  MonitorsLabel.WordWrap := True;

  // Create an edit box for user input
  MonitorsEdit := TEdit.Create(Page);
  MonitorsEdit.Parent := Page.Surface;
  MonitorsEdit.Left := 10;
  MonitorsEdit.Top := MonitorsLabel.Top + MonitorsLabel.Height + 10;
  MonitorsEdit.Width := Page.SurfaceWidth - 20;
  MonitorsEdit.Text := '1'; // Default value
end;

procedure RunBatchFile(FileName: String; Params: String);
var
  ResultCode: Integer;
begin
  Exec(ExpandConstant(FileName), Params, '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

procedure AfterInstall;
var
  NumberOfMonitors: String;
begin
  // Get the number of monitors from the user input
  NumberOfMonitors := MonitorsEdit.Text;

  // Run the batch file with the user input as an argument
  RunBatchFile(ExpandConstant('{app}\NumberofMonitors.bat'), NumberOfMonitors);
end;

var 
  isSilent: Boolean;

function InitializeSetup(): Boolean;
var
  j: Integer;
begin
  Result := True;
  IsSilent := False;
  for j := 1 to ParamCount do
  begin
    if (CompareText(ParamStr(j), '/verysilent') = 0) or 
       (CompareText(ParamStr(j), '/silent') = 0) then
    begin
      IsSilent := True;
      Break;
    end;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
var
  I: Integer;
begin
  // Automatically accept licenses if running in silent mode
  if IsSilent then
  begin
    for I := 0 to GetArrayLength(LicenseAcceptedRadioButtons) - 1 do
    begin
      LicenseAcceptedRadioButtons[I].Checked := True;
    end;
  end;
end;

[Run]
Filename: "{app}\Setup.bat"; Parameters: "install"; Flags: runhidden

[UninstallRun]
Filename: "{app}\Setup.bat"; Parameters: "uninstall"; Flags: runhidden