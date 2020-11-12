class CreateAdverts < ActiveRecord::Migration[6.0]
  def change
    create_table :adverts do |t|
      t.attachment :picture
      t.string :text
      t.belongs_to :user

      t.timestamps
    end
  end
end
