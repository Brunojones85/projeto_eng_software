class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nome, presence: true
  validates :numerosus, presence: true, uniqueness: true
  validates :cpf, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :agendamentos
  has_many :locais, :through => :agendamentos
  has_many :medicos, :through => :agendamentos

end
