# -------------------------------------------------
#Esta classe representa o cadastro de especialiades 
#--------------------------------------------------
class Especialidade < ActiveRecord::Base
  has_and_belongs_to_many :medicos
  validates_presence_of :Nome, :message => "- Campo obrigatorio"
   #Campo campo ativo foi criado para não excluir o rgistro especialiade 
   # por ter relacionamento com outras tabelas e dados históricos de consulta 
   # apenas desativamos o registro
   validates :ativo, inclusion: { in: [ true, false ] }      
end


