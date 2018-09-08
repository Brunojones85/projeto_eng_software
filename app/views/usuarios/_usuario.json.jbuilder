json.extract! usuario, :id, :nome, :numerosus, :cpf, :dtanasc, :telfixo, :telcel, :sexo, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
