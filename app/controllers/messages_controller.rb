class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    # Fetch distinct users (senders and recipients) involved in conversations with the current user
    sent = current_user.sent_messages.select(:recipient_id).distinct.map(&:recipient_id)
    received = current_user.received_messages.select(:sender_id).distinct.map(&:sender_id)

    # Remove duplicates
    user_ids = (sent + received).uniq
    @conversations = User.where(id: user_ids) # get distinct combos of senders and receivers as conversations
  end

  def show
    @recipient = User.find(params[:recipient_id])
    @messages = Message.where( # display conversation chronologically
      '(sender_id = :current_user AND recipient_id = :recipient) OR (sender_id = :recipient AND recipient_id = :current_user)',
      current_user: current_user.id,
      recipient:    @recipient.id
    ).order(:created_at)
  end

  def new
    @message = Message.new
    @recipient = User.find(params[:recipient_id])
  end

  def create
    @message = current_user.sent_messages.build(message_params)

    if @message.save
      # redirect_to user_path(@message.recipient), notice: 'Message sent successfully.'
      redirect_to message_path(id: @message.recipient.id, recipient_id: @message.recipient.id),
                  notice: 'Message sent successfully.'
    else
      redirect_to user_path(@message.recipient), alert: 'Failed to send the message.'
    end
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :content)
  end
end
