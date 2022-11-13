class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
    
  end
  
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    # 3. データをデータベースに保存するためのsaveメソッド実行
    cart_item.save
   
    # 4. トップ画面へリダイレクト
    redirect_to '/cart_items'
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])  #削除するPostImageレコードを取得
    @cart_item.destroy#削除
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_user.cart_items.destroy_all
    
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
 
  
end