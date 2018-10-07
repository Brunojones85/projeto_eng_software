json.extract! local, :id, :nome, :cep, :rua, :numero, :estado, :cidade, :bairro, :telefone, :created_at, :updated_at
json.url local_url(local, format: :json)
