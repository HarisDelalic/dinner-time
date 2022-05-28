if @resources.empty?
  json.array!([{ name: 'Create new Resource', link: '/resources/new' }])
else
  json.array!(@resources) do |resource|
    json.name resource.name
    json.link '/resources/' + resource.id.to_s
  end
end