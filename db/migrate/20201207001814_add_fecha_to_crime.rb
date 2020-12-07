class AddFechaToCrime < ActiveRecord::Migration[6.0]
  def change
    add_column :crimes, :fecha, :datetime
  end
end
