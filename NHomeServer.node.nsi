#!Nsis Installer Command Script
#
# This is an NSIS Installer Command Script generated automatically
# by the Fedora nsiswrapper program.  For more information see:
#
#   http://fedoraproject.org/wiki/MinGW
#
# To build an installer from the script you would normally do:
#
#   makensis this_script
#
# which will generate the output file 'installer.exe' which is a Windows
# installer containing your program.

# Modern UI
!include MUI2.nsh

Name "NHomeServer"
InstallDir "c:\NHomeServer"

RequestExecutionLevel user

VIAddVersionKey "ProductName" "NHomeServer"
VIAddVersionKey "CompanyName" "Neosoft Computers"
VIAddVersionKey "LegalCopyright" "Copyright Neosoft Computers 2009"
VIAddVersionKey "FileDescription" "NHomeServer Installer"
VIAddVersionKey "FileVersion" "VERSIONDATA1"

VIProductVersion "VERSIONDATA2"

ShowInstDetails hide
ShowUninstDetails hide

SetCompressor /FINAL /SOLID lzma
SetCompressorDictSize 64
CRCCheck force

XPStyle on

!define MUI_COMPONENTSPAGE_NODESC

!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

ComponentText "Select which optional components you want to install."

DirText "Please select the installation folder."

Section "NHomeServer program"
  SectionIn RO

  SetOutPath "$INSTDIR"
  File /r "*.*"
  
SectionEnd

Section "Start Menu Shortcuts"
  SetShellVarContext current
  CreateDirectory "$SMPROGRAMS\NHomeServer"
  CreateShortCut "$SMPROGRAMS\NHomeServer\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\NHomeServer\NHomeServer.lnk" "$INSTDIR\nhome.exe" "" "$INSTDIR\nhome.ico" 0
SectionEnd

Section "Desktop Icons"
  SetShellVarContext current
  CreateShortCut "$DESKTOP\NHomeServer.lnk" "$INSTDIR\nhome.exe" "" "$INSTDIR\nhome.ico" 0
SectionEnd

Section "Start on boot"
  SetShellVarContext current
  CreateShortCut "$SMSTARTUP\NHomeServer.lnk" "$INSTDIR\nhome.exe" "--autostart" "$INSTDIR\nhome.ico" 0
SectionEnd

Section "Uninstall"
  SetShellVarContext current
  Delete /rebootok "$DESKTOP\NHomeServer.lnk"
  Delete /rebootok "$SMPROGRAMS\NHomeServer\NHomeServer.lnk"
  Delete /rebootok "$SMPROGRAMS\NHomeServer\Uninstall.lnk"
  Delete /rebootok "$SMSTARTUP\NHomeServer.lnk"
  RMDir "$SMPROGRAMS\NHomeServer"
  RMDir /r /rebootok "$APPDATA\Neosoft\NHomeServer"
  RMDir /r /rebootok "$INSTDIR"
SectionEnd

Section -post
  WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd
