class StudyGroupsController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!


  def self.teacher_name
    puts "4. This is self"; p self;  puts "4. This was self"
    puts "5. This is self.teacher_id"; p self.teacher_id;  puts "5. This was self.teacher_id"
    @teacher_name = User.find(self.teacher_id).regular_name
  end



end
