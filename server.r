library(shiny)
shinyServer(
      function(input, output) {
                  weight <- reactive({as.numeric(input$W)})
                  age <- reactive({as.numeric(input$A)})
                  gender <- reactive({as.numeric(input$G) })
                  Minutes <- reactive({as.numeric(input$Mn)})
                  Secondes <- reactive({as.numeric(input$Sc)})
                  beat_ps <- reactive({as.numeric(input$Pc)})
                  
                  vomax <- function(W,A,G,Mn,Sc,Pc) {132.853 - 0.0769*W - 0.3877*A + 6.315*G - 3.2649*Mn - (3.2649/60)*Sc - 0.1565*Pc  }
                  #vomax <- reactive(function(W,A,G,Mn,Sc,Pc) {132.853 - 0.0769*W - 0.3877*A + 6.315*G - 3.2649*Mn - (3.2649/60)*Sc - 0.1565*Pc  })
                  
            output$prediction <- renderPrint({vomax(weight(),age(), gender(), Minutes(), Secondes(), beat_ps() )})
            #output$prediction <- renderPrint({132.853 - 0.0769*weight() - 0.3877*age() + 6.315*gender() - 3.2649*Minutes() - (3.2649/60)*Secondes() - 0.1565*beat_ps()})
            
      }
)