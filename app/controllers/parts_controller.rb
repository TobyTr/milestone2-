# frozen_string_literal: true

class PartsController < ApplicationController
  def index
    # @parts = Part.all
    @parts = Part.page(params[:page]).per(8)
    apply_filters
  end

  def show
    @part = Part.find(params[:id])
    render :show
  end

  def new
    @part = Part.new
  end

  def edit
    @part = Part.find(params[:id])
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to @part, notice: 'Part was successfully created.'
    else
      render :new
    end
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      redirect_to @part, notice: 'Part was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to parts_path, notice: 'Part was successfully deleted.'
  end

  private

  def part_params
    params.require(:part).permit(:name, :brand, :price, :year, :category, :description, :image)
  end

  def apply_filters
    # Used Claude.ai to help with search and filters logic.
    apply_search_filter
    apply_price_filter
    apply_categories_filter
  end

  def apply_search_filter
    return if params[:search].blank?

    @parts = @parts.where('name ILIKE ? OR description ILIKE ?', "%#{params[:search]}%",
                          "%#{params[:search]}%")
  end

  def apply_price_filter
    @parts = @parts.where(price: (params[:min_price])..) if params[:min_price].present?
    @parts = @parts.where(price: ..(params[:max_price])) if params[:max_price].present?
  end

  def apply_categories_filter
    @categories = Part::CATEGORIES
    @parts = @parts.where(category: params[:category]) if params[:category].present?
  end
end
