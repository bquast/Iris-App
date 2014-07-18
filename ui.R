# ui.R
# Bastiaan Quast
# bquast@gmail.com

library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris:"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Sidebar panel
    sidebarPanel(
      h3('Controls'),
      sliderInput('general.span', 'General Model', 0.5, 1, value=0.5),
      sliderInput('species.span', 'Individual Models', 0.5, 1, value = 0.5),
      sliderInput("size", "Point Size", 10, 1000, value = 100),
      sliderInput('opacity', "Point Opacity", 0, 1, value = 0.5)
    ),
    
    # Main panel
    mainPanel(
      uiOutput("ggvis_ui"),
      ggvisOutput("ggvis"),
      h3('Plot'),
      p('Sepal width and sepal length are compared for three different species of flower.
        A model is fitted through all observations, as well a three separate models each species.
        The standard error is displayed as a coloured band around the models, whereby the grey band is represents the general model, and the coloured bands represent the respective spcies.
        '),
      p('The controls can be used the wigglyness of the general model, as well as the models fitted for each species. Thereby seeing if separate models are needed.
        Furthermore, the size and opacity of the points plotted can be adjusted to most effectively communicate the results of the model comparison.
        ')
    )
  ))
)