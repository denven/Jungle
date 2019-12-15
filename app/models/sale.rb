class Sale < ActiveRecord::Base

  # scope :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current) }

  # ActiveRecord Scope
  def self.get_active_sale
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).first
  end

  scope :get_upcoming_sales, -> { where("sales.starts_on > ?", Date.current) }

  def isUpcoming?
    starts_on > Date.current
  end

  def isFinished?
    ends_on < Date.current
  end

  def isActive?
    starts_on <= Date.current && ends_on >= Date.current
  end

end
