---
title: Spell Checking Dictionaries
weight: 20
---

MocaccinoOS provides multilingual spell-checking dictionaries via the
`myspell-dicts` package group.

These dictionaries are used by applications such as:

- LibreOffice
- Firefox and Chromium
- Text editors (Kate, KWrite, etc.)
- Other GTK and Qt applications with spell checking

## Install all dictionaries

```bash
luet install app/myspel-dicts
```

This installs MySpell dictionaries for many languages, including:

Afrikaans, Bulgarian, Catalan, Czech, Danish, German, Greek, English,
Esperanto, Spanish, Estonian, French, Irish, Galician, Hebrew, Croatian,
Hungarian, Icelandic, Italian, Kazakh, Khmer, Lithuanian, Latvian,
Macedonian, Malay, Norwegian (Bokmål/Nynorsk), Dutch, Polish,
Portuguese (EU/BR), Romanian, Russian, Slovak, Slovenian, Swedish, Ukrainian.

## Usage

After installation, supported applications automatically detect available
dictionaries.

In most applications you can select the language via:

**Tools → Spell Checking Language**  
or  
**Right-click → Language**

## Notes

- Dictionaries are provided system-wide
- No configuration is required
- Multiple languages can be installed simultaneously
- The package group contains runtime data only (no development files)
