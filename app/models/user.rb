class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :adverts
  has_many :comments
  has_many :responses
  has_many :adverts, through: :responses

  validates :email, presence: true
  validates :login, presence: true
  validates :full_name, presence: true
  validates :birthday, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :zip, presence: true
  validates :role, presence: true

  def admin?
    role == 'Admin'
  end

  def client?
    role == 'Client'
  end

  def worker?
    role == 'Worker'
  end

  def has_response?(advert_id)
    Response.exists? user_id: self, advert_id: advert_id
  end

  def response_status(advert_id)
    Response.find_by(user_id: self, advert_id: advert_id).status
  end
end
