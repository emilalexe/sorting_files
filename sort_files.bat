SetLocal EnableDelayedExpansion
Set "DirOfN=0"
Set "DirAvN=0"
SET "tDate=%DATE:~7,2%%DATE:~4,2%%DATE:~10,4%"

for %%f in (*.pdf) do ren "%%f" "%%~nf-%tDATE%%%~xf"

:Check_DirOfN
Set/A "DirOfN+=1"
If Exist "OFFERS\%DirOfN%" GoTo Check_DirOfN
cls
echo Moving files to Directory OFFERS\%DirOfN%...
Set "limit=20"
For %%o In (O*.pdf) Do (
    RoboCopy . "OFFERS\%DirOfN%" "%%o" /MOV 1>NUL
    Set/A "limit-=1"
    If !limit! Equ 0 GoTo Check_DirOfN
)

:Check_DirAvN
Set/A "DirAvN+=1"
If Exist "ANNOUNCEMENTS\%DirAvN%" GoTo Check_DirAvN
cls
echo Moving files to Directory ANNOUNCEMENTS\%DirAvN%...
Set "limit=20"
For %%a In (A*.pdf) Do (
    RoboCopy . "ANNOUNCEMENTS\%DirAvN%" "%%a" /MOV 1>NUL
    Set/A "limit-=1"
    If !limit! Equ 0 GoTo Check_DirAvN
)

Echo(Task Done!)
pause
