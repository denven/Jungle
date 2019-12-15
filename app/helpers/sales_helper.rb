module SalesHelper

  def get_active_sale
    Sale.get_active_sale
  end

  def get_upcoming_sale
    Sale.get_upcoming_sales.first
  end

end