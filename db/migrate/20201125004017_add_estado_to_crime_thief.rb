class AddEstadoToCrimeThief < ActiveRecord::Migration[6.0]
  def change
    add_column :crime_thiefs, :estado, :string
  end
end
