# server.R
# Bastiaan Quast
# bquast@gmail.com

# load shiny package
library(shiny)

# load other packages
library(ggvis)

# interactive server code
shinyServer(
  function(input, output) {
    
    # A reactive expression wrapper for input$size
    input_general.span <- reactive(input$general.span)
    input_species.span <- reactive(input$species.span)
    input_size <- reactive(input$size)
    input_opacity <- reactive(input$opacity)
    
    iris %>%
      ggvis(~Sepal.Width, ~Sepal.Length) %>%
      layer_smooths(span = input_general.span, se = TRUE) %>%
      group_by(Species) %>%
      layer_points(size := input_size, opacity := input_opacity, fill = ~Species) %>%
      layer_smooths(span = input_species.span, fill = ~Species, se=TRUE) %>%
      add_axis("x", title = "Sepal Width") %>%
      add_axis("y", title = "Sepal Length") %>%
      bind_shiny("ggvis", "ggvis_ui"
            )
    
    })