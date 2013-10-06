# Matriz A(NxM)
$a = []
# Matriz B(NxM)
$b = []

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
    # Leer datos de teclado
else
	leer_fichero
end

puts "Suma de matrices:"
suma_matrices($a, $b) {|a| p a}
