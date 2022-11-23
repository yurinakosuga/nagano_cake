class Public::OrdersController < ApplicationController
  def new
    @order = Order.new 
    @orders = Order.all
    
  end
  
  def index
    @order = Order.new 
    @orders = Order.all
    
    
  end  
  
  def show
    
  end  
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = params[:order][:status]
        @order.save

        # ordered_itmemの保存
        current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @order_detail = OrderDetail.new #初期化宣言
          @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
          @order_detail.amount = cart_item.amount #商品の個数を注文商品の個数に代入
          @order_detail.price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
          @order_detail.order_id =  @order.id#注文商品に注文idを紐付け
          @order_detail.save #注文商品を保存
        end #ループ終わり

        current_customer.cart_items.destroy_all #カートの中身を削除
        redirect_to orders_complete_path
    
  end  
  
  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.payment_method = params[:order][:payment_method]
    @order.status = params[:order][:status]
    
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
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end
  
end
