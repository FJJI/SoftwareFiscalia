class AddUserToCarabineros < ActiveRecord::Migration[6.0]
  def change
    add_reference :carabineros, :user, null: false, foreign_key: true
  end
end
