class HomeController < ApplicationController
  def index
    @contacts = Contact.all
    @alerts = Alert.all.order('created_at ASC').reverse_order
  end
end
