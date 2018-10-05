class CreateEspecialidades < ActiveRecord::Migration[5.2]
  def change
    create_table :especialidades do |t|
      t.string :Nome
      t.string :Descricao

      t.timestamps
    end
  end
end
