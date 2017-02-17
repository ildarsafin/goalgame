class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :notification
  skip_before_action :verify_authenticity_token, only: :notification

  def create
    order = current_user.orders.create(amount_in_kopecks: 10000)
    client_init = Tinkoff::Client.init(10000, order.id, { Email: current_user.email, Recurrent: "Y" })

    redirect_to client_init.payment_url
  end

  def notification
    notification = Tinkoff::Notification.new(params)
    order = Order.find(notification.order_id)
    order.user.account.update_attribute(:tinkoff_rebill_id, notification.rebill_id)
    order.update_attribute(:status, Order.statuses[:paid])
  end
end
