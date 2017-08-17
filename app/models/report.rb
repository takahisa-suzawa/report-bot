class Report < ApplicationRecord
  has_many :articles, dependent: :destroy
end
