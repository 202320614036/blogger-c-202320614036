class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.string :image
      t.string :github
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
