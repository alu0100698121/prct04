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
		a[i] << elementos.each.to_f
		i += 1
	end
	
	yield(a)
end

def leer_fichero
	
	fichero = nil
	while(fichero == nil)
		print "Introduzca el nombre del fichero para cargar las matrices: "
		nombre_fichero = gets
		fichero = File.new(nombre_fichero, "r")
		if(fichero == nil)
			puts "Fichero invalido"
		end
	end

	filas = fichero.gets.to_i
	if(filas < 1)
		puts "Error: la matriz no puede tener menos de 1 fila"
		return
	end

	asignar_matriz_fichero(fichero, $a, filas)
	asignar_matriz_fichero(fichero, $b, filas)

	fichero.close

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
