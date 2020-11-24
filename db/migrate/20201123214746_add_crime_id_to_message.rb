class AddCrimeIdToMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :crime_id, :integer
  end
end
