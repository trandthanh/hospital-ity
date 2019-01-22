class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :hospital


  belongs_to :code, optional: true


  has_many :flats
  has_many :bookings
  has_many :reviews

  validates :code, presence: true, if: Proc.new { |user| user.super_host == false }
end



