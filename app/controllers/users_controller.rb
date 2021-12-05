class UsersController < ApplicationController

    before_action :authenticate_user!

    def edit
      @user = current_user
    end

    def update
      params.permit!
      @user = current_user
      @user.update(params[:user])
      if @user.errors.empty?
        redirect_to root_path
      else
        render "edit"
      end
    end

end
