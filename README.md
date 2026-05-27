# Hebrew Text Fixer for Affinity Canvas

A Windows GUI application that fixes Hebrew text direction issues for use with Affinity Canvas 3, which doesn't handle Hebrew text correctly.

## Problem

Affinity Canvas 3 reverses Hebrew text, making it appear backwards. Additionally, nikud (vowel marks) get misplaced. This tool fixes both issues by:

1. **Reversing individual Hebrew words** to fix character order
2. **Reversing word order** so Affinity displays the correct sequence
3. **Correctly positioning nikud marks** relative to their base characters

## Features

- ✅ Reverses Hebrew words individually with correct nikud positioning
- ✅ Reverses word order for Affinity Canvas compatibility
- ✅ Supports multiple file formats: TXT, DOCX, ODT
- ✅ Preserves document formatting when possible
- ✅ Simple drag-and-drop GUI interface
- ✅ Real-time preview before saving

## Installation

### Option 1: Windows Installer (Recommended)

1. Download the latest installer from the [Releases page](https://github.com/DieLewe/hebrew-text-fixer/releases)
2. Run `HebrewTextFixer-Setup-v1.0.exe`
3. Follow the installation wizard
4. The app will be available in your Start Menu and (optionally) Desktop

### Option 2: Standalone Executable

1. Download `HebrewTextFixer.exe` from the [Releases page](https://github.com/DieLewe/hebrew-text-fixer/releases)
2. Run the executable directly (no installation needed)

### Option 3: Run from Source

#### Prerequisites

- Windows 10 or later
- Python 3.8 or later

#### Setup

1. Clone or download this repository
2. Open a terminal in the project folder
3. Create and activate a virtual environment (recommended):
   ```powershell
   python -m venv .venv
   .venv\Scripts\activate
   ```
4. Install dependencies:
   ```powershell
   pip install -r requirements.txt
   ```

## Usage

### Running the Application

```powershell
python hebrew_fixer.py
```

Or if using the virtual environment:
```powershell
.venv\Scripts\python.exe hebrew_fixer.py
```

### Using the Application

1. **Open File**: Click "📂 Open File..." and select your document (TXT, DOCX, or ODT)
2. **Preview**: The processed text will appear in the preview window
3. **Toggle**: Uncheck "Reverse Hebrew words" to see the original text
4. **Choose Format**: Select output format (TXT, DOCX, or ODT)
5. **Save**: Click "💾 Save Output..." to save the corrected file
6. **Use in Affinity**: Copy the corrected text and paste into Affinity Canvas 3

## Example

**Original Hebrew text:**
```
שלום עולם טוב
```

**After processing (ready for Affinity Canvas):**
```
בוט םלוע םולש
```

**Result in Affinity Canvas:**
When you paste the processed text into Affinity Canvas, it will reverse it again, displaying the correct text: "שלום עולם טוב"

The tool does a "double reversal" - reversing both individual words AND word order - so that when Affinity Canvas reverses it, you get the correct result.

## Supported Formats

- **TXT**: Plain text files (UTF-8 encoding)
- **DOCX**: Microsoft Word documents (preserves formatting)
- **ODT**: OpenDocument Text (preserves formatting)
- **RTF**: Not directly supported (convert to TXT or DOCX first)

## Technical Details

The application uses:
- **PyQt5**: GUI framework
- **python-docx**: DOCX file handling
- **odfpy**: ODT file handling
- **regex**: Unicode-aware Hebrew text processing

### How It Works

1. Identifies Hebrew text using Unicode properties
2. Groups Hebrew text into phrases (contiguous Hebrew sections)
3. For each phrase:
   - Extracts individual words
   - Reverses each word (with proper nikud handling)
   - Reverses the order of words in the phrase
4. Preserves all non-Hebrew text and spacing unchanged

This "double reversal" compensates for Affinity Canvas's incorrect Hebrew handling.

## Building from Source

### Build Standalone Executable

1. Install dependencies:
   ```powershell
   pip install -r requirements.txt
   pip install pyinstaller
   ```

2. Build the executable:
   ```powershell
   pyinstaller --clean hebrew_fixer.spec
   ```

3. The executable will be in `dist\HebrewTextFixer.exe`

### Build Windows Installer

1. Download and install [Inno Setup](https://jrsoftware.org/isdl.php)

2. Build using the provided script:
   ```powershell
   .\build.ps1
   ```

3. Or build manually:
   ```powershell
   & "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" installer.iss
   ```

4. The installer will be in `installer\HebrewTextFixer-Setup-v1.0.exe`

## Troubleshooting

### "python-docx not installed" error
```powershell
pip install python-docx
```

### "odfpy not installed" error
```powershell
pip install odfpy
```

### Font not displaying correctly
Install a Hebrew font like:
- David
- Frank Ruehl
- Ezra SIL (free)

### Virtual environment not activating
On Windows, if script execution is disabled:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## License

This project is free to use for personal and commercial purposes.

## Contributing

Suggestions and improvements welcome! Please test with various Hebrew texts including:
- Modern Hebrew (without nikud)
- Biblical Hebrew (with nikud)
- Mixed Hebrew and English text

## Credits

Created to solve Hebrew text direction issues in Affinity Canvas 3.
