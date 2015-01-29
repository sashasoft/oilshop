class SubcategoriesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @subcategories = @category.subcategories
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.build
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.create(subcategory_params)

    if @subcategory.save
      redirect_to category_subcategories_path
    else
      render 'new'
    end
  end
  
  def update
  end

  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy
    redirect_to category_subcategories_path(@subcategory.category)
  end

  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :description)
    end
 
end
