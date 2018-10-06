class Especialidade < ActiveRecord::Base
   	validates_presence_of :Nome, :message => "- Campo obrigatorio"

end


