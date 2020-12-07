class CreateUccs < ActiveRecord::Migration[6.0]
  def change
    create_table :uccs do |t|

      t.timestamps
    end
  end
end
