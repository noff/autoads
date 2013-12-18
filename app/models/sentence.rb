class Sentence < ActiveRecord::Base
  validates :value, presence: true, length: {maximum: 35}
  has_many :ads, foreign_key: 'sentence1_id', class_name: 'Ad', dependent: :destroy
  has_many :ads2, foreign_key: 'sentence2_id', class_name: 'Ad', dependent: :destroy
end
