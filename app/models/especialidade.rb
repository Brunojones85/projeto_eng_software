class Especialidade < ActiveRecord::Base
  has_and_belongs_to_many :medicos
  validates_presence_of :Nome, :message => "- Campo obrigatorio"
        
end


