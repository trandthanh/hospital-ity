class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  belongs_to :hospital


  # Note: Linking Code to User
  belongs_to :code, optional: true


  has_many :flats
  has_many :bookings
  has_many :reviews

  # validates :code, presence: true, if: Proc.new { |user| user.super_host == false }
  validates :family_member, presence: true, if: Proc.new { |user| user.super_host.nil? }
  validates :family_member, presence: true, if: Proc.new { |user| user.hospital_admin.nil? }

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end
end



