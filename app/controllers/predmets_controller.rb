class PredmetsController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!


  def index
    # u = User.find(3)
    # # binding.irb
    # puts "1. This is current user"; p u;  puts "1. This was current user"
    @predmets = Predmet.all

  end

  def show
    @predmets = []
    puts "0. This is @predmets"; p @predmets;  puts "0. This was @predmets"
    u = current_user
    # u = current_user    # Благодаря Devise
    puts "1. This is current user"; p u;  puts "1. This was current user"
    u.study_groups.each do |gr|
      puts "2. This is @predmets"; p @predmets;  puts "0. This was @predmets"
      @predmets.push gr.predmet
    end
    puts "3. This is @predmets finally"; p @predmest;  puts "0. This was @predmets"
    render 'predmets/no_predmets' if @predments.blank? 
    @predmets
  end

end
