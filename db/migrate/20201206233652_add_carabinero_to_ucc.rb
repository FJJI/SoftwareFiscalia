class AddCarabineroToUcc < ActiveRecord::Migration[6.0]
  def change
    add_reference :uccs, :carabinero, null: false, foreign_key: true
  end
end
