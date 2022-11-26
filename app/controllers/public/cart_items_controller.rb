class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
    
  end
  
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    count = 0
        @cart_items.each do |cart_item|
          if cart_item.item_id==@cart_item.item_id
          cart_item.amount = cart_item.amount + @cart_item.amount
          cart_item.save
          count += 1
          end
         
        end
          if count == 0
            @cart_item.save
          end
    
   
    # 4. トップ画面へリダイレクト
    redirect_to '/cart_items'
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path(@cart_item.id)
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to '/cart_items'
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to '/cart_items'
    
  end
  
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
 
  
end