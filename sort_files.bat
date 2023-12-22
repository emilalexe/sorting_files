SetLocal EnableDelayedExpansion
Set "DirOfN=0"
Set "DirAvN=0"
SET "tDate=%DATE:~7,2%%DATE:~4,2%%DATE:~10,4%"

for %%f in (*.pdf) do ren "%%f" "%%~nf-%tDATE%%%~xf"

:Check_DirOfN
Set/A "DirOfN+=1"
If Exist "Oferta\%DirOfN%" GoTo Check_DirOfN
cls
echo Moving files to Directory Oferta\%DirOfN%...
Set "limit=20"
For %%o In (O*.pdf) Do (
    RoboCopy . "Oferta\%DirOfN%" "%%o" /MOV 1>NUL
    Set/A "limit-=1"
    If !limit! Equ 0 GoTo Check_DirOfN
)

:Check_DirAvN
Set/A "DirAvN+=1"
If Exist "Aviz\%DirAvN%" GoTo Check_DirAvN
cls
echo Moving files to Directory Aviz\%DirAvN%...
Set "limit=20"
For %%a In (A*.pdf) Do (
    RoboCopy . "Aviz\%DirAvN%" "%%a" /MOV 1>NUL
    Set/A "limit-=1"
    If !limit! Equ 0 GoTo Check_DirAvN
)

Echo(Task Done!)
pause