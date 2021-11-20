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
        if pixel.is_a? Array           
          pixel.map do |color|
            maxgray - color 
          end
        else 
          maxgray - pixel
        end
      end
    end
    finish = PNM.create(output)
  end

  def rotate(image)
    output = []
    0.upto(image.width - 1) do |n|
        row = []
        1.upto(image.pixels.length) do |m|
            row << image.pixels[image.pixels.length - m][n]
        end
        output << row
    end
    finish = PNM.create(output)
  end

  def rotate2(image)
    finish = PNM.create(image.pixels.reverse.transpose)
  end

  # Returns a histogram for a grayscale image.
  def histogram(image)
    raise "Image must be PGM"  unless image.type == :pgm

    maxgray = image.maxgray

    frequencies = Array.new(maxgray + 1, 0)
    image.pixels.flatten.each {|value| frequencies[value] += 1 }

    maxval = frequencies.max

    pixels = []
    height = 100

    # create pixel array for horizontal bar chart
    frequencies.each do |frequency|
      length = (frequency * height.to_f / maxval).round
      pixels << Array.new(length, 1) + Array.new(height - length, 0)
    end

    pixels = pixels.transpose.reverse  # rotate counterclockwise

    finish = PNM.create(pixels, type: :pbm)
  end

  def decode(image)
    maxgray = image.maxgray

    output = image.pixels.map do |row|
        row.map do |pixel|
            if pixel.even?
                pixel = 0
            else 
                pixel = 1
            end
        end
    end
    finish = PNM.create(output)
  end

  def decode(image)
    maxgray = image.maxgray

    output = image.pixels.map do |row|
        row.map do |pixel|
            if pixel.even?
                pixel = pixel
            else 
                pixel = pixel+1
            end
        end
    end
   finish = PNM.create(output)
end
end
