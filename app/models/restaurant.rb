class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :trackable, :validatable


  belongs_to :owner

  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations

  def reservation
  	@reservation = Reservation.new
  end
end
