class AddCarabinerosToUcc < ActiveRecord::Migration[6.0]
  def change
    add_reference :uccs, :carabineros, null: false, foreign_key: true
  end
end
