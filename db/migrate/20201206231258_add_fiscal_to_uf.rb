class AddFiscalToUf < ActiveRecord::Migration[6.0]
  def change
    add_reference :ufs, :fiscals, null: true, foreign_key: true
  end
end
