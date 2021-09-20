require "pnm"

# pixel data
pixels = [[ 0, 10, 20],
          [10, 20, 30]]

# optional settings
options = { maxgray: 30, comment: "Test Image" }

# create the image object
image = PNM.create(pixels)

# retrieve some image properties
image.info    # => "PGM 3x2 Grayscale"
image.type    # => :pgm
image.width   # => 3
image.height  # => 2

image.write("pnm_gen")