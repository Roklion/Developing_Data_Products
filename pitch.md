Probability Distribution Sampler - A Shiny App
========================================================
author: Yao Dong Yu
date: Dec. 23, 2015

What is Probability Distribution Sampler?
========================================================

The Probability Distribution Sampler is a handy tool to visually demonstrate how
different probability distributions work, i.e. shape of the distribution, change
of the distribution due to parameter changes, and etc.

The following distributions are currently supported:

- Normal Distribution
- Log-normal Distribution
- Binomial Distribution (discrete)
- Uniform Distribution

How it works?
========================================================

Shiny UI Workflow:

1. Normal Distribution is selected by radio button;
2. Parameter fields are populated based on 1;
3. Input desired sample size and parameters;
4. Click *Plot!* button to plot under **Plot** tab on the right;
5. Check/Uncheck options to show/hide mean and density curve;
6. Modity inputs and click *Plot!* again to re-plot.

Shiny Server has two main functions:

* Dynamically populate parameter inputs for each distribution
* Sample distribution and create density plot.

Flexibility of the App
========================================================

This application has the advantages of flexibility in terms of usage and future
development.

**Usage**:
* Dynamically allocated input fields;
* On-the-run plot options to hide/show features;
* Embedded **Message** and **Help** tabs.

**Future Development**:
* Scalability to include other, more complicated distributions;
* More parameters and options can be easily added to UI.

Plot Example with Code
========================================================

<small>Normal Distribution: sample size = 1000.</small>

```r
samples <- rnorm(1000, mean = 0, sd = 1)
hist(samples, prob = TRUE, col = 'grey')
abline(v = mean(samples), col = 'red')
lines(density(samples), col = 'blue')
```

<img src="pitch-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" style="display: block; margin: auto;" />

