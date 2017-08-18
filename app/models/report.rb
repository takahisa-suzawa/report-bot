class Report < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :informations, dependent: :destroy
end
