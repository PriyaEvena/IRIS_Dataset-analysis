#how to use selectInput widget 
library("shiny") #loading shiny package
#define UI for Shiny App
shinyUI(fluidPage(
 #Application Title Panel
    titlePanel(title=h4("Exploring Iris Dataset", align="center")),
 #Sidebar Panel
 sidebarLayout(position = "left",
     sidebarPanel(
      selectInput("feature1","1. Select the First Feature from the Iris dataset:",choices=c("Sepal.Length" = 1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4),selected = 1),
      selectInput("feature2","2. Select the Second Feature from the Iris dataset:",choices=c("Sepal.Length" = 1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4),selected = 1),
      sliderInput("bins","3. Select the no. of BINs for Histogram",min=5, max=25, value=15),
      radioButtons("color","4. Select the colour of Histogram",choices=c("Red","Green","Yellow","Blue"), selected = "Green")
      ),
  
    #Main Panel
     mainPanel(
       tabsetPanel(type = "tab",
              tabPanel("Summary", verbatimTextOutput("mySummary")),
              tabPanel("Structure",verbatimTextOutput("myStr")),
              tabPanel("Data",tableOutput("myData")),
              tabPanel("Histogram",plotOutput("myhist")),
              tabPanel("Scatter Plot",plotOutput("myScatter")),
              tabPanel("Linear Regression",verbatimTextOutput("mylm")),
              #tabPanel("LM Summary",verbatimTextOutput("mylm1"))
              tabPanel("LM Summary",plotOutput("mylm1"))
             )
      )
  )#sidebarLayout
 )#fluidpage
)
