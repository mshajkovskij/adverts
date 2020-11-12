class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :advert

  validates :text, presence: true
end
