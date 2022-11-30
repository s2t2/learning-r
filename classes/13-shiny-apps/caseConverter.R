library(shiny)
library(tidyverse)

ui <- fluidPage(

  sidebarLayout(

    sidebarPanel(
      textInput(
        inputId = "inputText",
        label = "Input text to convert:"
      )
    ),

    mainPanel(

      h3("Lower case:"),
      textOutput(
        outputId = "lowercaseText"
      ),
      
      h3("Upper case:"),
      textOutput(
          outputId = "uppercaseText"
      )

    )
  )
)

server <- function(input, output, session) {

  output$lowercaseText <- renderText({
      tolower(input$inputText)
  })
  
  output$uppercaseText <- renderText({
      toupper(input$inputText)
  })

}

shinyApp(ui, server)
