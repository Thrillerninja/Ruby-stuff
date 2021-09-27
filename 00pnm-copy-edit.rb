USAGE = "Usage: pnm-copy.rb file transform"
abort USAGE  unless ARGV.size == 2

require_relative "00pnm_converter"

converter = PNMConverter.new

infile = ARGV[0]
name = File.basename(infile, ".*")

image = PNM.read(infile)
case(ARGV[1])
when "c"
    new_image = converter.copy(image)
    outfile = "#{name}-copy"
when "v"
    new_image = converter.vflip(image)
    outfile = "#{name}-vflip"
when "h"
    new_image = converter.hflip(image)
    outfile = "#{name}-hflip"
when "vh"
    new_image = converter.vhflip(image)
    outfile = "#{name}-vhflip"
when "i"
    new_image = converter.invert(image)
    outfile = "#{name}-invert"
when "r"
    new_image = converter.rotate(image)
    outfile = "#{name}-rotate"
end
new_image.write(outfile, add_extension: true, encoding: :ascii)
