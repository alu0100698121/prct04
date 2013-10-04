# Matriz A(NxM)
$a = []
# Matriz B(NxM)
$b = []

def asignar_matriz_teclado(a, filas, columnas)
	i = 0
	while( i < filas ) 
		j = 0
		fila = []
		while(j < columnas)
			print "Inserte elemento ", i,",", j, ": "
			fila << gets.to_i
			j += 1
		end
		a << fila
		i += 1
	end
	yield (a)
end

def leer_teclado
	print "Inserte numero de filas: "
	while(	(filas = gets.to_i) < 1)
		print "Error, intentelo de nuevo: "
	end
	
	print "Inserte numero de columnas: "
	while(	(columnas = gets.to_i) < 1)
		print "Error, intentelo de nuevo: "
	end
	
	print $a[0].class

	puts "Elementos de la primera matriz"
	asignar_matriz_teclado($a, filas, columnas) {|a| p a}
	
	puts "Elementos de la segunda matriz"
	asignar_matriz_teclado($b, filas, columnas) {|a| p a}
end

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
    leer_teclado
else
	# Leer datos de fichero
end
