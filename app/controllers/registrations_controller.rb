class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Hellow there, #{resource.first_name}!"
  end

  private

  def sign_up_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
