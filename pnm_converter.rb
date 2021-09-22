require "pnm"

class PNMConverter

  # Returns a copy of the image.
  def copy(image)
    type    = image.type
    maxgray = image.maxgray
    pixels  = image.pixels

    PNM.create(pixels, type: type, maxgray: maxgray)
  end
  
  def vflip(image)
    finish = PNM.create(image.pixels.reverse)     
  end

  def hflip(image)
    output = []

    image.pixels.size.times do |number|
      image.pixels[number]
      output.push(image.pixels[number].reverse)
    end

    finish = PNM.create(output)
  end  

  def vhflip(image)
    output = []

    image.pixels.size.times do |number|
      image.pixels[number]
      output.push(image.pixels[number].reverse)
    end

    finish = PNM.create(output.reverse)
  end 

  def sharp(image)                                      #not working
    save = []
    output = []    
    image.pixels.size.times do |row|
      output = image.pixels[row]

      save.size                 #row size

      save.size.times do |coll|
        output.push(save[coll]/2)
      end
    end
    print output

    finish = PNM.create(output)
  end

  def invert(image)
    maxgray = image.maxgray

    output = image.pixels.map do |row|
      row.map do |pixel|
          maxgray - pixel
      end
    end
    finish = PNM.create(output)
  end
end