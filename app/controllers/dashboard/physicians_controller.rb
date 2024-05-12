class Dashboard::PhysiciansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_policy!
  before_action :set_physician

  def index
    respond_to  do |format|
      format.html {
        @filtered_physicians = Physician.ransack(params[:q])
        @pagy, @physicians = pagy(@filtered_physicians.result.order(created_at: :desc), items: 10)
      }
    end
  end


  def new
    @physician = current_user.physicians.new
  end

  def show;end

  def create
    respond_to do |format|
      @physician = current_user.physicians.new(physician_params)
      if @physician.save
        format.html { redirect_to dashboard_physician_path(@physician), notice: "Successfully created" }
      else
        format.html { redirect_to new_dashboard_physician_path, alert: @physician.errors.full_messages.first }
      end
    end
  end

  def edit;end

  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to dashboard_physician_path(@physician), notice: "Successfully updated" }
      else
        format.html { redirect_to dashboard_physician_path(@physician), alert: @physician.errors.full_messages.first }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @physician.destroy
        format.html { redirect_to dashboard_physicians_path, notice: "Successfully deleted" }
      else
        format.html { redirect_to dashboard_physicians_path, alert: @physician.errors.full_messages.first }
      end
    end
  end

  private

  def set_physician
    @physician = Physician.find_by_id(params[:id])
  end
  def physician_params
    params.require(:physician)
      .permit(
        :user_id,
        :firstname,
        :middle_initial,
        :lastname,
        :gender,
        :contact_number,
        :email_address
      )
  end

  def set_policy!
    authorize User, policy_class: Dashboard::PhysiciansPolicy
  end
end
