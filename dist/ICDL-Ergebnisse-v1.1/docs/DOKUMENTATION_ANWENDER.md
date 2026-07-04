# ICDL-Ergebnisse – Anwenderdokumentation

## Zweck

Die Anwendung `ICDL-Ergebnisse` automatisiert den Ablauf:

1. `examinations.csv` einlesen
2. Excel-Ergebnisdatei erstellen
3. Outlook-E-Mail-Vorschau mit Tabelleninhalt und Excel-Anlage erzeugen

## Voraussetzungen

- Windows mit installiertem Outlook (Desktop)
- Python/EXE-Build ist bereits vorhanden
- `examinations.csv` liegt idealerweise im gleichen Ordner wie die EXE

## Start

### EXE-Variante

- `dist\ICDL-Ergebnisse.exe` starten

### Verhalten beim Start

- Wenn `examinations.csv` im EXE-Ordner liegt **und tagesaktuell ist**, startet die Verarbeitung automatisch.
- Andernfalls kann die CSV über den Button ausgewählt werden.

## Ergebnis

- Excel-Datei: `ICDL-Ergebnisse_YYYYMMDD_HHMMSS.xlsx`
- Outlook-E-Mail-Vorschau mit:
  - Empfänger `KG_Kaufleuteteam`
  - Betreff mit Prüfungsdatum
  - Tabelle aus Excel (Quellformatierung beibehalten)
  - Excel-Datei als Anlage

## Hinweise

- Wenn Outlook noch nicht läuft, versucht die App Outlook automatisch zu starten.
- Bei Outlook-Dialogen (Profil/Sicherheit) kann der Ablauf warten oder mit Meldung abbrechen.

## Fehlerbehebung

- Prüfen, ob `examinations.csv` korrekt aufgebaut ist (Semikolon-getrennt).
- Outlook manuell öffnen, falls COM-Zugriff blockiert ist.
- Bei Build-Themen das Technikdokument prüfen.
