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
	print "Inserte numero de filas (y columnas): "
	while(	(filas = gets.to_i) < 1)
		print "Error, intentelo de nuevo: "
	end

	puts "Elementos de la primera matriz"
	asignar_matriz_teclado($a, filas, filas) {|a| p a}
	
	puts "Elementos de la segunda matriz"
	asignar_matriz_teclado($b, filas, filas) {|a| p a}
end

def producto_matrices(a, b)
	# Suponemos que las matrices han sido verificadas por la lectura de matrices, y el usuario no hará llamadas a esta función por su cuenta
	c = []
	i = 0
	while( i < a.length )
		j = 0
		fila = []
		while( j < a.length )
			k = 0
			fila[j] = 0
			while( k < a.length )
				fila[j] += (a[i][k] * b[k][j] )
				k += 1
			end
			j += 1
		end
		c << fila
		i += 1
	end
	
	yield(c)
	return c
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

puts "Producto de matrices:"
producto_matrices($a, $b) {|a| p a}


