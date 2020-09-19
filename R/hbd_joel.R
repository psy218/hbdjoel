#' @description this function prints out birthday messages for Joel Le Forestier for his 26th birthday.
#' @param from_who leaving it blank will randomly select a person; possible argument includes: name(s) of birthday message sender; "everyone"
#' @return happy birthday message and the author of the message
#' @examples hbd_joel(from_who = c("liz", "bethany"))

hbd_joel <- function(from_who) {

  # change the name to lower cases if capitalized

  from_who = tolower(from_who)
  if(any( stringr::str_detect(from_who, "corn") == TRUE)) cat("SHE'S NOT FROM IOWA\n")

  suppressWarnings(
    if( length(from_who) == 1 & from_who == "everyone" ) {
      from_who = hbdjoel::data$name

    } else if ( length(from_who) == 1 & from_who == "anyone" ) {
      from_who = sample(hbdjoel::data$name, 1)

    } else if ( from_who %in% hbdjoel::data$name ){
      from_who = from_who

    } else if ( stringr::str_detect(from_who, "corn")) {
      from_who = ifelse(stringr::str_detect(from_who, "^corn") == TRUE, "bethany", from_who)

    } else if (any( from_who %in% hbdjoel::data$name == FALSE) ) {
      suggestions = ifelse( stringr::str_detect(from_who, "matt") == TRUE, "matt",
                            ifelse( stringr::str_detect(from_who, "lpg") == TRUE, "liz", "nada"))

      if(all(suggestions == "nada")) cat("Did you make up those names?")
      if(suggestions == "matt") cat("Matt is going to tell you in person\U1F496\n")
      if(any(suggestions != "nada") & all(suggestions != "matt")) cat( paste0("Did you mean ", suggestions[which(suggestions != "nada")], "? Try with ", suggestions[which(suggestions != "nada")]))

      from_who = from_who[which(from_who %in% hbdjoel::data$name)]
    }
    # else if (any( from_who %in% hbdjoel::data$name == FALSE) ) {
    #   cat(paste(toupper(from_who[which(from_who %in% hbdjoel::data$name == FALSE)]), "DOESN'T LOVE YOU\n"))
    #   from_who = from_who[which(from_who %in% hbdjoel::data$name)]
    # }
  )

  hbdjoel::data %>%
    dplyr::filter(name %in% from_who) %>%
    dplyr::mutate(msg = glue::glue("{stringr::str_to_title(name)} says {msg}")) %>%
    .$msg

}

