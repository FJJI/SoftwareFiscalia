class AddRelatoToCrimeWitnesses < ActiveRecord::Migration[6.0]
  def change
    add_column :crime_witnesses, :relato, :string
  end
end
