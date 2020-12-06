class AddFiscalToUfc < ActiveRecord::Migration[6.0]
  def change
    add_reference :ufcs, :fiscals, null: true, foreign_key: true
  end
end
