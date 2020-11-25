class AddMarcaToCrimeThief < ActiveRecord::Migration[6.0]
  def change
    add_column :crime_thiefs, :marca, :string
  end
end
