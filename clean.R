### CLEAN DATA ###
wutheights_reduced <-
  wutheights |>
  filter(!is.na(text)) |> # Remove empty lines
  mutate(chapter = if_else(str_detect(text, "CHAPTER") == TRUE,
                           text,
                           NA_character_)) |> # Find start of chapter
  fill(chapter, .direction = "down") |> 
  mutate(chapter_line = row_number(), 
         .by = chapter) |> # Add line number to each chapter
  filter(!is.na(chapter), 
         chapter_line %in% c(2:11)) |> # Remove "CHAPTER I" etc
  select(text, chapter) |>
  mutate(
    chapter = str_remove(chapter, "CHAPTER "),
    chapter = str_remove(chapter, "—CONCLUSION"),
    chapter = as.integer(as.roman(chapter))
  ) |> # Change chapters to integers
  mutate(count_e = str_count(text, "e|E"),
         word_count = str_count(text, "\\w+")
         # From: https://stackoverflow.com/a/38058033
  ) 


wutheights_reduced |>
  select(chapter, word_count, count_e, text) |>
  head()