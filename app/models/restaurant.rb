class Restaurant < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :name, message: "can't be blank"
  validates :cuisine, inclusion: { in: %w[Italian Lebanese Japanese Belgian French Chinese] }
end
