seleccionado = false

while(!seleccionado)
	print "Seleccione método para insertar los datos (teclado, fichero): "
	entrada = gets.to_s
	
	if( entrada == "teclado\n" or entrada == "fichero\n" )
		seleccionado = true
	elsif
		puts "Entrada inválida."
	end
end

print "Ha seleccionado la opcion ", entrada
if(entrada == "teclado\n")
    # Leer datos de fichero
else
	# Leer datos de fichero
end