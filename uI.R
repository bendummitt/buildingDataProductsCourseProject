

library(shiny)
library(HistData)

shinyUI(pageWithSidebar(
  headerPanel("How Tall Will Your Child Be?"),
  sidebarPanel(
    helpText("This application predicts the final adult height of your child based upon your height, your spouse's height, the gender of the child, and the number of children you currently have. Enter this information below and see how tall your child will be!")
    ,selectInput("genderID","What is your gender?",choices=c("male","female"),selected="male"),
    selectInput("childGenderID","What is the gender of your child?",choices=c("male","female"),selected="female"),
    numericInput("yourHeightID","What is your height (in inches)?",value=0),
    numericInput("partnerHeightID","What is your partner's height (in inches)?",value=0),
    numericInput("numChildrenID","How many children do you currently have?",value=0,min=0,max=20,step=1),
    submitButton("Predict!", icon = NULL)
    
  ),
  mainPanel(
    h3('Prediction Result'),
    h4('You entered your gender as:'),
    verbatimTextOutput("ogenderID"),
    h4('You entered the gender of your child as:'),
    verbatimTextOutput("ochildGenderID"),
    h4('You entered your height as:'),
    verbatimTextOutput("oyourHeightID"),
    h4('You entered your partners height as:'),
    verbatimTextOutput("opartnerHeightID"),
    h4('You entered the number of children you currently have as:'),
    verbatimTextOutput("onumChildrenID"),
    h4('Based on this information, we predict that your childs height will be'),
    verbatimTextOutput("prediction"),
    #plotOutput('newHist')
    img(src="kid.jpg",height=200,width=300)
  )
))
