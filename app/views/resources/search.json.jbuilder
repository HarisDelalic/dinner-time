json.array!(@resources) do |resource|
  json.name resource.name
  json.link '/resources/' + resource.id.to_s
end