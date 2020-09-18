#' @description turning texts into utf8 code to be printed as emojis.
emoji_transform = function(text) {

  stringr::str_replace_all(text, c("heart" = "\xE2\x9D\xA4",
                                   "celebration" = "\xF0\x9F\x8E\x89",
                                   "tada" = "\xF0\x9F\x8D\xBB")) %>%
    utf8::utf8_encode()
}

#' @description this function prints out birthday messages for Joel Le Forestier for his 26th birthday.
#' @param from_who leaving it blank will randomly select a person; possible argument includes: name(s) of birthday message sender; "everyone"
#' @return happy birthday message and the author of the message
#' @examples hbd_joel(from_who = c("liz", "bethany"))

hbd_joel <- function(from_who) {

  # data containing birthday messages from everyone
  # load(here::here("R", "sysdata.rda"))
  load(here::here("data", "data.rda"))
  # data("hbd_joel", "data", package = hbdjoel, envir = parent.env(environment()))
  # data(sysdata, envir = environment())
  # usethis::use_data(data, internal = TRUE)

  suppressWarnings(
    if(from_who == "everyone" ) {
      from_who = data$name

    } else if ( missing(from_who) ) {
      from_who = sample(data$name, 1)

    } else {
      from_who = from_who
    })

  # hbdjoel::data %>%
  data %>%
    filter(name %in% from_who) %>%
    group_by(name) %>%
    # mutate_at("msg", emo::ji_glue) %>%
    mutate_at("msg", emoji_transform) %>%
    glue::glue_data("{stringr::str_to_title(name)} says {msg}")

}




