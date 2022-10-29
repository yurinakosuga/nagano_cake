class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end
  
  def new
     @item = Item.new
  end
  
  def create
    item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    item.save
    
    
    redirect_to admin_items_path
    
  end
  
  def show
    @item = Item.find(params[:id]) 
  end
  
  def edit
  end
  
  def update
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active)
  end

end
