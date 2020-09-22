#' @description this function lets you quiz your qualification as a social psychology; it will print out a birthday message, and you need to guess who may have said the message.
#' @examples guess_who()

guess_who <- function() {

    guess_msg = hbdjoel::data %>%
        dplyr::sample_n(size = 1)


    options = sample(c(guess_msg$name, sample( hbdjoel::data$name[ hbdjoel::data$name != guess_msg$name], 4)), 5)
    guess = readline( prompt = cat(guess_msg$msg,
                           "\n",
                           "Which of the following person said the message above?\n",
                           paste(1:6,  c(stringr::str_to_title(options), "No idea..."),
                                 collapse = "\n", sep = ": "),
                           fill = TRUE))
    shame_msg = c("embarrassing", "rude", "how dare you", "for real?!", "wow",
                  "shame", "what are you doing", "tell me you are kidding",
                  "I'm judging you hard right now")
    print(ifelse(which(options==guess_msg$name) == guess, "NICE!", glue::glue("{sample(shame_msg, 1)}... it was {stringr::str_to_title(guess_msg$name)}")))
}
