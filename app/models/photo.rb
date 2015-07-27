class Photo < ActiveRecord::Base

  belongs_to :user
  belongs_to :trait
  has_many :answers
  has_many :answer_traits, through: :answers, class_name: 'Trait'

  # validates :url, uniqueness: true
end
