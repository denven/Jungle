class Sale < ActiveRecord::Base

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
