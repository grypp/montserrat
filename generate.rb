require 'RMagick'

sourceurl = "http://www.turismoyfotos.net/montserrat/web/index.php"

serrat = Magick::Image.read("./montserrat-01.jpg").first

max = 2048

File.open('./serrat.ck','w') do |file|
  file << "int serrat[#{[serrat.columns,max].min}];\n"
  file << "[ "
  serrat.columns.times do |col|
    serrat.get_pixels(col,0,1,serrat.rows).each_with_index do |pxl, row|
      next if pxl.intensity > 65500
      file << "#{serrat.rows - row}#{col < [serrat.columns,max+1].min - 1 ? ', ' : ' '}"
      break
    end
    break if col >= max
  end
  file << "] @=> serrat;\n\n"
end

`cat ./source.ck >> ./serrat.ck`
