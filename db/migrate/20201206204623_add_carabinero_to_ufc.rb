class AddCarabineroToUfc < ActiveRecord::Migration[6.0]
  def change
    add_reference :ufcs, :carabineros, null: true, foreign_key: true
  end
end
