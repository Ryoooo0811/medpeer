class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def create
    @category = Category.new(category_params.merge(idea_params))
    if @category.save
      render json: @category, status: 201, location: @category
    else
      render json: @category.errors, status: 422
    end
  end

  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def idea_params
    params.require(:idea).permit(:category_id, :body)
  end
end
