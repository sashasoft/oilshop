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
    @brand = Brand.find(params[:brand_id])
    @categories = @brand.categories.all
    @category = @categories.find(params[:id])
  end
  
  def edit
  end
  
  def create
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.create(category_params)
    
    if @category.save
      redirect_to brand_categories_path
    else
      render 'new'
    end
    
    #redirect_to brand_categories_path
  end
  
  def destroy
    @brand = Brand.find(params[:brand_id])
    @category = @brand.categories.find(params[:id])
    @category.destroy
    redirect_to brand_categories_path
  end
  
  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
