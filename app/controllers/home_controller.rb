class HomeController < ApplicationController
  before_action :authenticate_user! #antes de cada accion mandar a llamar al metodo autenticacion de usuario
                                    #si no hay un uauario con sasion iniciada, lo mnadara a que se regisre o que inicie sesion
  def index
  end
end
