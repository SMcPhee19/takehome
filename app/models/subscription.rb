class Subscription < ApplicationRecord
  belongs_to :Customer
  belongs_to :Tea
end
