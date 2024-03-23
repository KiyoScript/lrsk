module AdminAccessible
  extend ActiveSupport::Concern

  included do
    before_action :user_restriction!
  end

  protected

  def user_restriction!
    unless current_user.administrator?
      redirect_to root_path, flash: { error: "You are not authorized to access this page" }
    end
  end
end
