library(shiny)
library(HistData)
data(GaltonFamilies)

chLm<-lm(childHeight~father+mother+#midparentHeight+
           children+gender,data=GaltonFamilies)

shinyServer(
  function(input, output) {
    
    father<-reactive({
      ifelse(input$genderID=='male',
             input$yourHeightID,input$partnerHeightID)
      
    })
    
    mother<-reactive({
      ifelse(input$genderID=='male',
             input$partnerHeightID,input$yourHeightID)})
    
    predData<-reactive({
      data.frame(father=father(),mother=mother(),gender=input$childGenderID
                 ,children=input$numChildrenID+1
                 #,midparentHeight=(((father()+
                                                                        #      mother())/2))
                 )
      
    })
    

    output$ogenderID <- renderPrint({input$genderID})
    output$ochildGenderID <- renderPrint({input$childGenderID})
    output$oyourHeightID <- renderPrint({paste(input$yourHeightID,"Inches",sep=" ")})
    output$opartnerHeightID <- renderPrint({paste(input$partnerHeightID,"Inches",sep=" ")})
    output$onumChildrenID <- renderPrint({input$numChildrenID})
    output$prediction<-renderPrint(
      {predData1<-predData()
    paste(round(predict(chLm,newdata=predData1,class="response")),"Inches",sep=" ")})
#     output$newHist<-renderPlot({
#       plot(GaltonFamilies$midparentHeight,GaltonFamilies$childHeight,
#       xlab="MidParent Height",ylab="Child Height",main="Raw GaltonFamilies Data")
   
   #})
  }
)
