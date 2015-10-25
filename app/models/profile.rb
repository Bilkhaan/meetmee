class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :portfolios
  has_one :image, as: :imageable

  accepts_nested_attributes_for :image, :reject_if => lambda { |a| a[:photo].blank? }
end
