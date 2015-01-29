class CategoriesController < ApplicationController

  def index
    @brand = Brand.find(params[:brand_id])
    @categories = @brand.categories
  end
  
  def new
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.build
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def create
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.create(category_params)
    
    if @category.save
      redirect_to brand_categories_path
    else
      render 'new'
    end
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to brand_categories_path(@category.brand)
    else
      render 'edit'
    end
      
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to brand_categories_path(@category.brand)
  end
  
  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
