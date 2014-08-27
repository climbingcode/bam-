module BrandsHelper

  def testing(hex)
    "Hi!" + hex
  end


    def hex_convert_to_red(hex)
      hex_red = hex.chomp[0,2]
      hex_red.to_i(16)
    end

    def hex_convert_to_green(hex)
      hex_green = hex.chomp[2,2]
      hex_green.to_i(16)
    end

    def hex_convert_to_blue(hex)
      hex_blue = hex.chomp[4,5]
      hex_blue.to_i(16)
    end

    def rgb_to_show(hex)
      r = hex_convert_to_red(hex)
      g = hex_convert_to_green(hex)
      b = hex_convert_to_blue(hex)

      "#{r}, #{g}, #{b}" 
    end

end
