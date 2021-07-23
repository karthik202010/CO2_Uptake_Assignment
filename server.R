library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model_uptake <- lm(uptake ~ conc, data = CO2)
    
    modelPred_uptake <- reactive({
        concInput <- input$AmbCO2Conc
        plantInput <- input$Plant
        typeInput <- input$Type
        treatmentInput <- input$Treatment
        predict(model_uptake, newdata = data.frame(conc = concInput, 
                                                   Plant = plantInput,
                                                   Type = typeInput,
                                                   Treatment = treatmentInput))
    })
    
    output$uptake_pred <- renderText({
        modelPred_uptake()
    })
    
    output$uptake_concplot <- renderPlot({
        concInput <- input$AmbCO2Conc
        
        plot(CO2$conc, CO2$uptake, xlab = "Ambient carbon dioxide concentrations(mL/L)",
             ylab = "CO2 uptake rates(umol/m^2 sec)", bty = "n", pch = 16,
             xlim = c(50,1500), ylim = c(0,100))
        
        points(concInput, modelPred_uptake(), col = "red", pch = 16, cex = 2)
    })
    output$uptake_plantplot <- renderPlot({
        plantInput <- input$Plant
        
        plot(CO2$Plant, CO2$uptake, xlab = "Plant",
             ylab = "CO2 uptake rates(umol/m^2 sec)", bty = "n", pch = 16,
              ylim = c(0,100))
        #points(CO2$Plant, CO2$uptake, col = "blue", pch = 16, cex = 2)
        #points(plantInput, modelPred_uptake(), col = "blue", pch = 16, cex = 2)
    })
    output$uptake_typeplot <- renderPlot({
        typeInput <- input$Type
        
        plot(CO2$Type, CO2$uptake, xlab = "Type",
             ylab = "CO2 uptake rates(umol/m^2 sec)", bty = "n", pch = 16,
              ylim = c(0,100))
        
        #points(typeInput, modelPred_uptake(), col = "green", pch = 16, cex = 2)
    })
    
    output$uptake_treatplot <- renderPlot({
        treatmentInput <- input$Treatment
        
        plot(CO2$Treatment, CO2$uptake, xlab = "Treatment",
             ylab = "CO2 uptake rates(umol/m^2 sec)", bty = "n", pch = 16,
              ylim = c(0,100))
        
        #points(treatmentInput, modelPred_uptake(), col = "orange", pch = 16, cex = 2)
    })

})
