class Advert < ApplicationRecord
  has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :responses
  has_many :users, through: :responses
  has_many :comments, dependent: :destroy

  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}
  validates :text, presence: true
end
