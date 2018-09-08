class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :numerosus
      t.string :cpf
      t.date :dtanasc
      t.string :telfixo
      t.string :telcel
      t.string :sexo

      t.timestamps
    end
  end
end
