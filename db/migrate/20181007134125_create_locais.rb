class CreateLocais < ActiveRecord::Migration[5.2]
  def change
    create_table :locais do |t|
      t.string :nome
      t.string :cep
      t.string :rua
      t.string :numero
      t.integer :cidade_id    
      t.string :bairro
      t.string :telefone

      t.timestamps
    end
  end
end
