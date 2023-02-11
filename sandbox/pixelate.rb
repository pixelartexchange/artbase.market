require 'cocos'
require 'pixelart'


# name = 'ordinalpenguins'
# width, height = [35,35]

name  = 'yetibitclub'
width, height = [28,28]


recs = read_csv( "./#{name}/ordinals.csv" )
puts "  #{recs.size} record(s)"

# [0,69, 107]  - note: use 1700x1700
[recs[0],
 recs[69],
 recs[107]].each_with_index do |rec,i|
  id  = rec['id']
  num = rec['num']

  path = "./#{name}/token-i/#{num}.png"
  puts "==> reading #{path}..."

  img = Image.read( path )
  puts "   #{img.width}x#{img.height}"

  if img.width != 1700 ## 1400
    puts "  !! ERROR - unexpected image size; sorry"
    exit 1
  end
  ## steps = Image.calc_sample_steps( 192, 24 )
  ## steps = Image.calc_sample_steps( 192, 35 )
  ## steps = Image.calc_sample_steps( 1400, 28 )
  steps = Image.calc_sample_steps( 1700, 28 )

  img = img.sample( steps, steps )
  img.save( "./#{name}/#{width}x#{height}/#{num}.png" )
end


puts "bye"