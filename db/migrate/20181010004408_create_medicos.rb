class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.string :nome
      t.string :crm
      t.string :local
      t.string :telefone
      t.string :celular
      t.string :email
      t.string :sexo
      t.string :situacao

      t.timestamps
    end
  end
end
