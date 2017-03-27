class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :notification
  skip_before_action :verify_authenticity_token, only: :notification

  def create
    order = current_user.orders.create(amount_in_kopecks: 10000)
    client_init = Tinkoff::Client.init(10000, order.id, { Email: current_user.email, Recurrent: "Y" })

    redirect_to client_init.payment_url
  end

  def notification
    notification_obj = Tinkoff::Notification.new(params)

    if notification_obj.success?
      order = Order.find(notification_obj.order_id)
      order.user.account.update_attribute(:tinkoff_rebill_id, notification_obj.rebill_id)
      order.update_attribute(:status, Order.statuses[:paid])
    end

    render status: 200, json: {}
  end
end
