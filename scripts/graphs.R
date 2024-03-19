### GRAPHS ###
mean_e <- mean(wutheights_reduced$count_e)
variance_e <- var(wutheights_reduced$count_e)


wutheights_reduced |>
  ggplot(aes(x = count_e)) +
  geom_histogram() +
  geom_vline(xintercept = mean_e, 
             linetype = "dashed", 
             color = "#C64191") +
  geom_vline(xintercept = variance_e, 
             linetype = "dashed", 
             color = "#0ABAB5") +
  theme_minimal() +
  labs(
    y = "Count",
    x = "Number of e's per line for first ten lines"
  )


wutheights_reduced |>
  ggplot(aes(x = word_count, y = count_e)) +
  geom_jitter(alpha = 0.5) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  theme_minimal() +
  labs(
    x = "Number of words in the line",
    y = "Number of e/Es in the line"
  )