# 🚗 Dashboard des Accidents de la Route en France (2022)

Ce projet propose un tableau de bord interactif développé en **R avec Shiny** pour analyser les **accidents corporels de la circulation en France en 2022**. Il s’appuie sur des données ouvertes du Ministère de l’Intérieur et permet d'explorer visuellement les tendances **temporelles**, **météorologiques**, **géographiques** et **typologiques** des accidents.

---

## 📘 User Guide

### 🧰 Prérequis

- **R** version ≥ 4.2
- **RStudio** (recommandé)
- Connexion Internet pour télécharger automatiquement les données
- Packages R utilisés :
  - shiny
  - dplyr
  - readr
  - plotly
  - leaflet
  - ggplot2
  - lubridate

### 🔧 Installation

1. Clonez ce dépôt :

```bash
git clone https://github.com/franckdollar916/Projet-R-et-DataVisualization.git
cd Projet-R-et-DataVisualization
Dans RStudio, installez les packages requis :

r
Copier
Modifier
install.packages(c("shiny", "dplyr", "readr", "plotly", "leaflet", "ggplot2", "lubridate"))
▶️ Lancer l'application
r
Copier
Modifier
shiny::runApp()
L'application s'ouvrira dans votre navigateur à l'adresse http://127.0.0.1:xxxx

📊 Data
📝 Description
Nom du jeu de données : Base de données des accidents corporels de la circulation

Producteur de données : Ministère de l’Intérieur – Délégation à la sécurité routière (DSR)

Période : Année 2022

Licence : ODbL (Open Database License)

🔗 URL officielle du jeu de données
https://www.data.gouv.fr/fr/datasets/base-de-donnees-des-accidents-corporels-de-la-circulation/

📂 Structure des fichiers
Fichier	Rôle
data/raw/dataset.csv	Données brutes téléchargées automatiquement
data/cleaned/cleaned_dataset.csv	Données nettoyées prêtes à l'analyse

🧑‍💻 Developer Guide
📁 Arborescence du projet
pgsql
Copier
Modifier
Projet-R-et-DataVisualization/
├── app.R
├── R/
│   ├── global.R
│   ├── ui.R
│   ├── server.R
│   └── helpers.R
├── data/
│   ├── raw/
│   └── cleaned/
├── requirements.txt
├── README.md
└── .gitignore
🧠 Diagramme de l’architecture (Mermaid)
mermaid
Copier
Modifier
graph TD
    A[app.R] --> B[global.R]
    A --> C[ui.R]
    A --> D[server.R]
    B --> E[helpers.R]
    D -->|utilise| F[(cleaned_dataset.csv)]
    C -->|affiche| G[UI]
    D -->|rend| G
➕ Ajouter un graphique
Ajouter output$... <- renderPlot() dans server.R

Ajouter plotOutput("...") dans ui.R

📈 Rapport d’analyse
🔹 Analyse temporelle
Les mois de mai à août enregistrent les pics d’accidents.

Les heures de pointe (8h, 17h) sont les plus accidentogènes.

🔹 Conditions environnementales
La majorité des accidents surviennent en journée.

Les conditions pluvieuses ou perturbées augmentent significativement les risques.

🔹 Localisation géographique
Forte concentration dans les grandes agglomérations (Paris, Lyon, Marseille).

Corrélation avec densité de trafic.

🔹 Types de collision
Collisions arrière et latérales sont les plus fréquentes.

Les intersections sont souvent le théâtre d'accidents.

📦 requirements.txt
Liste des packages R utilisés dans ce projet :

rust
Copier
Modifier
shiny
dplyr
readr
plotly
leaflet
ggplot2
lubridate
🔒 Licence et déclaration
Je déclare sur l'honneur que ce projet a été réalisé intégralement par moi-même dans le cadre d'un travail académique, à l'exception des lignes de code standards provenant des documentations officielles des packages R mentionnés.

Attribution obligatoire en cas de réutilisation des données :
Licence ODbL © Ministère de l’Intérieur, DSR

🔗 URL du dépôt GitHub
https://github.com/franckdollar916/Projet-R-et-DataVisualization.git

Ce dépôt contient l’ensemble du code source, les fichiers de données nettoyées, les scripts et la documentation nécessaires à l’exécution du projet.
