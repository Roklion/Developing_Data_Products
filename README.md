# Developing_Data_Products
Coursera Developing Data Products course project

The User Manual below can be found under **_Help_** tab within the app

## User Manual

### Introduction
This Shiny web application can be used to take
samples from various classic probability distributions
with different parameters input/selected on this UI. 
The samples are then plotted on this UI.

This application is a useful tool to learn process of
sampling, as well as basic probability distribution.


### Inputs

#### Distribution Type
Choose the desired probability distribution from the
list with radio button. The parameter inputs will adjust
dynamically with the selected distribution.
**Default: Normal Distribution**

At the bottom of the inputs, type of the distribution,
'Discrete'/'Continuous', will be given.

#### Sample Size
An positive integer number is required as number of
samples to be taken from the chosen distribution.
**Default: 100**

#### Parameters
These fields regarding distribution-specific parameters
will be dynamically populated as the distribution type
was chosen. Default values are given based on distribution.

Contraints on parameters, if any, are given along with
the names of parameters.

#### *Plot!* Button
Once the above inputs are complete, click '*Plot!*' button
to populate the probability distribution as a bar plot.

**Note: **
Plot is re-plotted with new distribution type, and/or
sample size, and/or parameters, only if the '*Plot!*' button
is clicked.

#### Other Plot Options
Two plot options are given:
*Mean*:
Plot a red vertical line to represent the mean of all samples.

*Density Curve*:
Plot a blue smooth curve to represent more detailed 
density distribution than the bar plot.

**Note: **
Unlike inputs in the left column that are only reflected
on the plot when 'Plot!' button is clicked, the check/uncheck
of the plot options are reflected on the plot immediately.


### Plot
Based on inputs in the left column, a bar plot, with x-axis
the values sampled from the distribution and y-axis the
density(probability) of each value range, will be plotted
every time the '*Plot!*' button is clicked.

A vertical red line representing mean of samples, and/or
a blue smooth curve representing the density distribution,
along with their legends, will also be plotted dynamically
based on the checkboxes above the plot tab.


### Message
Message tab is used for debug, logs and error reporting


### Source Code & Deployment
Full source code of this Shiny app can be found on github at 
https://github.com/Roklion/Developing_Data_Products

The app is also deployed online at 
https://roklion.shinyapps.io/Developing_Data_Products
