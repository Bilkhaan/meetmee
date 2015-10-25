module ProfilesHelper
  def avatar_image(profile)
    profile.image.try(:photo).present? ? profile.image.photo.url : "no-avatar.png"
  end
end
