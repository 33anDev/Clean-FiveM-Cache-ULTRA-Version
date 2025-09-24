# Clean-FiveM-Cache-ULTRA-Version
Self made FiveM cache cleaner, made purely so you don't have to delete cache manually every single time.


FiveM Cache Cleaner (.bat)

Snabb, säker rensning av FiveM-cache för mindre stutter och onödigt diskbruk. Rör inte spelet, profilen eller game-storage.

Vad rensas

cache

server-cache

server-cache-priv

nui-storage

game-storage lämnas orörd för att undvika stora nedladdningar och seg första start.

Platser som genomsöks

%LOCALAPPDATA%\FiveM\FiveM.app\data

%USERPROFILE%\AppData\Local\FiveM\FiveM.app\data

%APPDATA%\CitizenFX

%LOCALAPPDATA%\CitizenFX

Användning (Windows)

Hämta CleanFiveMCache_ULTRA.bat från GitHub (via Download raw eller zip).

Om Windows blockerar: högerklicka filen → Egenskaper → bocka i Avblockera → OK.

Högerklicka .bat → Kör som administratör.

Följ instruktionerna i fönstret. Första join efter rensning kan ta längre tid. Det är normalt.

Alternativ: kör via Kommandotolken (admin)
cd "C:\Sökväg\till\mappen\med\bat"
CleanFiveMCache_ULTRA.bat

Verifiera rensning

Öppna %LOCALAPPDATA%\FiveM\FiveM.app\data (Win+R), kontrollera att mapparna ovan är tomma eller nära noll filer.

Skriptet visar även “innan/efter” i bytes i konsolen.

Vanliga problem

Fönstret stängs direkt: kör från en administrativ Kommandotolk för att se felrad.

SmartScreen klagar: klicka Mer info → Kör ändå, eller använd “Avblockera” enligt ovan.

Filen startar men rensar inte: din cache ligger på en annan plats än standard. Öppna platserna ovan och kontrollera.

Fel filändelse: se till att filen slutar på .bat (inte .bat.txt).

Säkerhet

Rensar endast temporära cachemappar som FiveM bygger upp igen automatiskt. Ändrar inte spelinstallation, profiler eller game-storage.

English

Fast, safe FiveM cache cleaning to reduce stutter and disk bloat. Does not touch the game, your profile, or game-storage.

Cleared folders

cache, server-cache, server-cache-priv, nui-storage

game-storage is left untouched to avoid large re-downloads and slow first launch.

Locations scanned

%LOCALAPPDATA%\FiveM\FiveM.app\data

%USERPROFILE%\AppData\Local\FiveM\FiveM.app\data

%APPDATA%\CitizenFX

%LOCALAPPDATA%\CitizenFX

Usage (Windows)

Download CleanFiveMCache_ULTRA.bat from GitHub (Download raw or zip).

If Windows blocks it: Right-click → Properties → tick Unblock → OK.

Right-click the .bat → Run as administrator.

Follow the prompts. First join after cleaning may be slower. That’s normal.

Run from Command Prompt (admin):

cd "C:\Path\to\folder\with\bat"
CleanFiveMCache_ULTRA.bat

Verify

Open %LOCALAPPDATA%\FiveM\FiveM.app\data (Win+R). Cleared folders should be empty or near-empty.

The script prints before/after sizes in bytes.

Common issues

Window closes instantly → run from an elevated Command Prompt to see errors.

SmartScreen warns → “More info” → “Run anyway,” or Unblock via Properties.

Nothing seems cleared → your cache may live in a non-standard path; check the locations above.

Wrong extension → ensure .bat, not .bat.txt.

Safety

Only temporary caches are removed. The game install, profiles, and game-storage are not touched.
