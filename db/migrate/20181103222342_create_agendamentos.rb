class CreateAgendamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :agendamentos do |t|
      t.datetime :data
      t.references :local, foreign_key: true
      t.references :especialidade, foreign_key: true
      t.references :medico, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
