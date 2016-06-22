class Article < ActiveRecord::Base
	# validar campos
	# validates "Campo","Hash de opciones"
	# presence <= valida que el elemento no este vacio
	# uniqueness sea unico el valor y no se repita
	# length para restringir el maximo y minivo de caracteres
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true, length: {minimum: 20 }
end
