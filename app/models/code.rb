class Code < ApplicationRecord
  # has_one :user

  belongs_to :hospital

  validates :code, presence: true, uniqueness: true
end




