class Local < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :cep, presence: true
  validates :ativo, inclusion: { in: [ true, false ] }
  validates :numero, presence: true
  belongs_to :cidade
end
