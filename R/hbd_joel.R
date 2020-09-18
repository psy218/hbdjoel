#' @description this function prints out birthday messages for Joel Le Forestier for his 26th birthday.
#' @param from_who leaving it blank will randomly select a person; possible argument includes: name(s) of birthday message sender; "everyone"
#' @return happy birthday message and the author of the message
#' @examples hbd_joel(from_who = c("liz", "bethany"))

hbd_joel <- function(from_who) {

  # data containing birthday messages from everyone
  load(here::here("R", "sysdata.rda"))

  suppressWarnings(
    if(from_who == "everyone" ) {
      from_who = data$name

    } else if ( missing(from_who) ) {
      from_who = sample(data$name, 1)

    } else {
      from_who = from_who
    })

  data %>%
    filter(name %in% from_who) %>%
    # filter(name %in% c("sue", "louisa")) %>% # testing testing
    group_by(name) %>%
    mutate_at("msg", emo::ji_glue) %>%
    glue::glue_data("{stringr::str_to_title(name)} says {msg}")
    # mutate(msg = glue::glue("{stringr::str_to_title(name)} says {msg}")) %>%
    # pull(msg)
}


# testing testing
hbd_joel( from_who = "everyone")

hbd_joel( from_who = c("sue", "liz"))
