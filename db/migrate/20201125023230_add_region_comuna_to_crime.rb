class AddRegionComunaToCrime < ActiveRecord::Migration[6.0]
  def change
    add_column :crimes, :region, :string
    add_column :crimes, :comuna, :string
  end
end
