json.array!(@guidelines) do |guideline|
  json.extract! guideline, :id
  json.url guideline_url(guideline, format: :json)
end
