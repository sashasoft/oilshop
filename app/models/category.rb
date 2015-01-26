class Category < ActiveRecord::Base
  belongs_to :brand
  has_many :subcategories
  validates :name, presence: true, length: { minimum: 8 }
end
