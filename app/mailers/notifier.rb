class Notifier < ActionMailer::Base
  default :from => 'Blabla <thisemptybox@mail.ru>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => 'Your order received, sweety'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order

    mail :to => order.email, :subject => 'Your order shipped'
  end
end
