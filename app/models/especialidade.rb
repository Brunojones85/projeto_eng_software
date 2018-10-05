class Especialidade < ActiveRecord::Base
    validates_presence_of :Descricao, :message => "- Campo obrigatorio" 
	validates_presence_of :Nome, :message => "- Campo obrigatorio"

end


