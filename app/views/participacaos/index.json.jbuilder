json.array!(@participacaos) do |participacao|
  json.extract! participacao, :id, :dialog, :titulo, :imagem, :texto, :nota
  json.url participacao_url(participacao, format: :json)
end
