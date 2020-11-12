class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :status, null: false
      t.belongs_to :user
      t.belongs_to :advert

      t.timestamps
    end
  end
end
