class CreateJoinTableAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    create_join_table :medicos, :especialidades do |t|
      # t.index [:medico_id, :especialidade_id]
      # t.index [:especialidade_id, :medico_id]
    end
  end
end
