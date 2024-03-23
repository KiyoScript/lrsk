class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def update
    respond_to do |format|
      if resource.update(user_params)
        format.html { redirect_back fallback_location: dashboard_profile_index_path, notice: "Profile updated successfully" }
      else
        format.html { redirect_back fallback_location: dashboard_profile_index_path, alert: resource.errors.full_messages.first }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :password,
      :password_confirmation
    ).merge(email: current_user.email)
  end
end
