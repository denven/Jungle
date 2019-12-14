class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :asc).all
    # getCategories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

  private

  def getCategories
    Category.all.each do |category| 
      @categories.push(
        :id => category.id,
        :name => category.name, 
        :products => Product.where(category_id: category.id)
        )
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end