USAGE = "Usage: pnm-copy.rb file"
abort USAGE  unless ARGV.size == 1

require_relative "pnm_converter"

converter = PNMConverter.new

infile = ARGV.shift
name = File.basename(infile, ".*")
outfile = "#{name}-copy"

image = PNM.read(infile)
new_image = converter.copy(image)
new_image.write(outfile, add_extension: true)