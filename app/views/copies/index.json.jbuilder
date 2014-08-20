json.array!(@copies) do |copy|
  json.extract! copy, :id
  json.url copy_url(copy, format: :json)
end
