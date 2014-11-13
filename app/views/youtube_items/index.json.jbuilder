json.array!(@youtube_items) do |youtube_item|
  json.extract! youtube_item, :id, :item, :nome, :descricao
  json.url youtube_item_url(youtube_item, format: :json)
end
