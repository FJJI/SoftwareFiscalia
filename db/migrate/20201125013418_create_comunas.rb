class CreateComunas < ActiveRecord::Migration[6.0]
  def change
    create_table :comunas do |t|
      t.string :comuna
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
