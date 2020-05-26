json.array! @blogs do |blog|
  json.id blog.id
  json.title blog.title
  json.url blog.url
  json.owner_id blog.owner_id
end