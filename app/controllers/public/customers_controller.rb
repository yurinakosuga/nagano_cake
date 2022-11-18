class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
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
