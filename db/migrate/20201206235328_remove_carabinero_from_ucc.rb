class RemoveCarabineroFromUcc < ActiveRecord::Migration[6.0]
  def change
    remove_column :uccs, :carabinero_id
  end
end
