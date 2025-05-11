library(shiny)
library(plotly)
library(leaflet)

ui <- fluidPage(
  
  titlePanel("🚗 Dashboard des Accidents de la Route en France (2022)"),
  
  br(),
  h3("1. Étude Temporelle"),
  fluidRow(
    column(6, plotlyOutput("plot_mois")),
    column(6, plotlyOutput("plot_heure"))
  ),
  
  br(),
  h3("2. Conditions Environnementales"),
  fluidRow(
    column(6, plotOutput("plot_luminosite")),
    column(6, plotOutput("plot_meteo"))
  ),
  
  br(),
  h3("3. Localisation Géographique des Accidents"),
  selectInput("mois_carte", "Sélectionnez un mois :", choices = 1:12, selected = 1),
  leafletOutput("map_accidents", height = "600px"),
  
  br(),
  h3("4. Types de Collisions"),
  fluidRow(
    column(6, plotOutput("plot_collisions")),
    column(6, plotOutput("plot_intersections"))
  )
)

