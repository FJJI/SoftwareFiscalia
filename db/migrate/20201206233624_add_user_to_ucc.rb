class AddUserToUcc < ActiveRecord::Migration[6.0]
  def change
    add_reference :uccs, :user, null: false, foreign_key: true
  end
end
