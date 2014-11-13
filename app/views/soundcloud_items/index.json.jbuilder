json.array!(@soundcloud_items) do |soundcloud_item|
  json.extract! soundcloud_item, :id, :item, :nome, :descricao
  json.url soundcloud_item_url(soundcloud_item, format: :json)
end
