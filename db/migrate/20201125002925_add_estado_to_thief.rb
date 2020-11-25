class AddEstadoToThief < ActiveRecord::Migration[6.0]
  def change
    add_column :thiefs, :estado, :string
  end
end
