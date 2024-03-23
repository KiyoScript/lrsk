module ApplicationHelper
  include Pagy::Frontend


  def profile_picture
    if current_user.avatar.presence
      current_user.avatar
    else
      current_user.male? ? image_path("default_male") : image_path("default_female")
    end
  end

  def user_profile_picture(user)
    if user.avatar.presence
      user.avatar
    else
      user.male? ? image_path("default_male") : image_path("default_female")
    end
  end


  def username
    current_user.email.split('@')[0]
  end

  def format_datetime(datetime)
    datetime.strftime("%d %b %Y, %I:%M %p")
  end
end
