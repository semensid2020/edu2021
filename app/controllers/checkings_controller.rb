class CheckingsController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  def index
    @checkings = User.find(2).checkings.all
  end

  # GET /checkings/new
  def new
    @checking = Checking.new
  end

  # POST /checkings/create
  def create
    @checking = Checking.create(checking_params)
    redirect_to '/checkings'
  end

  private

  def checking_params
    params.require(:checking).permit(:name, :studentwork)
  end

end
