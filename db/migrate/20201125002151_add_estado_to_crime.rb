class AddEstadoToCrime < ActiveRecord::Migration[6.0]
  def change
    add_column :crimes, :estado, :string
  end
end
