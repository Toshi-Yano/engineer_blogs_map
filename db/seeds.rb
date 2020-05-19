require "csv"

CSV.foreach('db/tags.csv', headers: true) do |row|
  Tag.create(
    name: row['name'],
  )
end