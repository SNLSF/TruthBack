class Traits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :word
      t.belongs_to :photo

      t.timestamps
    end
  end
end
