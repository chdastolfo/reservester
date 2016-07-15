class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
   #      :recoverable, :rememberable, :trackable, :validatable

  #attr_accessor :content, :owner_id

  belongs_to :owner

  has_many :reservations, through: :owners
  accepts_nested_attributes_for :reservations
end
