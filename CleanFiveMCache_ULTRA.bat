@echo off
rem CleanFiveMCache_ULTRA.bat — startar på allt, pratar tydligt, rensar säkert

title FiveM Cache Cleaner (ULTRA)
echo ==========================================================
echo  FiveM Cache Cleaner - sakert cache-stad (inte spelet)
echo ==========================================================
echo.
echo Det har kommer att handa:
echo   1) Stanger FiveM/FXServer (om igang)
echo   2) Hittar cachemappar
echo   3) Visar storlek fore
echo   4) Rensar: cache, server-cache, server-cache-priv, nui-storage
echo   5) Visar storlek efter
echo.
echo Obs: "game-storage" rors INTE (slipper stor nedladdning).
echo Forsta join efter rensning kan ta langre tid (normalt).
echo.
pause

echo [1/4] Stanger processer som kan lasa filer...
taskkill /IM FiveM* /T /F >nul 2>&1
taskkill /IM FXServer* /T /F >nul 2>&1
echo   - Klart (ignorera om inget var igang).
echo.

echo [2/4] Letar cachebaser...
set "BASE1=%LOCALAPPDATA%\FiveM\FiveM.app\data"
set "BASE2=%USERPROFILE%\AppData\Local\FiveM\FiveM.app\data"
set "BASE3=%APPDATA%\CitizenFX"
set "BASE4=%LOCALAPPDATA%\CitizenFX"

set "FOUND=0"

for %%B in ("%BASE1%" "%BASE2%" "%BASE3%" "%BASE4%") do (
  if exist "%%~fB" (
    echo Hittade bas: %%~fB
    set /a FOUND+=1
  )
)

if "%FOUND%"=="0" (
  echo Hittade inga kanda platser. Kolla manuellt:
  echo   %LOCALAPPDATA%\FiveM\FiveM.app\data
  echo   %APPDATA%\CitizenFX
  echo.
  pause
  goto :eof
)

echo.
echo [3/4] Visar storlek fore rensning...
for %%B in ("%BASE1%" "%BASE2%" "%BASE3%" "%BASE4%") do (
  if exist "%%~fB" (
    for %%S in ("cache" "server-cache" "server-cache-priv" "nui-storage") do (
      set "T=%%~fB\%%~S"
      if exist "!T!" (
        for /f "tokens=1-5*" %%a in ('dir /s /-c "!T!" ^| findstr /c:"File(s)"') do echo   !T!  (innan: %%d bytes)
      )
    )
  )
)

echo.
echo [4/4] Rensar cachemappar...
for %%B in ("%BASE1%" "%BASE2%" "%BASE3%" "%BASE4%") do (
  if exist "%%~fB" (
    for %%S in ("cache" "server-cache" "server-cache-priv" "nui-storage") do (
      set "T=%%~fB\%%~S"
      if exist "!T!" (
        echo   -> Rensar !T!
        attrib -R -H -S "!T!\*" /S /D >nul 2>&1
        del /F /Q "!T!\*" >nul 2>&1
        for /D %%X in ("!T!\*") do rd /S /Q "%%~fX" >nul 2>&1
      )
    )
  )
)

echo.
echo Storlek efter rensning:
for %%B in ("%BASE1%" "%BASE2%" "%BASE3%" "%BASE4%") do (
  if exist "%%~fB" (
    for %%S in ("cache" "server-cache" "server-cache-priv" "nui-storage") do (
      set "T=%%~fB\%%~S"
      if exist "!T!" (
        for /f "tokens=1-5*" %%a in ('dir /s /-c "!T!" ^| findstr /c:"File(s)"') do echo   !T!  (efter: %%d bytes)
      )
    )
  )
)

echo.
echo KLART. Om storleken inte gick ner: din cache ligger pa annan plats
echo eller var redan tom. Forsta join efter rensning ar segare (normalt).
echo.
pause

