# ICDL-Ergebnisse – Diagrammdokumentation

Diese Seite bündelt die wichtigsten Abläufe als Mermaid-Diagramme und verweist auf die gerenderten SVG-Dateien.

## Anwenderablauf

```mermaid
flowchart TD
    A[Start: ICDL-Ergebnisse öffnen] --> B{Aktualisierte examinations.csv gefunden?}
    B -- Ja --> C[Datei prüfen und Start bestätigen]
    B -- Nein --> D[CSV manuell auswählen]
    C --> E[CSV verarbeiten]
    D --> E
    E --> F[Excel-Datei erzeugen]
    F --> G[Outlook-Vorschau mit Tabelleninhalt aus Ergebnisse öffnen]
    G --> H[Excel direkt in archive ablegen]
    H --> H2[Ergebnisdatei öffnen verfügbar]
    H2 --> I[Automatik wiederholen verfügbar]
    I --> J[Erneute Suche in App-, Desktop- und Downloads-Ordner]
    J --> K{Neue oder aktualisierte CSV gefunden?}
    K -- Ja --> E
    K -- Nein --> L[Keine weitere Aktion]
```

![Anwenderablauf](diagramme/anwender_ablauf.svg)

## Technischer Überblick

```mermaid
flowchart LR
    subgraph Eingabeorte
        A1[App-/EXE-Ordner]
        A2[Desktop]
        A3[Downloads]
    end

    subgraph Anwendung
        B1[GUI / Tkinter]
        B2[CSV-Normalisierung]
        B3[Excel-Erzeugung\nopenpyxl]
        B4[Outlook-Vorschau\nPowerShell + COM]
        B5[Archivierung\narchive/]
        B6[Statistik-Filter\nDatenschnitt/Tabellenfilter]
    end

    subgraph Artefakte
        C1[examinations.csv]
        C2[ICDL-Ergebnisse_*.xlsx]
        C3[archive/ICDL-Ergebnisse_*.xlsx]
        C4[Release-ZIP + Release Notes]
    end

    A1 --> C1
    A2 --> C1
    A3 --> C1
    B1 --> B2
    B2 --> B3
    B3 --> C2
    B3 --> B6
    C2 --> B4
    B4 --> B5
    B5 --> C3
    C3 --> C4
    B1 -->|Automatik wiederholen| A1
    B1 -->|Automatik wiederholen| A2
    B1 -->|Automatik wiederholen| A3
```

![Technischer Überblick](diagramme/technik_ueberblick.svg)

## Hinweise

- Die Mermaid-Quellen liegen zusätzlich als `.mmd`-Dateien unter `docs/diagramme/`.
- Die SVG-Diagramme eignen sich gut für Markdown und Release-Dokumentationen, weil sie verlustfrei skalieren und auch bei Vergrößerung scharf bleiben.
- Für die Build-Ausgabe werden die Doku-Dateien weiterhin mitkopiert; die Diagramm-Bilder liegen damit ebenfalls im Build.
