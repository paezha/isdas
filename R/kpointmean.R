#' A function that implements k-point mean interpolation
#'
#' This function calculates the spatial mean based on the k-nearest neighbors of a focal point or set of focal points.
#' @param source_xy A simple features object of type POINT with the source points for interpolation
#' @param target_xy A simple features object of type POINT with the target points for interpolation
#' @param z The name of the column with the variable in `source_xy` to interpolate
#' @param k A number that defines the number of neighbors used for interpolation
#' @param longlat TRUE if coordinates are in long/lat
#' @keywords spatial
#' @importFrom rlang .data
#' @export
#' @return A simple features object.

kpointmean <- function(source_xy, target_xy, z, k, longlat = FALSE){

  target_xy$intid <- 1:nrow(target_xy)

  m <- sf::st_join(target_xy,
               source_xy,
               join = nngeo::st_nn,
               k = k,
               progress = FALSE)

  m <- dplyr::group_by(m,
                .data$intid) %>%
    dplyr::summarize(z = mean({{z}}),
              sd = sd({{z}}))

  m
}
