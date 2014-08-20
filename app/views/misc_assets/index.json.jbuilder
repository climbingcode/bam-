json.array!(@misc_assets) do |misc_asset|
  json.extract! misc_asset, :id
  json.url misc_asset_url(misc_asset, format: :json)
end
