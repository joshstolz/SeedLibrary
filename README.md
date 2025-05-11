# 🌱 Seed Library

A community-focused R Shiny web application to help local seed libraries manage and share seed collections. This app makes it easy to browse available seeds, request donations, and engage with a network of home gardeners and growers.

## 🚀 Features
- Interactive seed catalog with filters and search
- Planting tips, images, and seasonal guidance
- Seed request and donation forms
- Admin panel for managing seed entries
- Mobile-friendly responsive design

## 🛠️ Built With
- R + Shiny
- Tidyverse
- DT (DataTables)
- Shinythemes or Bootstrap (optional styling)
- Google Sheets or CSV backend (optional data storage)

## 📦 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/joshstolz/SeedLibrary.git
cd SeedLibrary
```

### 2. Install Dependencies
In R:
```r
install.packages(c("shiny", "DT", "tidyverse", "readr", "shinythemes"))
```

### 3. Run the App
```r
shiny::runApp("app")
```

## 📁 Folder Structure
```
SeedLibrary/
├── app.R               # Main Shiny app
├── data/               # Seed data (CSV or Google Sheets)
├── www/                # Custom CSS or image assets
└── README.md           # Project documentation
```

## 🤝 Contributing
We welcome contributions! If you'd like to suggest features or improvements, please [open an issue](https://github.com/joshstolz/SeedLibrary/issues) or submit a pull request.

## 📜 License
MIT License. See `LICENSE` file for details.

## ❤️ Credits
Created by [Josh Stolz](https://github.com/joshstolz) to support his wife's community seed library and promote sustainable local gardening.
