class Code < ApplicationRecord

  # Note: Linking Code to User
  has_one :user

  belongs_to :hospital

  validates :code, presence: true, uniqueness: true
end




