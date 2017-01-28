class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to '/owners'
    else
      redirect_to '/signup'
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit
    # stretch
  end

  def update
    # stretch
  end

  def destroy
    # stretch
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
