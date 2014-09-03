module FontsHelper


def font_converter(font)
  converted_font = font.font_family.gsub(/-/, ' ')
  converted_font.titleize

end


end
