class RegistrationsController < Devise::RegistrationsController #en vez de ApplicationController se pone
                                #Devise::RegistrationsController, para heredar del modulo devise, registrationcontroller

        #si no se va a modificar alguna accion entoces se le debe poner super, para que se ejecute el metodo del padre
        # la modificacion no se va a reconocer por devise hasta que no se haga en routes en la linea devise_for,
        # y se le agrega controllers: {registrations: 'registrations'}  
        def new
            super
        end
        def create
            super
        end
        def update
            super
        end

end
