Rails.application.routes.draw do
 scope '/(:locale)', defaults: { locale: 'es' }, constraints: { locale: /en|es/ } do
    root "home#index"
    
    resources :alerts
    resources :contacts,  only: [:create]
    get 'formulario' => 'contacts#new'
 end
end
