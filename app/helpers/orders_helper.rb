module OrdersHelper

  def get_my_orders    
    Order.where(email: current_user.email)
  end
end