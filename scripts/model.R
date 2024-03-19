### MODEL ###
wutheights_e_counts <-
  stan_glm(
    count_e ~ word_count,
    data = wutheights_reduced,
    family = poisson(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )


saveRDS(
  wutheights_e_counts,
  file = "wutheights_e_counts.rds"
)