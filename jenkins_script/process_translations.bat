SET PluginNameShort=%localPluginDir:services\=%
ECHO %PluginNameShort%

CD %installDir%/%PluginNameShort%
GIT remote
GIT checkout master


CD %installDir%

REM Run the script on each language.
REM de
CALL ant -f handling_translated_files.xml -Dlang=de -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_de%packageExtension% 

REM es
CALL ant -f handling_translated_files.xml -Dlang=es -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_es%packageExtension%

REM fr
CALL ant -f handling_translated_files.xml -Dlang=fr -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_fr%packageExtension%

REM it	
CALL ant -f handling_translated_files.xml -Dlang=it -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_it%packageExtension%

REM ja
CALL ant -f handling_translated_files.xml -Dlang=ja -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_ja%packageExtension%

REM KO
CALL ant -f handling_translated_files.xml -Dlang=ko -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_ko%packageExtension%

REM PT/BR
CALL ant -f handling_translated_files.xml -Dlang=pt/BR -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_pt-BR%packageExtension%

REM zh/CN
CALL ant -f handling_translated_files.xml -Dlang=zh/CN -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_zh-Hans%packageExtension%

REM zh/TW
CALL ant -f handling_translated_files.xml -Dlang=zh/TW -DnoPrompt=true -DshipmentNumber=%shipmentNumber% -DlocalPluginDir=%localPluginDir% -DPluginNameShort=%PluginNameShort% -DinstallDir=%installDir% -DcheckInComment="%checkInComment%" -Dgsa.userid=%gsaUserID% -Dgsa.password=%gsaUserPassword% -Dpkg.url=https://rtpgsa.ibm.com/projects/c/cfm/CentralNLV/%projectCode%/%chargetoID%/%chargetoID%_%shipmentName%_%shipmentNumber%_zh-Hant%packageExtension%


CD %installDir%/%PluginNameShort%


ECHO GIT pull
GIT pull https://%githubUserID%:%githubPassword%@github.com/IBM-Bluemix-Docs/%PluginNameShort%.git

ECHO GIT add --all
GIT add --all

ECHO GIT status
GIT status

ECHO GIT commit
GIT commit -m "%checkInComment%"

ECHO GIT merge
GIT merge

ECHO GIT remote add
GIT remote add %PluginNameShort% https://github.com/IBM-Bluemix-Docs/%PluginNameShort%.git

ECHO GIT push https://%githubUserID%:%githubPassword%@github.com/IBM-Bluemix-Docs/%PluginNameShort%.git
GIT push %PluginNameShort%
