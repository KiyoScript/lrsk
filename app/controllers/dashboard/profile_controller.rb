class Dashboard::ProfileController < ApplicationController

  def index;end

  def update
    if current_user.update(user_params)
      flash_message = { success: "Your Profile has been updated" }
    else
      flash_message = { error: current_user.errors.full_messages.first }
    end
    redirect_back fallback_location: dashboard_profile_index_path, flash: flash_message
  end

  def destroy
    current_user.destroy
    redirect_to user_session_path, notice: "Your account has been deleted"
  end

  private

  def user_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :gender,
      :email,
      :avatar
    )
  end
end
