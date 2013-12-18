class Title < ActiveRecord::Base
  validates :value, presence: true, length: {maximum: 25}
  has_many :ads, dependent: :destroy
end
