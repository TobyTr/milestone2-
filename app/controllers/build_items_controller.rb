# frozen_string_literal: true

class BuildItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, except: [:index, :show] # rubocop:disable Style/SymbolArray

  def require_permission
    @build = Build.find(params[:build_id])
    if @build.creator != current_user # rubocop:disable Style/GuardClause
      flash[:error] = 'You do not have permission to do that.'
      redirect_to build_path(@build)
    end
  end

  def index
    @build = Build.find(params[:build_id])
    @build_items = @build.build_items
    render :index
  end

  def show
    @build = Build.find(params[:build_id])
    @build_item = @build.build_items.find(params[:id])
    render :show
  end

  def new
    @build = Build.find(params[:build_id])
    @build_item = BuildItem.new
    render :new
  end

  def edit
    @build_item = BuildItem.find(params[:id])
  end

  def create
    @build = Build.find(params[:build_id])
    # @part = Part.find(params[:part_id])
    # BuildItem.create(build: @build, part_id: @part, quantity: '1', slot: @part.category)
    @build_item = @build.build_items.build(params.permit(:build_id, :part_id, :quantity, :slot))

    if @build_item.save
      flash[:success] = 'Build item successfully added to your build.'
    else
      flash[:error] = 'This part category has already been filled in your build.'
    end
    redirect_to build_url(@build)
  end

  # def create
  #   @build = Build.find(params[:build_id])
  #   @part = Part.find(params[:part_id])
  #   BuildItem.create(build: @build, part: @part)
  #   redirect_to build_build_items_url(@build), notice: 'Part added to build!'
  # end

  def update
    @build = Build.find(params[:id])
    @build_item = @build.build_items.find(params[:id])
    if @build_item.update(build_item_params)
      redirect_to build_url(@build), notice: 'Build item was successfully updated.'
    else
      flash.now[:error] = 'Build item could not be updated.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @build_item = BuildItem.find(params[:id])
    @build_item.destroy
    redirect_to build_path(@build), notice: 'Build item was successfully deleted.'
  end

  private

  def build_item_params
    params.require(:build_item).permit(:quantity, :slot, :build_id)
  end
end
