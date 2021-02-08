class Request < ApplicationRecord
  validates :source_uuid, presence: true, uniqueness: true
  validates :post_raw_data, presence: true
end
