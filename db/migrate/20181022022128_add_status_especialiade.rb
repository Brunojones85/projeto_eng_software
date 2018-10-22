class AddStatusEspecialiade < ActiveRecord::Migration[5.2]
  def change
    add_column :especialidades, :ativo, :boolean
  end
end
