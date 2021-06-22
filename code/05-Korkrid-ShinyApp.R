# A Shiny app is a web page (UI) connected to a computer running a live R session (Server)
# App template
library(shiny) 

# ui - nested R functions that assemble an HTML user interface for your app 
ui <- fluidPage()

# server - a function with instructions on how to build and rebuild the R objects displayed in the UI 
server <- function(input, output){}

# shinyApp - combines ui and server into a functioning app. Wrap with runApp() if calling from a sourced script 
# or inside a function
shinyApp(ui = ui, server = server)

