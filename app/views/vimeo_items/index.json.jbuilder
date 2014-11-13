json.array!(@vimeo_items) do |vimeo_item|
  json.extract! vimeo_item, :id, :item, :nome, :descricao
  json.url vimeo_item_url(vimeo_item, format: :json)
end
