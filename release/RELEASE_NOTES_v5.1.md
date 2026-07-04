# Release Notes v5.1

Datum: 2026-07-04

## Highlights

- Release wurde automatisiert gebaut und paketiert (EXE + Dokumentation + Archivdaten).
- Build- und Release-Prozess wurden im Projektstandard vereinheitlicht (Versionierung, ZIP, Notes).
- Diese Version enthält die zuletzt umgesetzten Funktions- und UX-Anpassungen.

## Letzte Anpassungen

- GUI: Statusbalken für die Verarbeitung ergänzt; bei erfolgreichem Abschluss "Fertig" grün hervorgehoben.
- GUI: Schaltfläche zum direkten Öffnen des docs-Ordners ergänzt.
- Automatik: CSV-Suche und Auto-Start für App-Ordner, Desktop und Downloads erweitert.
- Datenfluss: erzeugte Excel-Dateien werden nach erfolgreicher Verarbeitung automatisch nach archive verschoben (Überschreiben ohne Rückfrage).
- Diagramme: Mermaid-Dokumentation auf SVG umgestellt; PNG-Artefakte wurden entfernt.
- Distribution: demo-Ordner wird in Build und Release mitgeführt; Demo-CSV liegt unter demo/examinations.csv.

## Qualitätsstatus

- Release-Build erfolgreich erzeugt.
- ZIP-Artefakt erstellt und im Release-Ordner abgelegt.
- Automatische Basisprüfung (Build/Packaging) im Skript durchlaufen.

## Artefakte

- Build-Verzeichnis: dist/ICDL-Ergebnisse-v5.1/
- EXE: dist/ICDL-Ergebnisse-v5.1/ICDL-Ergebnisse.exe
- Dokumentation: dist/<Build>/docs/
- Archivdaten: dist/ICDL-Ergebnisse-v5.1/archive/
- Release-ZIP: release/ICDL-Ergebnisse-v5.1.zip

## Enthaltene Commits (aktuelle Historie)

- `b7513d7` docs: switch diagrams to svg
- `d770bc6` release: v5.0
- `7b8271a` docs: add mermaid diagrams and documentation
- `f701d5a` release: v4.3
- `b8a8776` feat: repeat automation for updated csv locations

## Technische Build-Informationen

- Build-Datum: 2026-07-04 21:17:32
- Build-Modus: PyInstaller --noconfirm
- EXE-Name: ICDL-Ergebnisse.exe