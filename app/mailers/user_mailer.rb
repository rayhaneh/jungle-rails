class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order, user, items)
    @order = order
    @user  = user
    @items = items
    mail(to: @order.email, subject: 'Conformation for order id #{@order.id}')
  end
end
