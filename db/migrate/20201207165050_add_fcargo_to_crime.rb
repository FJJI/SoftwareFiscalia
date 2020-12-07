class AddFcargoToCrime < ActiveRecord::Migration[6.0]
  def change
    add_column :crimes, :fcargo, :string
  end
end
