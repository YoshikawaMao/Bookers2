class BooksController < ApplicationController
     def index
       @book = Book.new
       @books = Book.all
       @user = current_user
     end

     def show
     end

     def create
      # １. データを新規登録するためのインスタンス作成
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      # ２. データをデータベースに保存するためのsaveメソッド実行
      @book.save
      # ３.showページに飛ぶ
      redirect_to book_path(@book)
     end


     def edit
     end

     def update
     end

     def destroy
     end

     private
     def book_params
          params.require(:book).permit(:title, :body)
     end
end
