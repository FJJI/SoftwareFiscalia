class AddPronunciadoToCrimeThief < ActiveRecord::Migration[6.0]
  def change
    add_column :crime_thiefs, :pronunciado, :boolean
  end
end
