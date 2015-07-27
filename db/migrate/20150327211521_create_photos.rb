class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.integer :trait_id # the trait the author chose for this survey
      t.belongs_to :user

      t.timestamps
    end
  end
end
