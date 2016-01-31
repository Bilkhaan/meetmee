module ProfilesHelper
  def avatar_image(profile)
    profile.image.try(:photo).present? ? profile.image.photo.url : "no-avatar.png"
  end

  def can_add_portfolio?(profile)
    current_user == profile.user
  end
end
