class Infographic < ApplicationRecord
  belongs_to :sub_category
  belongs_to :category
  belongs_to :secret_category
  belongs_to :secret_sub_category
  has_one_attached :image
end
