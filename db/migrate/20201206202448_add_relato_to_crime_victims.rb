class AddRelatoToCrimeVictims < ActiveRecord::Migration[6.0]
  def change
    add_column :crime_victims, :relato, :string
  end
end
