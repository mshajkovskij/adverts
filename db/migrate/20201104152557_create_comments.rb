class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false
      t.belongs_to :user
      t.belongs_to :advert

      t.timestamps
    end
  end
end
