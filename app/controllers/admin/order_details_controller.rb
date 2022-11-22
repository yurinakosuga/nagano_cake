class Admin::OrderDetailsController < ApplicationController
   def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)
    redirect_to root_path  
  end
  
  private
  # ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:price, :amount, :making_status)
  end

end

