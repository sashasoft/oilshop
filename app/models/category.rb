class Category < ActiveRecord::Base
  belongs_to :brand
  validates :name, presence: true, length: { minimum: 8 }
end
