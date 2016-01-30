class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :portfolios
  has_one :image, as: :imageable

  accepts_nested_attributes_for :image, :reject_if => lambda { |a| a[:photo].blank? }

  def get_user_name
    self.name.present? ? self.name : 'Set your name'
  end

  def user_education
    self.education.present? ? self.education : 'Please state your educational information'
  end

  def about_user
    self.about_me.present? ? self.about_me : 'Please add some information about yourself'
  end

  def user_location
    self.location.present? ? self.location : 'Location not provided'
  end

  def user_email_address
    self.email_address.present? ? self.email_address : 'example@meetmee.com'
  end
end
