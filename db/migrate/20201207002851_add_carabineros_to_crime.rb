class AddCarabinerosToCrime < ActiveRecord::Migration[6.0]
  def change
    add_reference :crimes, :carabineros, null: true, foreign_key: true
  end
end
