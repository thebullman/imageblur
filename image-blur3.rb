class Image
  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!(dist)
    blur_coords = []
    @image.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        blur_coords << [y, x] if pixel == 1
      end
    end

    @image.each_with_index do |row, current_y|
      row.each_with_index do |pixel, current_x|
        blur_coords.each do |coord|
          y = coord[0]
          x = coord[1]
        

          if man_dist(x, current_x, y, current_y) <= dist 
          @image[current_y][current_x] = 1 
          end        
        end
      end
    end  
  end
  
  def man_dist(x1, x0, y1, y0)
    (x1-x0).abs + (y1-y0).abs
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0]
])
puts "How much would you like to blur? Enter 1-3 (3 being total blur)"
howmany = gets.chomp.to_i

image.blur!(howmany)
image.output_image