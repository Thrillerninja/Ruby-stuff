require "pnm"

class Edit

  attr_accessor :image, :copy

  def initialize(image)
      @image = image
  end

  def vflip
    finish = PNM.create(output.reverse)
    finish.write("pnm_Edit.pgm", encoding: :ascii)        
  end

  def hflip
    output = []

    image.pixels.size.times do |number|
      image.pixels[number]
      output.push(image.pixels[number].reverse)
    end

    finish = PNM.create(output)
    finish.write("pnm_Edit.pgm", encoding: :ascii)
  end  

  def vhflip
    output = []

    image.pixels.size.times do |number|
      image.pixels[number]
      output.push(image.pixels[number].reverse)
    end

    finish = PNM.create(output.reverse)
    finish.write("pnm_Edit.pgm", encoding: :ascii)
  end 

  def sharp                                       #not working
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
    finish.write("pnm_Edit5.pgm", encoding: :ascii)
  end

  def invert
    maxgray = image.maxgray

    output = image.pixels.map do |row|
      row.map do |pixel|
          maxgray - pixel
      end
    end
    finish = PNM.create(output)
    finish.write("pnm_Edit.pgm", encoding: :ascii)
  end
end

image = Edit.new(PNM.read("moon_cernan.pgm"))
image.invert