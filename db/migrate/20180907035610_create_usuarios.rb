class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :cpf
      t.integer :cns
      t.string :email
      t.date :dtanasc
      t.string :telfixo
      t.string :telcel
      t.string :sexo
      t.string :senha

      t.timestamps
    end
  end
end
