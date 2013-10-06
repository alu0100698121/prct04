# Matriz A(NxM)
$a = []
# Matriz B(NxM)
$b = []

#<<<<<<< HEAD # Se preserva este bloque de código ya que es principal del programa (no genera conflictos de sentencias ni de métodos).
# No necesarios 2 argumentos, ya que las matrices son cuadradas
def asignar_matriz_teclado(a, filas)
	i = 0
	while( i < filas ) 
		j = 0
		fila = []
		while(j < filas)
			print "Inserte elemento ", i,",", j, ": "
			fila << gets.to_f
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
	asignar_matriz_teclado($a, filas) {|a| p a}
	
	puts "Elementos de la segunda matriz"
	asignar_matriz_teclado($b, filas) {|a| p a}
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

#======= # Preservamos el segundo bloque de código al igual que el primero.

def asignar_matriz_fichero(fichero, a, filas)
	#fichero = File.new(ARGV[0],"r")
	#if(fichero == nil)
	#	print "Error cargando ficehro ", ARGV[0]
	#	return
	#end

	i = 0
	while(i < filas)
		linea = fichero.gets
		elementos = linea.split(' ')
		fila = []
		elementos.each { |v| fila << v.to_f}
		a << fila
		i += 1
	end
	
	yield(a)
end

def leer_fichero
	
	fichero = nil
	print "Introduzca el nombre del fichero para cargar las matrices: "
	nombre_fichero = gets.chomp
	fichero = File.new(nombre_fichero, "r")


	filas = fichero.gets.to_i
	if(filas < 1)
		puts "Error: la matriz no puede tener menos de 1 fila"
		return
	end

	puts "Matrices leidas: "

	asignar_matriz_fichero(fichero, $a, filas) {|a| p a}
	asignar_matriz_fichero(fichero, $b, filas) {|a| p a}

	fichero.close

end

def suma_matrices(a,b)
	c = []
	i = 0
	while(i < a.length)
		j = 0
		fila = []
		while(j < a.length)
			fila[j] = a[i][j] + b[i][j]	
			
			j += 1
		end
	c << fila
	i += 1	
	end

	yield(c)
	return c

end
	
#>>>>>>> eliasib # Aquí acaban los conflictos de las funciones para la manipulación de matrices.

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
	leer_fichero
end

# No se eliminará ningún bloque de código, ya que ambos son válidos
#<<<<<<< HEAD # Se mantiene este bloque...
puts "Producto de matrices:"
producto_matrices($a, $b) {|a| p a}
#======= # ... y este otro.
puts "Suma de matrices:"
suma_matrices($a, $b) {|a| p a}
#>>>>>>> eliasib # Fin de resolución de conflictos