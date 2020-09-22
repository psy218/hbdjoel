#' @description this function prints out birthday messages for Joel Le Forestier for his 26th birthday.
#' @param from_who leaving it blank will randomly select a person; possible argument includes: name(s) of birthday message sender; "everyone"
#' @return happy birthday message and the author of the message
#' @examples hbd_joel(from_who = c("liz", "bethany"))

hbd_joel <- function(from_who) {

  # joel's nicknames for people
  nicknames = c("jacqueline" = "jackie",
                "susan" = "sue",
                "^corn\\D+" = "bethany",
                "mariah" = "maria",
                "^will\\D+" = "will",
                "lpg" = "liz")

  # change the name to lower cases if capitalized & replace nicknames with real names
  from_who = stringr::str_replace_all(tolower(from_who), nicknames)

  # custom message for Matt
  if(any( stringr::str_detect(from_who, "matt") == TRUE)) cat("Matt is going to tell you in person\U1F496\n")

  # corn prompts for Bethany
  if(any( stringr::str_detect(from_who, "corn") == TRUE)) cat("BETHANY AIN'T EVEN FROM IOWA\n")

  suppressWarnings(
    if( length(from_who) == 1 & from_who == "everyone" ) {
      from_who = hbdjoel::data$name

    } else if ( length(from_who) == 1 & from_who == "anyone" ) {
      from_who = sample(hbdjoel::data$name, 1)

    # } else if ( any( from_who %in% hbdjoel::data$name == FALSE ) ) {
    } else {

      # find names of senders not in the data
      unknown_senders = ifelse(from_who %in% c(hbdjoel::data$name, "matt"), NA, from_who)
      unknown_senders = unknown_senders[!is.na(unknown_senders)] # drop NA

      cat("Who",
          paste(ifelse(length(unknown_senders) == 1, "is", "are")),
          paste(unknown_senders, collapse = ", "), "?\n")

      from_who = from_who[which(from_who %in% c( hbdjoel::data$name, names(nicknames)))]
      }

  )

  hbdjoel::data %>%
    dplyr::filter(name %in% from_who) %>%
    dplyr::mutate(msg = glue::glue("{stringr::str_to_title(name)} says {msg}")) %>%
    .$msg

}

