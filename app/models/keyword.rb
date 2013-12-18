class Keyword < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
end
