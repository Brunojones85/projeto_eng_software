class Agendamento < ApplicationRecord
  #Somente um registro de consulta por data para determinado medico
  validates_uniqueness_of :medico, :scope => [:data ]
  #Somente um registro de consulta por data para determinado usuario(paciente)
  validates_uniqueness_of :usuario, :scope => [:data] , if: -> { usuario.present? }

  belongs_to :local
  belongs_to :especialidade
  belongs_to :medico
  belongs_to :usuario, optional: true

  ransacker :data_desejada do
    Arel.sql('date(data)')
  end

end
