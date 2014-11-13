json.array!(@texto_lancamentos) do |texto_lancamento|
  json.extract! texto_lancamento, :id, :nome, :descricao
  json.url texto_lancamento_url(texto_lancamento, format: :json)
end
