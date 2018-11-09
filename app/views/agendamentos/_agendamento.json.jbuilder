json.extract! agendamento, :id, :data, :local_id, :especialidade_id, :medico_id, :usuario_id, :created_at, :updated_at
json.url agendamento_url(agendamento, format: :json)
