class UsersController < ApplicationController
   def index
      @user = current_user
   end

   def show
   end

   def edit
   end

   def update
   end

 private
     def user_params
          params.require(:user).permit(:name, :introduction, :profile_image)
     end
end
