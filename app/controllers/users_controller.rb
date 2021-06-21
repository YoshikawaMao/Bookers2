class UsersController < ApplicationController
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
   end

   def update
   end

 private
     def user_params
          params.require(:user).permit(:name, :introduction, :profile_image)
     end
end
