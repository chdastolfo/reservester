class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates :email, presence: true, uniqueness: true
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create 

has_many :restaurants, :foreign_key => :owner_id
has_many :favorite_restaurants, through: :favorites, :source => :restaurant
has_many :favorites 
validates_presence_of :role

		def owner?
			role == "owner"
		end

		def admin?
			role == "admin"
		end

		def patron?
			role == "patron"
		end

def is_favorited?(restaurant)
  favorited_restaurants.include?(restaurant)
end

end
