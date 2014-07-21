# ui.R
# Bastiaan Quast
# bquast@gmail.com

library(shiny)
library(ggvis)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris: Sepal-Ratio Modeling"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Sidebar panel
    sidebarPanel(
      h3('Controls'),
      sliderInput('general.span', 'General Model', 0.5, 1, value=0.5),
      sliderInput('species.span', 'Individual Models', 0.5, 1, value = 0.5),
      sliderInput("size", "Point Size", 10, 200, value = 50),
      sliderInput('opacity', "Point Opacity", 0, 1, value = 0.5),
      p('The controls can be used the wigglyness of the general model, as well as the models fitted for each species. Thereby seeing if separate models are needed.
        Furthermore, the size and opacity of the points plotted can be adjusted to most effectively communicate the results of the model comparison.
        ')
    ),
    
    # Main panel
    mainPanel(
      h3('We want to model sepal ratios, do we need separate models for each species?'),
      uiOutput("ggvis_ui"),
      ggvisOutput("ggvis"),
      p('Sepal width and sepal length are compared for three different species of flower.
        A model is fitted through all observations, as well a three separate models each species.
        The standard error is displayed as a coloured band around the models, whereby the grey band is represents the model fitted on all observations, and the coloured bands represent the models fitten on the respective species.
        ')
    )
  ))
)