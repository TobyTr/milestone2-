# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[update destroy]

  # POST /order_items
  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      redirect_to orders_path, notice: 'Item was successfully added to the order.'
    else
      render :create, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_items/:id
  def update
    if @order_item.update(order_item_params)
      redirect_to orders_path, notice: 'Item was successfully updated.'
    else
      render :update, status: :unprocessable_entity
    end
  end

  # DELETE /order_items/:id
  def destroy
    @order_item.destroy
    redirect_to orders_path, notice: 'Item was successfully removed from the order.'
  end

  private

  # Find order item by ID
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  # Permit only safe parameters
  def order_item_params
    params.require(:order_item).permit(:order_id, :part_id, :quantity)
  end
end
