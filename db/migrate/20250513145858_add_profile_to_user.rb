class AddProfileToUser < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :profile, null: true, foreign_key: true
  end
end
