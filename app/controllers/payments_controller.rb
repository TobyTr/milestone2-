# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_order
  before_action :set_payment, only: %i[show edit update]

  def show
  end

  def new
    if @order.payment.present?
      redirect_to orders_path, alert: 'Payment already exists for this order.'
      return
    end

    @order = Order.find(params[:order_id])
    @payment = @order.build_payment
  end

  def edit
    # @payment is already set by before_action :set_payment
  end

  def create
    @order = Order.find(params[:order_id])
    @payment = @order.build_payment(payment_params)
    @payment.price = @order.total_amount

    if @payment.save
      redirect_to orders_path, notice: 'Payment was successfully added.'
    else
      flash.now[:error] = 'Payment processing failed.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to orders_path, notice: 'Payment was successfully updated.'
    else
      flash.now[:error] = 'Payment update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to orders_path, alert: 'Order not found.'
  end

  def set_payment
    @payment = @order.payment
    return if @payment

    redirect_to order_path(@order), alert: 'Payment not found for this order.'
  end

  def payment_params
    params.require(:payment).permit(:cardNumber, :cvv, :expDate)
  end
end
