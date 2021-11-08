class CheckingsController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!


  def index
    # u = User.find(3)
    # # binding.irb
    # puts "1. This is current user"; p u;  puts "1. This was current user"
    @checkings = User.find(2).checkings.all

  end

  # GET /checkings/new
  def new
    @checking = Checking.new
  end

  # POST /checkings/create
  def create
    puts "\n\n\n\n 301. This is params \n\n"
    p params
    puts "\n\n 301. This is params \n\n\n\n"

    puts "\n\n\n\n 302. This is checking_params \n\n"
    p checking_params
    puts "\n\n 302. This is checking_params \n\n\n\n"

    puts "\n\n\n\n 303. This is @checking = Checking.create(checking_params) \n\n"
    p @checking = Checking.create(checking_params)
    puts "\n\n 303. This was @checking = Checking.create(checking_params) \n\n\n\n"
    puts @checking.errors

    redirect_to '/checkings'

  end

  private

  # Only allow a list of trusted parameters through.
  def checking_params
    params.require(:checking).permit(:name, :studentwork)
  end



end
