class CreateUfcs < ActiveRecord::Migration[6.0]
  def change
    create_table :ufcs do |t|

      t.timestamps
    end
  end
end
