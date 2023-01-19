class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :status
  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
end
