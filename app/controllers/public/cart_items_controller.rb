class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
     @cart_items.each do |cart_item|
       @total = @total + cart_item.subtotal
     end
    
  end
  
  
  def create
    
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