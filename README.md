# Longitudinal Clinical Trial Analysis Using GEE

**Tools:** R, geepack, dplyr, ggplot2, R Markdown

## Project Overview

This project analyzes longitudinal clinical trial data to evaluate the effectiveness of a new depression treatment compared with a standard treatment.

The analysis uses logistic Generalized Estimating Equations (GEE) to account for repeated binary outcomes measured within patients and investigates whether the relative treatment effect changes over time.

## Dataset

The dataset contains 1,020 observations from 340 patients, measured after 1, 2, and 4 weeks of treatment.

- Standard treatment: 180 patients
- New treatment: 160 patients
- Outcome: Normal versus abnormal depression status
- Covariates: Baseline severity, treatment, time, and treatment-by-time interaction

**Source:** [Alan Agresti's Categorical Data Repository](https://github.com/alanagresti/categorical-data)

## Statistical Methods

The analysis includes:

- Exploratory data analysis and outcome visualizations
- Logistic GEE models with independence, exchangeable, and AR(1) working correlation structures
- Robust Wald hypothesis tests, including a joint test of treatment-related coefficients
- Time-specific treatment odds ratios and 95% confidence intervals
- Sensitivity analysis across working correlation structures

## Key Findings

The drug-by-time interaction was statistically significant at the 1% level, indicating that the relative treatment effect changed over time.

Estimated odds ratios comparing the new treatment with the standard treatment were:

| Follow-up | Odds Ratio | 95% CI |
|---|---:|---|
| Week 1 | 1.07 | 0.71–1.60 |
| Week 2 | 2.17 | 1.62–2.91 |
| Week 4 | 8.93 | 4.93–16.19 |

A joint Wald test also found strong evidence that the treatment-related coefficients were not simultaneously zero.

The three working correlation structures produced nearly identical coefficient estimates, indicating that the statistical findings were relatively insensitive to the selected working correlation assumptions.

## Full Analysis

**[View the complete statistical analysis report](analysis.html)**

The HTML report contains the detailed methodology, hypothesis tests, tables, figures, interpretations, and limitations.

## Reproducibility

To reproduce the analysis:

1. Clone or download this repository.
2. Install the required R packages: `geepack`, `dplyr`, `ggplot2`, `rmarkdown`, `knitr`, and `scales`.
3. Open `analysis.Rmd` in RStudio.
4. Knit the document to HTML.

The `R/modeling.R` script contains reusable functions for data preparation and GEE model fitting.

## Project Background

This project was developed from university statistics coursework and expanded into a standalone reproducible analysis with additional exploratory visualizations, formal hypothesis testing, confidence intervals, and model sensitivity analysis.