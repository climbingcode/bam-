json.array!(@colors) do |color|
  json.extract! color, :id
  json.url color_url(color, format: :json)
end
