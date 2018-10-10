class Medico < ApplicationRecord
  has_and_belongs_to_many :especialidades
  accepts_nested_attributes_for :especialidades
end
