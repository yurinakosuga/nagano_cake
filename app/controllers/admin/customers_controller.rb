class Admin::CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
    
  end
  
  def show
    @customer = Customer.find(params[:id]) 
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)  
  end
  
  private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
