json.array!(@logos) do |logo|
  json.extract! logo, :id
  json.url logo_url(logo, format: :json)
end
