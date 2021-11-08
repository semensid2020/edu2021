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
    puts "\n\n\n\n 0. This is @predmets"; p @predmets;  puts "0. This was @predmets \n\n"
    u = current_user
    # u = current_user    # Благодаря Devise
    puts "\n\n\n\n 1. This is current user \n\n"; p u;  puts "\n\n 1. This was current user \n\n\n\n"
    study_groups = u.study_groups
    puts "\n\n\n\n 2. This is study_groups \n\n"; p study_groups;  puts "\n\n 2. This was study_groups \n\n\n\n"


    study_groups.each do |gr|
      puts "\n\n\n 4. This is @predmets"; p @predmets;  puts "\n\n\n 4. This was @predmets"
      @predmets.push gr.predmet
      puts "\n\n\n 5. This is @predmets NOW"; p @predmets;  puts "\n\n\n 5. This was @predmets NOW"
    end
    
    puts "\n\n\n 6. This is @predmets finally"; p @predmets;  puts "\n\n\n 6. This was @predmets"

    render 'predmets/no_predmets' if @predmets.blank?
    @predmets
  end

end
