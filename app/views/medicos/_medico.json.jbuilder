json.extract! medico, :id, :nome, :crm, :local, :telefone, :celular, :email, :sexo, :situacao, :created_at, :updated_at
json.url medico_url(medico, format: :json)
