class Medico < ApplicationRecord
  has_and_belongs_to_many :especialidades 
  accepts_nested_attributes_for :especialidades
  validates_presence_of :nome, :message => "- Campo obrigatorio"

  #fix-it:Validar crm corretamente daria mais trabalho do que isso que eu fiz. Por enquanto exige apenas numeros
  #http://www.guj.com.br/t/validacao-de-crm-conelho-regional-de-medicina/110130
  validates_presence_of :crm, :message => "- Campo obrigatorio"
  #Fix-it: Arrumar o testes pra usar essa validacao
  #validates :crm, :uniqueness => true   #Nao permite crm que ja tenha sido utilizado anteriormente

  validates_presence_of :local, :message => "- Campo obrigatorio"
  validates_presence_of :email, :message => "- Campo obrigatorio"
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }  #exige um email valido
  validates :email, :uniqueness => true   #idem crm

  validates_presence_of :sexo, :message => "- Campo obrigatorio"
  validates_presence_of :situacao, :message => "- Campo obrigatorio"
  #validates_presence_of :especialidade_id, :message => "can't be empty"
  has_many :agendamentos
  has_many :locais, :through => :agendamentos
  has_many :usuarios, :through => :agendamentos
end
