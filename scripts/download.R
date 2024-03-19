### DOWNLOAD AND SAVE TEXT ###
gutenberg_id_of_wutheights <- 768


wutheights <-
  gutenberg_download(
    gutenberg_id = gutenberg_id_of_wutheights,
    mirror = "https://gutenberg.pglaf.org/"
  )


wutheights


write_csv(wutheights, "wutheights.csv")


wutheights <- read_csv(
  "wutheights.csv",
  col_types = cols(
    gutenberg_id = col_integer(),
    text = col_character()
  )
)


wutheights