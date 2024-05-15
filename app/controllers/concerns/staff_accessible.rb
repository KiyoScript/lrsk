module StaffAccessible
  extend ActiveSupport::Concern

  included do
    before_action :user_restriction!
  end

  protected

  def user_restriction!
    unless current_user.staff? || current_user.administrator?
      respond_to do |format|
        format.html { redirect_to root_path, alert: "You are not authorized to access this page"  }
      end
    end
  end
end
