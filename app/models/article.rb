class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #este es para vincular el usuario al articulo
    has_many :has_categories 
    has_many :categories, through: :has_categories #esto es para generar la vinculacion muchos a muchos 

    attr_accessor :category_elements #permite definir una propiedad que puedo leer, que puedo escribir
                                    #esto es como agregarle una propiedad al objeto
                                    #esto se pone en la parte del formulario y en el controlador debo permitirlo

    def save_categories
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

        has_categories.where.not(category_id: category_elements).destroy_all
        #category_elements[ 1,2,3]. convertir eso en un arreglo 1,2,3 =>[1,2,3]
        # categories_array = category_elements.split(",") #este split separa cada elemento con una ,
        #iterar ese arreglo
        # por cada elemento que hay en el arreglo, crear un HasCategory
        category_elements.each do |category_id|
         # se va a tener un HasCategory creado con el <article_id: 1, category_id:2>
         #esto  quiere decir que  el articulo tiene la categoria y la categoria tiene el articulo
        
         HasCategory.find_or_create_by(article: self,category_id: category_id)
        #si hay algun registro que cumple estas dos condiciones, lo retorna, lo encuentra,
        #si no existe lo crea        
      end
    end
    # este se manda a llamar despues de que se creo el articulo, se define en controller
end

#**********OTRA FORMA DE HACER LO DE LA LINEA 20
         #  unless HasCategory.where(article:self,category_id:category_id).any? #aqui se le pregunta a HasCategory
        #                     #(haciendo una consulta con un where), si hay un registro con este articulo y esta categoria
        #                     #si esto devuelve algo (.any?= si trae 1 o mas devuelve veradero y si tiene 0 devueñve falso) 
        #     HasCategory.create(article: self,category_id: category_id) #self hace referencia  al this de javascript
        # end
        #(unless)a menos que) si la primera linea da verdadero, la segunda no se ejecuta
        # si la primera linea hay al menos alguno, no se ejecuta la segunda linea
        #si hay cero, se ejecuta la segunda linea
        #si no devulve nada, crealo
