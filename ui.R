library(shiny)

shinyUI(fluidPage(
    titlePanel("CO2 Uptake Prediction and analysis"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("AmbCO2Conc", "Select the ambient CO2 concentrations in mL/L?",90,1000,value = 100),
            radioButtons("Plant","Select the Plant:",
                         c("Qn1"="Qn1",
                           "Qn2"="Qn2",
                           "Qn3"="Qn3",
                           "Qc1"="Qc1",
                           "Qc2"="Qc2",
                           "Qc3"="Qc3",
                           "Mn1"="Mn1",
                           "Mn2"="Mn2",
                           "Mn3"="Mn3",
                           "Mc1"="Mc1",
                           "Mc2"="Mc2",
                           "Mc3"="Mc3"),inline = TRUE),
            radioButtons("Type","Select the Type or Origin of Plant:",
                         c("Quebec"="Quebec",
                           "Mississippi"="Mississippi")),
            radioButtons("Treatment","Select the Treatment:",
                         c("nonchilled"="nonchilled",
                           "chilled"="chilled")),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Prediction", br(), 
                                 h3("Predicted CO2 uptake rates:"),
                                 textOutput("uptake_pred")),
                        tabPanel("Plots", br(), 
                                 h5("CO2 Uptake against concentrations"),
                                 h6("Note: Red dot is the predicted CO2 Uptake"),
                                 plotOutput("uptake_concplot"),
                                 h5("CO2 Uptake against Plant"),
                                 plotOutput("uptake_plantplot"),
                                 h5("CO2 Uptake against Type"),
                                 plotOutput("uptake_typeplot"),
                                 h5("CO2 Uptake against Treatment"),
                                 plotOutput("uptake_treatplot"),
                                h6("Note: Plot shows predicted output only in the CO2 uptake against concentrations. Other plots are only describing the data"))
    
        )
    )
)))
