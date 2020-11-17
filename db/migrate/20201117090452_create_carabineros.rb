class CreateCarabineros < ActiveRecord::Migration[6.0]
  def change
    create_table :carabineros do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
