json.array! @blogs do |blog|
  json.id blog.id
  json.title blog.title
  json.url blog.url
end