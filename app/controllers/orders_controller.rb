# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/:id
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/:id/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/:id
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  # Find the order by ID
  def set_order
    @order = Order.find(params[:id])
  end

  # Permit only safe parameters
  def order_params
    params.require(:order).permit(:total_price, :status)
  end
end
