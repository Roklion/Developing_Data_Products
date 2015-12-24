
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# This Shiny web application can be used to take samples from various
# classic probability distributions with different parameters input/selected on
# this UI. The samples are then plotted on this UI.
#
# This application is a useful tool to learn process of sampling, as well as 
# basic probability distribution.

library(shiny)

APP_TITLE <- "Probability Distribution Sampler"

shinyUI(fluidPage(
    # Application title
    titlePanel(APP_TITLE),
    h5(em("Please find support documentation in ", strong("Help"), " tab")),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            # Radio button to choose distribution type
            radioButtons('distType',
                         "Choose distribution type: ",
                         c("Normal" = 'norm',
                           "Lognormal" = 'lnorm',
                           "Bionomial" = 'binom',
                           "Uniform" = 'unif')),
            
            # Numerical input to choose sample size
            numericInput('numSamples',
                         "Input sample size (integer >0): ",
                         value = 100, min = 1,  step = 1),
            
            # Dynamic parameter inputs based on radio button
            htmlOutput("paramInputs"),
            br(),
            
            # Action button to render plot
            actionButton('do_plot', "Plot!")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            # Add plot options checkboxes
            checkboxGroupInput('opt', "Plot Options:",
                               c("Mean" = 'disp_mean',
                                 "Density Curve" = 'disp_density'),
                               inline = TRUE),

            tabsetPanel(
                tabPanel("Plot" , plotOutput("distPlot")),
                tabPanel("Message", textOutput("msg")),
                tabPanel("Help", 
                         h2("User Manual"),
                         h3(APP_TITLE),
                         
                         h4("Introduction"),
                         p("This Shiny web application can be used to take
                           samples from various classic probability distributions
                           with different parameters input/selected on this UI. 
                           The samples are then plotted on this UI."),
                         p("This application is a useful tool to learn process of
                           sampling, as well as basic probability distribution."),
                         
                         br(),
                         h4("Inputs"),
                         
                         h5(em("Distribution Type")),
                         p("Choose the desired probability distribution from the
                           list with radio button. The parameter inputs will adjust
                           dynamically with the selected distribution.",
                           strong("Default: Normal Distribution")),
                         p("At the bottom of the inputs, type of the distribution,
                           'Discrete'/'Continuous', will be given."),
                         
                         h5(em("Sample Size")),
                         p("An positive integer number is required as number of
                           samples to be taken from the chosen distribution",
                           strong("Default: 100")),
                         
                         h5(em("Parameters")),
                         p("These fields regarding distribution-specific parameters
                           will be dynamically populated as the distribution type
                           was chosen. Default values are given based on distribution."),
                         p("Contraints on parameters, if any, are given along with
                           the names of parameters."),
                         
                         h5(em("Plot! Button")),
                         p("Once the above inputs are complete, click 'Plot!' button
                           to populate the probability distribution as a bar plot"),
                         p(strong("Note: "),
                           "Plot is re-plotted with new distribution type, and/or
                           sample size, and/or parameters, only if the 'Plot!' button
                           is clicked"),
                         
                         h5(em("Other Plot Options")),
                         p("Two plot options are given:"),
                         p(em("Mean:"),
                           "Plot a red vertical line to represent the mean of all samples"),
                         p(em("Density Curve:"),
                           "Plot a blue smooth curve to represent more detailed 
                           density distribution than the bar plot"),
                         p(strong("Note: "),
                           "Unlike inputs in the left column that are only reflected
                           on the plot when 'Plot!' button is clicked, the check/uncheck
                           of the plot options are reflected on the plot immediately"),
                         
                         br(),
                         h4("Plot"),
                         p("Based on inputs in the left column, a bar plot, with x-axis
                           the values sampled from the distribution and y-axis the
                           density(probability) of each value range, will be plotted
                           every time the 'Plot!' button is clicked."),
                         p("A vertical red line representing mean of samples, and/or
                           a blue smooth curve representing the density distribution,
                           along with their legends, will also be plotted dynamically
                           based on the checkboxes above the plot tab"),
                         
                         br(),
                         h4("Message"),
                         p("Message tab is used for debug, logs and error reporting"),
                         
                         br(),
                         h4("Source Code & Deployment"),
                         p("Full source code of this Shiny app can be found on github at"),
                         p("https://github.com/Roklion/Developing_Data_Products"),
                         p("The app is also deployed online at"),
                         p("https://roklion.shinyapps.io/Developing_Data_Products")
                )
            )
        )
    )
))
