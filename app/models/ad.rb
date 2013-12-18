class Ad < ActiveRecord::Base
  validates :title_id, :sentence1_id, :sentence2_id, presence: true, numericality: {greater_than: 0}
  belongs_to :title
  belongs_to :sentence1, class_name: 'Sentence'
  belongs_to :sentence2, class_name: 'Sentence'
end
