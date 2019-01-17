class Code < ApplicationRecord
  has_one :user

  validates :code, uniqueness: true
end
