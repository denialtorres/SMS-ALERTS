Rails.application.routes.draw do
 scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /en|es/ } do
    get 'home/index'
    
    
    resources :alerts
    resources :contacts,  :only => [:new, :create]
   
    match 'formulario' => 'contacts#new',  :via => [:get]

   
    root "home#index"
 end
end