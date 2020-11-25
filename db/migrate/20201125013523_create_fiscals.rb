class CreateFiscals < ActiveRecord::Migration[6.0]
  def change
    create_table :fiscals do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
