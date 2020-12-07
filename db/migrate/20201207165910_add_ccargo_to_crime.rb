class AddCcargoToCrime < ActiveRecord::Migration[6.0]
  def change
    add_column :crimes, :ccargo, :string
  end
end
