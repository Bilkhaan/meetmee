class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile

  after_create :initiate_profile

  def user_name
    self.profile.present? ? self.profile.user_name : 'bilkhan'
  end

  private

  def initiate_profile
    self.build_profile
    self.save
  end
end
