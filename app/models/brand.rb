class Brand < ActiveRecord::Base
  has_many :categories, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }
end
