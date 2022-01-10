## code to create hex sticker

library(ggplot2)
library(here)
library(magick)
library(hexSticker)
library(showtext)

font_add_google("Roboto Mono")

#img <- image_read(paste0(here(), "/man/figures/voronoi_mononoke.gif"))


#ii <- magick::image_info(img)
#ii_min <- min(ii$width, ii$height) - 160
#im1 <- magick::image_crop(img, geometry=paste0(ii_min, "x", ii_min, "+80+20"), repage=TRUE)

# create a new image with white background and black circle
#fig <- magick::image_draw(image_blank(ii_min, ii_min))
#symbols(ii_min/2, ii_min/2, circles=(ii_min/2)-3, bg='black', inches=FALSE, add=TRUE)
#dev.off()

# create an image composite using both images
#im2 <- magick::image_composite(im1, fig, operator='copyopacity')

# set background as white
#im2 <- magick::image_background(im2, 'white')

#image_write(im2[92], path = paste0(here(), "/man/figures/logo_img.png", format = "png"))

## Previous code commented, because after writing the image I used a separate package to change the background color to match the color of the sticker

img <- image_read(paste0(here(), "/man/figures/logo_img.png"))


hp <- img %>%
  image_scale("350") %>%
  image_ggplot() +
  ggforce::geom_circle(aes(x0 = 176, y0 = 175,  r = 171), color = "black", size = 1, inherit.aes = FALSE) +
  theme(plot.background = element_rect(fill = "#278B9AFF", color = NA))

hs <- sticker(hp,
              s_x=1,
              s_y=1.05,
              s_width=1.25,
              s_height=1.25,
              package="isdas",
              h_fill="#278B9AFF",
              h_color="#DE7862FF",
              p_size=7,
              p_x = 1.00,
              p_y = 0.28,
              p_family = "Roboto Mono",
              p_fontface = "bold",
              p_color = "#4C413FFF",
              h_size = 2.3,
              url = "paezha.github.io/isdas",
              u_color = "white",
              u_family = "Roboto Condensed",
              u_x = 0.27,
              u_y = 1.58,
              u_size = 1.5,
              filename = paste0(here(), "/man/figures/isdas.png"))
