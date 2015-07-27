class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :trait
  belongs_to :photo
end