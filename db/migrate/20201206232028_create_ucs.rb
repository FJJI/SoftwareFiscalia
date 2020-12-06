class CreateUcs < ActiveRecord::Migration[6.0]
  def change
    create_table :ucs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :carabineros, null: false, foreign_key: true

      t.timestamps
    end
  end
end
