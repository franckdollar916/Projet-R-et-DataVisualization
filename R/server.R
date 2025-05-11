library(shiny)
library(ggplot2)
library(plotly)
library(leaflet)
library(dplyr)
library(lubridate)

server <- function(input, output) {
  
  # Histogramme interactif par Mois
  output$plot_mois <- renderPlotly({
    plot_ly(accidents, x = ~Mois, type = "histogram", marker = list(color = "steelblue")) %>%
      layout(title = "Nombre d'accidents par mois", xaxis = list(title = "Mois"), yaxis = list(title = "Nombre d'accidents"))
  })
  
  # Histogramme interactif par Heure
  output$plot_heure <- renderPlotly({
    accidents$Heure <- hour(accidents$HeureMinute)
    plot_ly(accidents, x = ~Heure, type = "histogram", nbinsx = 24, marker = list(color = "orange")) %>%
      layout(title = "Nombre d'accidents par heure", xaxis = list(title = "Heure"), yaxis = list(title = "Nombre d'accidents"))
  })
  
  # Barplot statique : Conditions de luminosité
  output$plot_luminosite <- renderPlot({
    ggplot(accidents, aes(x = factor(Lumiere))) +
      geom_bar(fill = "skyblue") +
      labs(title = "Accidents par condition de luminosité", x = "Luminosité", y = "Nombre d'accidents")
  })
  
  # Barplot statique : Conditions météorologiques
  output$plot_meteo <- renderPlot({
    ggplot(accidents, aes(x = factor(ConditionsAtmospheriques))) +
      geom_bar(fill = "salmon") +
      labs(title = "Accidents par condition météo", x = "Météo", y = "Nombre d'accidents")
  })
  
  # Carte leaflet des accidents filtrés par mois
  output$map_accidents <- renderLeaflet({
    data_filtered <- accidents %>% filter(Mois == input$mois_carte)
    
    if (nrow(data_filtered) == 0) {
      leaflet() %>% addTiles()
    } else {
      leaflet(data_filtered) %>%
        addTiles() %>%
        addCircleMarkers(
          lng = ~long,
          lat = ~lat,
          radius = 3,
          color = "red",
          stroke = FALSE,
          fillOpacity = 0.6,
          popup = ~paste("ID:", AccidentID)
        )
    }
  })
  
  # Barplot statique : Type de collision
  output$plot_collisions <- renderPlot({
    ggplot(accidents, aes(x = factor(TypeCollision))) +
      geom_bar(fill = "lightgreen") +
      labs(title = "Types de collisions", x = "Type", y = "Nombre")
  })
  
  # Barplot statique : Type d'intersection
  output$plot_intersections <- renderPlot({
    ggplot(accidents, aes(x = factor(Intersection))) +
      geom_bar(fill = "purple") +
      labs(title = "Types d'intersections", x = "Intersection", y = "Nombre")
  })
}

