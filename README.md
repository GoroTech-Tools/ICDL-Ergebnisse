# ICDL-Ergebnisse App

Diese App erledigt folgenden Ablauf:

1. Tagesaktuelle `examinations.csv` automatisch finden und verarbeiten
   - Suchreihenfolge: App-/EXE-Ordner, Desktop (inkl. OneDrive-Umleitungen), Downloads
2. Alternativ CSV manuell auswählen (Semikolon-getrennt)
3. Daten in eine Excel-Datei `ICDL-Ergebnisse_YYYYMMDD_HHMMSS.xlsx` schreiben
   - Zeitstempel basiert auf dem Änderungsdatum der CSV-Datei
4. Neue Outlook-E-Mail erzeugen
   - Empfänger: `KG_Kaufleuteteam`
   - Betreff: `ICDL-Ergebnisse der Prüfung vom DD.MM.YYYY`
   - Inhalt: kopierte Datentabelle im Nachrichtentext
5. E-Mail als Vorschau öffnen
6. Erzeugte Excel-Datei in `archive/` verschieben

## Neu in v2.6

- Fenster-Titelleisten-Icon robust eingebunden (inkl. Runtime-Fallback im EXE-Betrieb)
- GUI-Layout modernisiert (ruhigeres Card-/Header-Design, klarere Typografie, bessere Abstände)
- Mehr Übersicht im Ablaufbereich und optimierte Aktionsleiste

Aktuelles Release:

- `v2.6`: <https://github.com/TomGorontzy/ICDL-Ergebnisse/releases/tag/v2.6>

Beispiel-/Demodaten liegen unter:

- `demo/examinations.csv`

## Start

```powershell
pip install -r src/requirements.txt
python src/app.py
```

> Voraussetzung: Outlook (Desktop) muss installiert und für COM verfügbar sein.

## Dokumentation

- Anwender: `docs/DOKUMENTATION_ANWENDER.md`
- Technik: `docs/DOKUMENTATION_TECHNIK.md`

## Build

Build über das Skript im Projekt-Root (delegiert intern an `src/build.ps1`):

```powershell
.\build.ps1
```

Optional ohne ZIP-Erzeugung:

```powershell
.\build.ps1 -SkipZip
```

Optional ohne Markdownlint-Prüfung:

```powershell
.\build.ps1 -SkipMarkdownLint
```

Jedes neue Build wird in einen eigenen Unterordner geschrieben:

- `dist/ICDL-Ergebnisse-v<major>.<minor>/`

Der Ordner `demo/` wird in Build und Release mit übernommen.

Vor jedem Build läuft automatisch eine Markdownlint-Routine (Auto-Fix + Verifikation).

Zusätzlich wird standardmäßig ein Release-ZIP erstellt:

- `release/ICDL-Ergebnisse-v<major>.<minor>.zip`

Zusätzlich wird bei jedem Build eine Release-Notes-Datei erzeugt:

- `release/RELEASE_NOTES_v<major>.<minor>.md`

`archive\` wird ebenfalls in die Release-Artefakte übernommen (bei leerem Archiv mit Platzhalterdatei).

Die EXE übernimmt das Icon aus `src/app_icon.ico`.
Für die Titelleiste wird das Icon zusätzlich als Daten-Datei mit ins Bundle aufgenommen,
sodass es auch im PyInstaller-Runtime-Kontext zuverlässig gefunden wird.

Beispiel:

- `dist/ICDL-Ergebnisse-v1.3/ICDL-Ergebnisse.exe`

## Versionierung

Die Build-Version wird automatisch in `build-version.json` verwaltet und bei jedem Build erhöht.

Schema:

- `major.minor`
- `minor` läuft von `0` bis `9`
- nach `x.9` folgt `x+1.0`
