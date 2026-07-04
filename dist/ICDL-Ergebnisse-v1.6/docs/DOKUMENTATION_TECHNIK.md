# ICDL-Ergebnisse – Technische Dokumentation

## Überblick

`ICDL-Ergebnisse` ist eine Tkinter-basierte Desktop-Anwendung (`app.py`) mit diesen Kernbausteinen:

- CSV-Import (`csv.DictReader`, Semikolon)
- Excel-Erzeugung (`openpyxl`)
- Outlook-Integration über COM (PowerShell + Outlook/WordEditor)

## Datenfluss

1. CSV laden und normalisieren
2. Prüfungsdatum ermitteln
3. Excel-Datei schreiben (inkl. Ausrichtung, Zusatzspalte „Benötigte Zeit“)
4. Outlook-E-Mail erzeugen
   - Text in Compose-Body
   - Tabelle aus Excel per `PasteExcelTable` (Quellformatierung)
   - Excel-Datei als Attachment
5. Nach erfolgreicher Outlook-Erzeugung Excel-Datei nach `archive\\` verschieben

- vorhandene Zieldateien werden per `os.replace(...)` ohne Rückfrage überschrieben

CSV-Suchreihenfolge (`examinations.csv`):

1. App-/EXE-Verzeichnis
2. benutzerspezifischer Desktop (`%USERPROFILE%\\Desktop`)
3. benutzerspezifischer Downloads-Ordner (`%USERPROFILE%\\Downloads`)

Diese Reihenfolge gilt sowohl für die Dialog-Vorbelegung als auch für den Auto-Start (tagesaktuelle Datei).

## Build-Prozess

Build-Skript: `build.ps1`

- erzeugt per PyInstaller eine Onefile-EXE aus `ICDL-Ergebnisse.spec`
- legt jedes Build in einen versionierten Unterordner:
  - `dist\ICDL-Ergebnisse-v<major>.<minor>\ICDL-Ergebnisse.exe`
- kopiert `docs\` in den Build-Ordner
- übernimmt `archive\` in den Build-Ordner (bei leerem Archiv mit Platzhalterdatei)
- erzeugt bei jedem Build `release\RELEASE_NOTES_v<major>.<minor>.md`
- erstellt standardmäßig ein Release-ZIP in `release\\ICDL-Ergebnisse-v<major>.<minor>.zip`
- mit `-SkipZip` kann die ZIP-Erstellung übersprungen werden

## Versionierung

Datei: `build-version.json`

Schema: `major.minor`

Regel pro Build:

- `minor` erhöht sich von `0` bis `9`
- nach `x.9` folgt `x+1.0`

Beispiele:

- `1.0`, `1.1`, ..., `1.9`, `2.0`, `2.1`, ...

## Wichtige technische Entscheidungen

- Outlook-Automatikstart mit Retry-Logik, falls Outlook noch nicht läuft.
- Tabellenübertragung aus Excel via Zwischenablage, um Formatierungsabweichungen durch HTML-Rendering zu vermeiden.
- UTF-8 mit BOM für temporäre PowerShell-Skripte (Umlaute in Fehlermeldungen).

## Wartung

- Abhängigkeiten in `requirements.txt`
- Bei COM-/Outlook-Problemen zuerst Outlook-Profil/Dialogsituation prüfen.
- Build-Ordner und Cache können gefahrlos bereinigt werden (`build/`, `__pycache__/`, Logs).
