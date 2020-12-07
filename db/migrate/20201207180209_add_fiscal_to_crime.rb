class AddFiscalToCrime < ActiveRecord::Migration[6.0]
  def change
    add_reference :crimes, :fiscals, null: true, foreign_key: true
  end
end
