class HomeController < ApplicationController
  def index
    # @contacts = Contact.all
    @alerts    = Alert.page(page)
    @next_page = Alert.next_page(page)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def page
    (params[:page] || 1).to_i
  end
end
