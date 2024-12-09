# frozen_string_literal: true

class BuildsController < ApplicationController
  before_action :authenticate_user! # except: [:index]
  before_action :require_permission, except: [:index, :show, :new, :create] # rubocop:disable Style/SymbolArray

  def require_permission
    return unless Build.find(params[:id]).creator != current_user

    flash[:error] = 'You do not have permission to do that.'
    redirect_to builds_path
  end

  def index
    @builds = Build.all

    # only render builds that belong to users
  end

  def show
    @slots_options = ['GPU', 'CPU', 'Motherboard', 'Memory', 'Storage', 'CPU Cooler', 'PSU']
    @build = Build.find(params[:id])
  end

  def new
    @build = Build.new
  end

  def edit
    @build = Build.find(params[:id])
  end

  def create
    @build = current_user.builds.new(build_params)
    if @build.save
      redirect_to @build, notice: 'Build was successfully created.'
    else
      render :new
    end
  end

  def update
    @build = Build.find(params[:id])
    if @build.update(build_params)
      redirect_to @build, notice: 'Build was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @build = Build.find(params[:id])
    @build.destroy
    redirect_to builds_path, notice: 'Build was successfully deleted.'
  end

  private

  def build_params
    params.require(:build).permit(:name, :description, :published)
  end
end
