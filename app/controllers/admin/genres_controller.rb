class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genre.new
    @genres = Genre.all
    
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    genre = Genre.new(genre_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    gen.save
    # 4. トップ画面へリダイレクト
    redirect_to '/top'
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
   private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end

end
