#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


# load packages
library(shiny)
library(ggplot2)
library(dplyr)

#load in data
bcl <- read.csv("data/bcl-data.csv", stringsAsFactors = FALSE)

#ui
ui <- fluidPage(
  titlePanel("BC Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(0, 100), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput"),
      uiOutput("subtypeOutput"),                     #added to create a subtype dropdown widget
      img(src = "beer.png", height = 200,
          width = 200, align = "center")             #added beer image
    ),
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)

server <- function(input, output) {
  output$countryOutput <- renderUI({
    selectInput("countryInput", "Country",
                c("ALL", sort(unique(bcl$Country))), # change code to add an ALL column
                selected = "ALL")                    # change ALL to default
  })


# Render subtype dropdown based on selected type
  output$subtypeOutput <- renderUI({
    if (is.null(input$typeInput)) {
      return(NULL)
    }


# Get subtypes from the bcl table and define "ALL" for widget option
    subtypes_for_type <- c("ALL", unique(bcl$Subtype[bcl$Type == input$typeInput]))

    selectInput("subtypeInput", "Subtype",
                choices = subtypes_for_type,
                selected = "ALL")                   #select ALL to default
  })


  filtered <- reactive({
    if (is.null(input$countryInput)) {
      return(NULL)
    }

    bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
                                                    # Change countryInput and subtypeInput to reflect "ALL"
             (input$countryInput == "ALL" | Country == input$countryInput),
             (input$subtypeInput == "ALL" | Subtype == input$subtypeInput)
      )
  })

  output$coolplot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    ggplot(filtered(), aes(Alcohol_Content)) +
      geom_histogram(fill = "#FFCC00", color = "grey")
  })


  output$results <- renderTable({
    filtered()
  })
}


shinyApp(ui = ui, server = server)
