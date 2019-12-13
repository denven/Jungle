class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.count
    @categories_count = Category.count

    @categories = []
    getCategories

  end

  private
  def getCategories
    Category.all.each do |category| 
      @categories.push(
        :name => category.name, 
        :count => Product.where(category_id: category.id).count,
        :total => Product.where(category_id: category.id).sum(:quantity)
        )
    end
  end
end
