# Reproducible data preparation and GEE model functions.
# Packages are loaded inside analysis.Rmd.

data_url <- paste0(
  "https://raw.githubusercontent.com/alanagresti/",
  "categorical-data/refs/heads/master/Depression.dat"
)

load_depression_data <- function(url = data_url) {
  dat <- read.table(url, header = TRUE)
  # The source codes visits as 0, 1, 2; relabel as weeks 1, 2, 4.
  dat <- dat |>
    dplyr::mutate(
      case = factor(case),
      time = dplyr::if_else(time == 2, 4, time + 1)
    ) |>
    dplyr::arrange(case, time)
  stopifnot(all(dat$time %in% c(1, 2, 4)))
  dat
}

fit_gee <- function(data, correlation = "independence") {
  geepack::geeglm(
    outcome ~ severity + drug + time + drug:time,
    id = case,
    data = data,
    family = binomial(link = "logit"),
    corstr = correlation
  )
}

