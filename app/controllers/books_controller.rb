class BooksController < ApplicationController
     def index
       @book = Book.new
       @books = Book.all
       @user = current_user
     end

     def show
         @user = current_user
         @books = Book.all
         @book = Book.find(params[:id])
         @book_new = Book.new
     end

     def create
      # １. データを新規登録するためのインスタンス作成
      @user = current_user
      @books = Book.all
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      # ２. データをデータベースに保存するためのsaveメソッド実行
      if @book.save
         flash[:notice] = "You have create book succesfully."
         # ３.showページに飛ぶ
         redirect_to book_path(@book)
      else
         render :index
      end
     end


     def edit
         @book = Book.find(params[:id])
     end

     def update
         @book = Book.find(params[:id])
         if @book.update(book_params)
             flash[:notice] = "You have updated book succesfully."
             redirect_to book_path(@book)
         else
             render :edit
         end
     end

     def destroy
         book = Book.find(params[:id])  # データ（レコード）を1件取得
         book.destroy  # データ（レコード）を削除
         redirect_to books_path  # 投稿一覧画面へリダイレクト
     end

     private
     def book_params
          params.require(:book).permit(:title, :body)
     end
end
