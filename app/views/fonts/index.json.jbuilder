json.array!(@fonts) do |font|
  json.extract! font, :id
  json.url font_url(font, format: :json)
end
