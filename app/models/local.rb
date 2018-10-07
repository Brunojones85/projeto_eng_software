class Local < ApplicationRecord

  validates :nome, presence: true, uniqueness: true
  validates :cep, presence: true
  validates :numero, presence: true
end
