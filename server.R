
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
    output$paramInputs <- renderUI({
        validate(
            need(!is.null(input$distType), "Please select a distribution type")
            )
        if(input$distType %in% c('norm', 'lnorm')) {
            list(numericInput('param1', "Mean", value = 0),
                 numericInput('param2', "Standard Deviation", value = 1),
                 helpText("Type: Continuous"))
        } else if(input$distType == 'binom') {
            list(numericInput('param1', "Number of Trial (integer > 0)",
                              value = 10, min = 1, step = 1),
                 numericInput('param2', "Prob. of Success (between 0~1)",
                              value = 0.5, min = 0, max = 1),
                 helpText("Type: Discrete"))
        } else if(input$distType == 'unif') {
            list(numericInput('param1', "Lower Bound", value = 0),
                 numericInput('param2', "Upper Bound", value = 1),
                 helpText("Type: Continuous"))
        } else {
            helpText("Unknown distribution")
        }
    })
    
    samples <- reactiveValues(val = NULL)
    message <- reactiveValues(val = NULL)
    
    # Monitoring action button on UI
    observeEvent(input$do_plot, {
        validate(
            need(is.integer(input$numSamples), "Please input valid sample size")
        )
        
        # Construct random sampling function for given distribution
        dist_func <- get(paste("r", input$distType, sep = ''))
        params <- c(input$numSamples)
        # Add two params in order
        if (!is.null(input$param1)){
            params <- c(params, input$param1)

            if (!is.null(input$param2) ){
                params <- c(params, input$param2)
                message$val <- paste("DEBUG: 2 distribution param. received: ",
                                     paste(params, collapse = ", "))
            } else {
                message$val <- paste("DEBUG: 1 distribution param. received: ",
                                     paste(params, collapse = ", "))
            }
        } else {
            # Ignore 2nd param if 1st is invalid
            message$val <- "Warning: invalid params received, use defaults"
        }
        
        samples$val <- do.call(dist_func, as.list(params))
    })
    
    output$distPlot <- renderPlot({
        if(is.null(samples$val)) return()
        
        hist(samples$val, prob = TRUE, col = 'grey',
             main = paste("Probability distribution of", input$distType, "with",
                          input$numSamples, "samples",
                          collapse = " "),
             xlab = "Sample Values", ylab = "Probability/Density")
        #legend('topright', c("Mean", "Density Curve"), fill = c('red', 'blue'))
        
             
        if('disp_mean' %in% input$opt) {
            abline(v = mean(samples$val), col = 'red', lwd = 2)
            legend('topright', c("Mean"), fill = c('red'))
        }
        if('disp_density' %in% input$opt) {
            lines(density(samples$val), col = 'blue', lwd = 2)
            legend('topright', inset=c(0, 0.1),
                   c("Density Curve"), fill = c('blue'))
        }
    })
    
    output$msg <- renderText({
        if(is.null(message$val)) return()
        
        message$val
    })
})

