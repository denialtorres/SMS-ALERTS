class HomeController < ApplicationController
  def index
    @contacts = Contact.all
    @alerts = Alert.all
  end
end
