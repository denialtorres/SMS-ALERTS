class HomeController < ApplicationController
  before_action :meta_tags_codeando
  def index
    # @contacts = Contact.all
    # @alerts = Alert.all.order('created_at ASC').reverse_order
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
  
  
  private
    def meta_tags_codeando
        title = 'Codeando México'
        site = 'Voluntarios SMS'
        description = 'Ésta es una herramienta para mantener informados a voluntarios y/o expertos vía SMS 
                       sobre cómo y dónde más se require ayuda inmediata'
        set_meta_tags title: title,
        site: site
        set_meta_tags description: description
        set_meta_tags og: {
                            title: site,
                            type: 'website',
                            image: ActionController::Base.helpers.image_url('fbcover.png'),
                            description: description 
                          }
      
    end
end
