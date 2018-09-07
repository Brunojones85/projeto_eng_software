class Usuario < ApplicationRecord
  validates :nome, presence: true
  validates :numerosus, presence: true
  validates :senha, presence: true  
  validates :cpf, presence: true
  validates :email, presence: true
end

