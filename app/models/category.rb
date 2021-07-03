class Category < ApplicationRecord
    has_many :has_categories #esto es para generar la vinculacion muchos a muchos 
    has_many :articles, through: :has_categories #esto es para generar la vinculacion muchos a muchos
end
