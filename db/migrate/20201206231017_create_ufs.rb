class CreateUfs < ActiveRecord::Migration[6.0]
  def change
    create_table :ufs do |t|

      t.timestamps
    end
  end
end
