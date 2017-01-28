class SessionsController < ApplicationController
  def new
    @owner = Owner.new
  end
  def create
    owner = Owner.find_by_email(owner_params[:email])

    if owner && owner.authenticate(owner_params[:password])
      session[:owner_id] = owner.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end
  def destroy
    session[:owner_id] = nil
    redirect_to '/login'
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
