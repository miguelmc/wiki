class CategoriesController < ApplicationController
  before_filter :is_admin?

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new(params[:category])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, flash: { notice: "Category successfully created" }
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, flash: { notice: "Category successfully modified" }
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path, flash: { notice: "Category successfully deleted" }
  end

end
