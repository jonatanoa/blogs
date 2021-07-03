Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}  # en este caso se le esta diciendo a devise
                              #que para la parte de registro utilice el controlador registrations de nuestra aplicacion
 
  get "bienvenida", to: "home#index" 
  get "perfil", to:"users#edit"
  #me va a mandar error, para solucionar, hay que crear una ruta post 'articles', to: 'articles#create'
  resources :users, only:[:update]
  root "home#index"
  #get "articles/user/:user_id", to: "articles#from_author" #este es para  mostrar loa rticulos de un solo usuario
  resources :categories #este es generado por el scaffold
  resources :articles do 
    get "user/:user_id", to: "articles#from_author", on: :collection #on: :collection hace referencia a que esta
                #ruta hará parte de articles
  end

  # get "articles/new", to: "articles#new", as: :new_articles # si lo mando al servidor asi solo, 
  # get "articles", to: "articles#index" # si lo mando al servidor asi solo, 
  # get "articles/:id", to: "articles#show"
  # get "articles/:id/edit", to: "articles#edit"
  # patch "articles/:id", to: "articles#update", as: :article #este se hace para poder editar el articulo
  # post "articles", to: "articles#create"#para solucionar le problema de articles#new, donde se espera un articles_path
  # delete "articles/:id", to: "articles#destroy"

  
end
