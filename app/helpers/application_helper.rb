module ApplicationHelper
  include Pagy::Frontend

  ROLE_BADGE_CLASS = {
    "unregistered" => "badge badge-light",
    "staff" => "badge badge-light-info",
    "administrator" => "badge badge-light-success"
  }.freeze

  GENDER_BADGE_CLASS = {
    "female" => "badge badge-light-warning",
    "male" => "badge badge-light-primary"
  }.freeze

  def role_badge(role)
    badge_class = ROLE_BADGE_CLASS[role] || ROLE_BADGE_CLASS["unregistered"]
    content_tag(:span, role.capitalize, class: badge_class)
  end

  def gender_badge(gender)
    badge_class = GENDER_BADGE_CLASS[gender] || GENDER_BADGE_CLASS["female"]
    content_tag(:span, gender.capitalize, class: badge_class)
  end


  def full_name(user)
    user.firstname + " " + user.lastname
  end

  def staff_username(user)
    user.email.split('@')[0]
  end

  def profile_picture
    if current_user.avatar.presence
      current_user.avatar
    else
      current_user.male? ? image_path("default_male.svg") : image_path("default_female.svg")
    end
  end

  def user_profile_picture(user)
    if user.avatar.presence
      user.avatar
    else
      user.male? ? image_path("default_male.svg") : image_path("default_female.svg")
    end
  end


  def username
    current_user.email.split('@')[0]
  end

  def format_datetime(datetime)
    datetime.strftime("%d %b %Y, %I:%M %p")
  end
end
