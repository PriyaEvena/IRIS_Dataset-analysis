library("shiny") #loading shiny package
#define UI for Shiny App
shinyServer(
  function(input,output){
    output$mySummary <- renderPrint({
      summary(iris)
    })
    
    output$myStr <- renderPrint({
      str(iris)
    })
    
    output$myData <- renderTable({
      x <- as.numeric(input$feature1)
      y <- as.numeric(input$feature2)
      iris[,c(x,y)]
      #head(iris)
    })
    
    output$myhist <- renderPlot({
      colm <- as.numeric(input$feature1)
      hist(iris[,colm], breaks=seq(0,max(iris[,colm]),l=input$bins+1), col=input$color, main = "Histogram of iris Dataset",xlab = names(iris[colm]))
      
  })
  
    output$myScatter <- renderPlot({
      attach(iris)
      x <- as.numeric(input$feature1)
      y <- as.numeric(input$feature2)
      plot(iris[,x], iris[,y],pch = 19, 
           main = "Iris Data Set",
           xlab = names(iris[x]),
           ylab = names(iris[y]),
           cex = 1.1)
      
    })
    
      
    #output$mylm <- renderTable({
     # attach(iris)
      #x <- as.numeric(input$feature1)
      #y <- as.numeric(input$feature2)
      #Iris.lm1 <- lm(iris[,x] ~ iris[,y])
      #summaryTable <- data.frame(n = tapply(iris[,x], iris[,y], length), 
       #                          mean = tapply(iris[,x], iris[,y], mean),
      #                           sd = tapply(iris[,x], iris[,y], sd))
      #summaryTable
    #})
    output$mylm <- renderPrint({
      attach(iris)
      x <- as.numeric(input$feature1)
      y <- as.numeric(input$feature2)
      Iris.lm1 <- lm(iris[,x] ~ iris[,y])
      #summaryTable <- data.frame(n = tapply(iris[,x], iris[,y], length), 
                                # mean = tapply(iris[,x], iris[,y], mean),
                                # sd = tapply(iris[,x], iris[,y], sd))
      #summaryTable
      summary(Iris.lm1)
    })
    
    output$mylm1 <- renderPlot({
      x <- as.numeric(input$feature1)
      y <- as.numeric(input$feature2)
      Iris.lm1 <- lm(iris[,x] ~ iris[,y])
      summaryTable <- data.frame(n = tapply(iris[,x], iris[,y], length), 
                                 mean = tapply(iris[,x], iris[,y], mean),
                                 sd = tapply(iris[,x], iris[,y], sd))
      #summary(Iris.lm1)
      par(mfrow=c(2,2))
      plot(Iris.lm1)
      
    })
})
