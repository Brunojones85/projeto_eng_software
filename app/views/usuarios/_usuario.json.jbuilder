json.extract! usuario, :id, :nome, :numerosus, :senha, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
