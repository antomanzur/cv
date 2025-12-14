# CV - Mateo Maccarone

My personal CV built with [Typst](https://typst.app/), a modern typesetting system.

## 📄 Files

| File | Description |
|------|-------------|
| `cv.typ` | Source file (Typst markup) |
| `Mateo_Maccarone_CV.pdf` | Compiled PDF (auto-generated) |

## 🚀 Quick Start

### Option 1: Typst CLI

```bash
# Install Typst (using cargo)
cargo install typst-cli

# Or on macOS
brew install typst

# Or on Windows (winget)
winget install --id Typst.Typst

# Compile the CV
typst compile cv.typ
```

### Option 2: Typst Web App

1. Go to [typst.app](https://typst.app/)
2. Create a new project
3. Copy the contents of `cv.typ`
4. The PDF will render automatically

### Option 3: VS Code

1. Install the [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) extension
2. Open `cv.typ`
3. Press `Ctrl+K V` to preview

## 🔄 Auto-Build (GitHub Actions)

This repository includes a GitHub Action that automatically compiles `cv.typ` to `cv.pdf` whenever changes are pushed to the `main` branch.

**How it works:**
1. Push changes to `cv.typ`
2. GitHub Actions runs `typst compile cv.typ cv.pdf`
3. The updated PDF is committed back to the repository

> **Note:** Make sure your repository has "Read and write permissions" enabled in:  
> Settings → Actions → General → Workflow permissions

## 🛠️ Customization

### Change Colors

Edit the accent colors at the top of `cv.typ`:

```typst
#let accent = rgb("#2563eb")  // Section titles & lines
#let muted = rgb("#64748b")   // Dates & subtitle
```

### Change Font

Modify the font in the document setup:

```typst
#set text(
  font: "New Computer Modern",  // Change this
  size: 10pt,
)
```

Popular alternatives: `"IBM Plex Sans"`, `"Source Sans Pro"`, `"Fira Sans"`

### Adjust Margins

```typst
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 1cm),  // Horizontal and vertical margins
)
```

## 📚 Resources

- [Typst Documentation](https://typst.app/docs/)
- [Typst GitHub](https://github.com/typst/typst)
- [Typst Templates](https://typst.app/universe)

## 📝 License

Feel free to use this template for your own CV.

