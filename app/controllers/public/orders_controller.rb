class Public::OrdersController < ApplicationController
  def new
    @order = Order.new 
    @orders = Order.all
    
  end
  
  def index
    
  end  
  
  def show
    
  end  
  
  def create
    @order = Order.new(order_params)
        @order.member_id = current_member.id
        @order.save

        # ordered_itmemの保存
        current_member.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @ordered_item = OrderedItem.new #初期化宣言
          @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
          @ordered_item.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
          @ordered_item.tax_included_price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
          @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
          @ordered_item.save #注文商品を保存
        end #ループ終わり

        current_member.cart_items.destroy_all #カートの中身を削除
        redirect_to thanx_orders_path
    
  end  
  
  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:payment_method] == "0"
      @order.payment_method = "クレジットカード"
    elsif params[:order][:payment_method] == "1"
      @order.payment_method = "銀行振込"
    end
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    
    elsif params[:order][:select_address] == "1" 
      @order.postal_code = params[:order][:postal_code] 
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    
    
    end
    
    
  end  
  
  def complete
    
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
end
