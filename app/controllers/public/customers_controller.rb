class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id]) 
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    customer = Item.find(params[:id])
    customer.update(customer_params)
    redirect_to item_path(item.id)  
  end
  
  def unsubscribe
  end
  
  def withdraw
  end
   
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
