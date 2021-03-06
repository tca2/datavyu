#' Plot code duration for a datavu column
#'
#' @param datavyu_object a datavyu object created by `summarize_column()`
#' @return A ggplot2 plot
#' @importFrom rlang .data
#' @importFrom stats reorder


plot_duration <- function(datavyu_object) {

  duration_df <- stringr::str_split(datavyu_object$duration, ":") %>%
    as.data.frame()

  names(duration_df) <- stringr::str_c("row", 1:length(datavyu_object$duration))

  datavyu_object$duration <- lubridate::duration(hour = as.numeric(duration_df[1, ]),
                                                     minute = as.numeric(duration_df[2, ]),
                                                     second = as.numeric(stringr::str_c(as.numeric(duration_df[3, ]), ".", as.numeric(duration_df[4, ]))))

  if (attributes(datavyu_object)$by_file == FALSE) {

    # plotting
    datavyu_object %>%
      dplyr::rename(var = 1) %>%
      dplyr::mutate(duration = as.numeric(.data$duration),
             sum_duration_minutes = .data$duration / 60) %>%
      ggplot2::ggplot(ggplot2::aes(x = reorder(.data$var, .data$sum_duration_minutes),
                          y = .data$sum_duration_minutes)) +
      ggplot2::geom_col() +
      ggplot2::coord_flip() +
      ggplot2::ylab("Minutes") +
      ggplot2::xlab(NULL)

  } else if (attributes(datavyu_object)$by_file == TRUE) {

    # dealing with many files
    if (nrow(dplyr::count(datavyu_object, file)) >= 20) {
      message("Plotting this many files may cause problems with your plot;
              consider visualizing this data in a different way")
    }

    if (nrow(dplyr::count(datavyu_object, file)) >= 100) {
      message("Plotting this many files will almost certainly cause problems with your plot;
              consider visualizing this data in a different way")
    }

    if (nrow(dplyr::count(datavyu_object, file)) >= 200) {
      stop("Cannot plot this many files; consider visualizing this data in a different way")
    }

    # plotting
    datavyu_object %>%
      dplyr::rename(var = 2) %>% # this is to grab the code
      dplyr::mutate(duration = as.numeric(.data$duration),
             sum_duration_minutes = .data$duration / 60) %>%
      ggplot2::ggplot(ggplot2::aes(x = reorder(.data$var, .data$sum_duration_minutes),
                          y = .data$sum_duration_minutes)) +
      ggplot2::geom_col() +
      ggplot2::coord_flip() +
      ggplot2::facet_wrap("file") +
      ggplot2::ylab("Minutes") +
      ggplot2::xlab(NULL)

  }
}


