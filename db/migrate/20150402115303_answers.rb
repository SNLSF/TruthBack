class Answers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id  # the user who answered the survey
      t.integer :photo_id # the photo of the survey
      t.integer :trait_id # the trait the answering user picked
    end
  end
end
