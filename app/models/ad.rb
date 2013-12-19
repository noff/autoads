class Ad < ActiveRecord::Base
  validates :title_id, :sentence1_id, :sentence2_id, presence: true, numericality: {greater_than: 0}
  validates :title_id, uniqueness: {scope: [:sentence1_id, :sentence2_id]}
  belongs_to :title
  belongs_to :sentence1, class_name: 'Sentence'
  belongs_to :sentence2, class_name: 'Sentence'

  # @return String
  def generate_url
    "http://yellowbricks.ru/?utm_source=google&utm_medium=cpc&utm_campaign=ad_#{id}"
  end


end
