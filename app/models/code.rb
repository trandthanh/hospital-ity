class Code < ApplicationRecord
  has_one :user
  validates :code, presence: true, uniqueness: true
end




