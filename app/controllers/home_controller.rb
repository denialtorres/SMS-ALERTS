class HomeController < ApplicationController
  before_action :meta_tags_codeando
  def index
    @alerts = Alert.all.order('created_at ASC').reverse_order
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
