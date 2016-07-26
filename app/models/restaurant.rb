class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user

  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
  
  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations
  has_and_belongs_to_many :categories

  def reservation
  	@reservation = Reservation.new
  end

  def favorited_by?(user)
    favorited_by.include?(user)
  end

  def exists?(reservation)
    reservations.include?(reservation)
  end

end
