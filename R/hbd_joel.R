#' @description this function prints out birthday messages for Joel Le Forestier for his 26th birthday.
#' @param from_who leaving it blank will randomly select a person; possible argument includes: name(s) of birthday message sender; "everyone"
#' @return happy birthday message and the author of the message
#' @examples hbd_joel(from_who = c("liz", "bethany"))

hbd_joel <- function(from_who) {

  # change the name to lower cases if capitalized
  from_who = tolower(from_who)

  suppressWarnings(
    if(from_who == "everyone" ) {
      from_who = hbdjoel::data$name

    } else if ( from_who == "anyone" ) {
      from_who = sample(hbdjoel::data$name, 1)

    } else if ( from_who %in% hbdjoel::data$name ){
      from_who = tolower(from_who)

    } else {
      stop("THIS PERSON DOESN'T LOVE YOU, or you don't know how to type", call. = FALSE)
      # glue::glue("{from_who} DOESN'T LOVE YOU")
    })

  hbdjoel::data %>%
    dplyr::filter(name %in% from_who) %>%
    dplyr::mutate(msg = glue::glue("{stringr::str_to_title(name)} says {msg}")) %>%
    .$msg

}

