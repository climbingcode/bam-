module ColorsHelper

def hex_as_json(colors)
	hex = colors.find_by(primary: true).hex
	return hex.to_json
end

end
