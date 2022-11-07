class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
     @cart_items.each do |cart_item|
       @total = @total + cart_item.subtotal
     end
    
  end
  
  
  def create
    cart_item = CartItem.new(cart_item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    cart_item.save
    # 4. トップ画面へリダイレクト
    redirect_to '/cart_items'
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def destroy_all
    current_user.cart_items.destroy_all
    
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
 
  
end