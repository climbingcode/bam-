module BrandsHelper


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

    def rgb_to_display(hex)
      r = hex_convert_to_red(hex)
      g = hex_convert_to_green(hex)
      b = hex_convert_to_blue(hex)

      "#{r}, #{g}, #{b}" 
    end

    def hex_to_cmyk(hex)
     computedC = 0;
     computedM = 0;
     computedY = 0;
     computedK = 0;


     r = hex_convert_to_red(hex).to_f; 
     g = hex_convert_to_green(hex).to_f; 
     b = hex_convert_to_blue(hex).to_f; 

     # For colors that are black
      if r==0 && g==0 && b==0 
        computedK = 100;
        return "0% , 0% , 0% , #{computedK}%"
      end
     

     computedC = 1.0 - (r/255.0);
     computedM = 1.0 - (g/255.0);
     computedY = 1.0 - (b/255.0);

     minCMY = [computedC, computedM, computedY].min

     computedC = ( 100 * (computedC - minCMY) / (1 - minCMY)).round
     computedM = ( 100 * (computedM - minCMY) / (1 - minCMY)).round
     computedY = ( 100 * (computedY - minCMY) / (1 - minCMY)).round
     computedK = (100 * minCMY).round

     return "#{computedC}% , #{computedM}% , #{computedY}% , #{computedK}%"

    end

end
