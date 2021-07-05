class UsersController < ApplicationController

   before_action :authenticate_user!
   before_action :set_user, only: %I[show edit update destroy followeds followers]

   def index
      @user = current_user
      @book = Book.new
      @users = User.all

   end

   def show
      @user = User.find(params[:id])
      @book_new = Book.new
      @books = @user.books
   end

   def edit
       @user = User.find(params[:id])
       if @user == current_user
         render "edit"
       else
         redirect_to user_path(current_user)
       end
   end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have update user successfully"
       redirect_to user_path(@user)
    else
         render :edit
    end
   end

   def followeds
     @followeds = @user.followed_users
   end

   def followers
     @followers = @user.follower_users
   end


 private
     def user_params
          params.require(:user).permit(:name, :introduction, :profile_image)
     end

     def set_user
         @user = User.find(params[:id])
     end
end
