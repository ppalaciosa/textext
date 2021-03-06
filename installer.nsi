
; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "TexText for Inkscape"
!define PRODUCT_VERSION "0.8-beta3"
!define PRODUCT_PUBLISHER "Pit Garbe, Jan Winkler"
!define PRODUCT_WEB_SITE "https://tu-dresden.de/ing/elektrotechnik/rst"
!define PRODUCT_DIR_REGKEY "Software\Python\TexText"

; MUI 1.67 compatible ------
!include "MUI2.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"

; Welcome page
!define MUI_WELCOMEPAGE_TEXT "Setup will guide you through the installation of ${PRODUCT_NAME} \
${PRODUCT_VERSION}$\n$\nClick Next to continue."
!insertmacro MUI_PAGE_WELCOME

; License page
!define MUI_LICENSEPAGE_BUTTON "Next >"
!define MUI_LICENSEPAGE_TEXT_TOP "TexText is published under the modified BSD License \
(3-clause BSD License):"
!define MUI_LICENSEPAGE_TEXT_BOTTOM "Click Next to continue!"
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"

; Directory page
!define MUI_DIRECTORYPAGE_TEXT_TOP "${PRODUCT_NAME} ${PRODUCT_VERSION} will be installed into the \
Inkscape extension directory. Please change this directory only if you know what you are doing!"
!insertmacro MUI_PAGE_DIRECTORY

; Instfiles page
!insertmacro MUI_PAGE_INSTFILES

; Finish page
!define MUI_FINISHPAGE_TEXT_LARGE
!define MUI_FINISHPAGE_TEXT "${PRODUCT_NAME} ${PRODUCT_VERSION} has been installed on your computer. \
It is recommended to carefully read the WIKI on www.github.com/textext/textext/wiki with instructions \
for additional software and a short TexText user guide.$\n$\nClick Finish to close Setup."
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Open Wiki https://www.github.com/textext/textext/wiki"
!define MUI_FINISHPAGE_RUN_FUNCTION "ShowWiki"
!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Function ShowWiki
  ExecShell "open" "https://www.github.com/textext/textext/wiki"
FunctionEnd

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "TexText-Windows-${PRODUCT_VERSION}.exe"
InstallDir "$APPDATA\inkscape\extensions\"
InstallDirRegKey HKCU "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
RequestExecutionLevel user
  
Section -SETTINGS
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
SectionEnd

Section "TexText" -SEC01
  File "textext.py"
  File "asktext.py"
  File "textext.inx"
  File "typesetter.py"
  File "latexlogparser.py"
  File "default_packages.tex"
  File "win_app_paths.py"
SectionEnd
