class UsersController < ApplicationController

    before_action :authenticate_user!

    def edit
      @user = current_user
    end


    # /products/1  PUT
    def update
      params.permit! #Пришлось добавить, т.к. ругалось на Unpermitted params
      @user = current_user
      @user.update(params[:user])
      if @user.errors.empty?
        # redirect_to product_path(@product) # - отображает отредактированный продукт
        redirect_to root_path # - переводит в раздел "Все продукты"
      else
        render "edit"
      end
    end

end
