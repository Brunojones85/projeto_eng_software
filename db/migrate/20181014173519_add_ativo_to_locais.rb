class AddAtivoToLocais < ActiveRecord::Migration[5.2]
  def change
    add_column :locais, :ativo, :boolean
  end
end
