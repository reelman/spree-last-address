require 'find_address'

Spree::Admin::OrdersController.class_eval do
  after_filter :change_user_email , :only => [:update]
  

  def change_user_email
    if @order.user.anonymous? and SpreeLastAddress::Config[:dummy_addresses]
      @order.user.email = params[:order][:email]
      @order.user.save
      #puts "changed anonymous to #{@order.email}"
    end
  end
end
