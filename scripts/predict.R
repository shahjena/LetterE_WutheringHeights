### GRAPH PREDICTIONS ###
plot_predictions(wutheights_e_counts, condition = "word_count") +
  labs(x = "Number of words",
       y = "Average number of e/Es in the first 10 lines") +
  theme_classic()