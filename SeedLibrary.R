# Load necessary libraries
library(shiny)
library(shinydashboard)
library(DT)
library(polished)

# Sample data (seed catalog)
seed_data <- data.frame(
  Seed = c("Tomato", "Cucumber", "Lettuce", "Carrot", "Pepper"),
  Plant_Type = c("Vegetable", "Vegetable", "Vegetable", "Vegetable", "Vegetable"),
  Difficulty = c("Easy", "Medium", "Easy", "Medium", "Hard"),
  Availability = c("Available", "Out of Stock", "Available", "Available", "Out of Stock"),
  stringsAsFactors = FALSE
)

# UI definition
ui <- dashboardPage(
  dashboardHeader(title = "Seed Library"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Seed Catalog", tabName = "catalog", icon = icon("leaf")),
      menuItem("Request Seeds", tabName = "request", icon = icon("clipboard-list"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # Home Tab
      tabItem(tabName = "home",
              h1("Welcome to the Seed Library!"),
              p("Explore a wide variety of seeds available for gardening."),
              img(src = "https://via.placeholder.com/800x400.png", height = 300)
      ),
      
      # Seed Catalog Tab
      tabItem(tabName = "catalog",
              h2("Browse Our Seed Catalog"),
              selectInput("plantType", "Select Plant Type:", 
                          choices = c("All", unique(seed_data$Plant_Type)), selected = "All"),
              selectInput("difficulty", "Select Difficulty Level:", 
                          choices = c("All", unique(seed_data$Difficulty)), selected = "All"),
              DTOutput("seedTable")
      ),
      
      # Request Seeds Tab
      tabItem(tabName = "request",
              h2("Request Seeds"),
              textInput("name", "Your Name:", ""),
              email_input("email", "Your Email:", ""),
              textAreaInput("request", "Seed Request:", placeholder = "Which seeds are you interested in?"),
              actionButton("submit", "Submit Request")
      )
    )
  )
)

# Server function
server <- function(input, output) {
  
  # Filtered data for the catalog
  filtered_data <- reactive({
    req(input$plantType, input$difficulty)
    data <- seed_data
    if (input$plantType != "All") {
      data <- data[data$Plant_Type == input$plantType, ]
    }
    if (input$difficulty != "All") {
      data <- data[data$Difficulty == input$difficulty, ]
    }
    return(data)
  })
  
  # Render the seed catalog table
  output$seedTable <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 5))
  })
  
  # Handle the seed request form submission
  observeEvent(input$submit, {
    showModal(modalDialog(
      title = "Request Submitted",
      paste("Thank you, ", input$name, "! Your request for seeds has been received."),
      easyClose = TRUE,
      footer = NULL
    ))
  })
}

# Run the Shiny app
shinyApp(ui, server)

#Test