

shinyUI(pageWithSidebar(

      headerPanel("Estimating VO2 max[in mL/(kg.mim)] using 1 Mile Walk Test"),
     
      sidebarPanel(
            helpText("VO2 max stands for maximal oxygen consumption.",
                     "To obtain a predicted VO2max enter your gender, weight in Pound,age, time to run one mile (1600m)",
                     " heart rate at the end of the run and then press the 'submit' button ."),
             radioButtons('G', "Gender",
                         c("Male" = 1, "Female" = 0
                                        ), inline = TRUE),
             #radioButtons('WU', "Weight Unit",c("Pound" = "P", "Kilogram" = "K"), inline = TRUE),
             numericInput("W", "Weight in Pound:", 160, min = 90, max = 350, step = 1),
             
             #sliderInput("weight", "Weight:", min=30, max=300, value=70), 
             sliderInput("A", "Age:", min=15, max=80, value=30),
            
             
             #numericInput('id2','Weight', 45, min = 30, max = 500, step = 1),
             sliderInput("Mn", "Test completion time minutes:", min=3, max=20, value=9),
             sliderInput("Sc", "Test completion time seconds:", min=0, max=59, value=0),
             
             sliderInput("Pc", "heart rate beats/minute", min =60, max =240, value=100),
             #sliderInput('inputId', "slider", 30, 300, 30, step = 1,round = TRUE,  locale = "us",ticks = TRUE, animate = FALSE),
             
            #dateInput("date", "Date:")
            submitButton('Submit')
      ),
      mainPanel(
            h3('Predicted VO2max'),
            verbatimTextOutput("prediction")
      )
      #wellPanel(
            #helpText(   a("Click Here to find information and instruction",     href="http://www.uni.edu/dolgener/Fitness_Assessment/CV_Fitness_Tests.pdf")
            #)
))
