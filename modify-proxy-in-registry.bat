@echo off
set key=HKEY_USERS
set pathToConnections=\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Connections
set regVariableName=DefaultConnectionSettings
set newValue=hex:46,00,00,00,06,00,00,00,01,00,00,00,00,00,00, 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00

for /F "skip=4 tokens=*" %%r in ('reg query %key%') do (
	set sVal=%%r
	set fullPath=%sVal%%pathToConnections%
	reg add %fullPath% /v %regVariableName% /d %newValue% /f
	goto :EOF
)
