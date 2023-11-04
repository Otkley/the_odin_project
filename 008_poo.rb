# Clases
# https://launchschool.com/books/oo_ruby/read/the_object_model
# ¿Cómo creamos un objeto en Ruby? Dé un ejemplo de la creación de un objeto.
class MyClass
  include ModuleName
end

my_obj = MyClass.new
=begin
Creamos un objeto definiendo una clase y creando una instancia utilizando el .newmétodo
para crear una instancia, también conocido como objeto.

¿Qué es un módulo? ¿Cual es su propósito? ¿Cómo los utilizamos con nuestras clases?
Cree un módulo para la clase que creó en el ejercicio 1 e inclúyalo correctamente.
=end
module ModuleName
end
=begin
Un módulo nos permite agrupar código reutilizable en un solo lugar. Usamos módulos en nuestras
clases usando la include invocación del método, seguida del nombre del módulo. Los módulos
también se utilizan como espacio de nombres (lo cubriremos en una sección posterior).
=end

# Inicializando un nuevo objeto

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new
=begin
El initializemétodo se llama cada vez que crea un nuevo objeto. Eso es extraño, ¿no llamamos al
newmétodo cuando creamos un objeto? Sí, llamar al newmétodo de clase eventualmente nos lleva
al initializemétodo de instancia. Hablaremos sobre la diferencia entre métodos de clase y
métodos de instancia más adelante. En el ejemplo anterior, la creación de una instancia de un
nuevo GoodDogobjeto activó el initializemétodo y dio como resultado la salida de la cadena.
Nos referimos al initializemétodo como constructor porque es un método especial que construye
el objeto cuando se crea una instancia de un nuevo objeto. Se activa mediante el newmétodo de
clase.
=end
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
fido = GoodDoog.new("Fido")

# Metodos de instancia

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak

fido = GoodDog.new("Fido")
puts fido.speak

class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

puts sparky.speak
puts fido.speak

# Metodos de acceso

=begin
A NoMethodErrorsignifica que llamamos a un método que no existe o no está disponible para el
objeto. Si queremos acceder al nombre del objeto, que está almacenado en la @namevariable de
instancia, tenemos que crear un método que devuelva el nombre. Podemos llamarlo get_namey su
única función es devolver el valor en la @namevariable de instancia.
=end

class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = "Spartacus"
puts sparky.get_name

class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name
sparky.name = "Spartacus"
puts sparky.name

=begin
Notarás que escribir esos métodos getter y setter ocupó mucho espacio en nuestro programa para
una característica tan simple. Y si tuviéramos otros estados que quisiéramos rastrear, como
la altura o el peso, la clase sería aún más larga. Debido a que estos métodos son tan comunes,
Ruby tiene una forma incorporada de crear automáticamente estos métodos getter y setter ,
utilizando el método attr_accessor . Mira esta refactorización del código desde arriba.
=end
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"
=begin
¡Nuestro resultado es el mismo! El attr_accessormétodo toma un símbolo como argumento, que
utiliza para crear el nombre del método para los métodos gettery setter. Esa línea reemplazó
dos definiciones de métodos.

Pero ¿qué pasa si sólo queremos el gettermétodo sin el settermétodo? Entonces querríamos
utilizar el attr_readermétodo. Funciona de la misma manera pero solo le permite recuperar la
variable de instancia. Y si solo desea el método setter, puede usar el attr_writermétodo.
Todos los attr_*métodos toman Symbolobjetos como argumentos; Si hay más estados que estás
rastreando, puedes usar esta sintaxis:
=end
attr_accessor :name, :height, :weight
# Metodos de acceso en acción

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end

# Métodos de llamada con uno mismo

=begin
Crea una clase llamada MyCar. Cuando inicializa una nueva instancia u objeto de la clase,
permita al usuario definir algunas variables de instancia que nos indiquen el año, color y
modelo del automóvil. Cree una variable de instancia que se establezca 0durante la creación de
instancias del objeto para rastrear también la velocidad actual del automóvil. Cree métodos
de instancia que permitan que el automóvil acelere, frene y apague el automóvil.

Agregue un método de acceso a su clase MyCar para cambiar y ver el color de su automóvil.
Luego agregue un método de acceso que le permita ver, pero no modificar, el año de su automóvil

Desea crear una interfaz agradable que le permita describir con precisión la acción que desea
que realice su programa. Cree un método llamado spray_paint que pueda invocarse en un objeto y
modificará el color del automóvil.
=end
class MyCar
  attr_accessor :color, :modelo
  attr_reader :anho, :prendido, :vel_actual

  def initialize(anho, color, modelo)
    @anho = anho
    @color = color
    @modelo = modelo
    @vel_actual = 0
    @prendido = false
  end

  def apagar
    if prendido && vel_actual == 0
      puts "El carro se ha apagado."
    elsif !prendido
      puts "El carro ya esta apagado."
    else
      puts "No podemos apagar el carro, Velocidad actual: #{vel_actual}"
    end
  end

  def prender
    if !prendido
      self.prendido = true
      puts "El carro se ha prendido... Rum Rum Rum!"
    else
      puts "El carro ya esta prendido ¬¬ cuidado lo descompones!!"
    end
  end

  def frenar(velocidad = 10)
    return "Primero prende el carro!" if prendido == false

    if self.vel_actual != 0
      if self.vel_actual - velocidad < 0
        self.vel_actual = 0
        puts "Hemos frenado completamente!!"
      else
        self.vel_actual -= velocidad
        puts "Hemos frenado #{velocidad} kms!! Velocidad actual: #{vel_actual}"
      end
    else
      puts "Estamos completamente parados!"
    end
  end

  def acelerar(velocidad = 10)
    return "Primero prende el carro!" if prendido == false

    self.vel_actual += velocidad
    puts "Aceleramos a: #{vel_actual} kms por hora!!"
  end

  def pintar_carro(color = negro)
    self.color = color
    puts "El carro ahora es color: #{self.color}"
  end
end
=begin
Metodos de clase

Hasta ahora, todos los métodos que hemos creado son métodos de instancia. Es decir, son
métodos que pertenecen a una instancia u objeto de la clase. También existen métodos a nivel
de clase, llamados métodos de clase . Los métodos de clase son métodos que podemos llamar
directamente en la propia clase, sin tener que crear una instancia de ningún objeto. No hemos
implementado ningún método de clase en este momento, así que hagámoslo ahora.

Al definir un método de clase, anteponemos el nombre del método con la palabra reservada self.,
así:
=end
def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end
=begin
Luego, cuando llamamos al método de clase, usamos el nombre de la clase GoodDogseguido del
nombre del método, sin siquiera tener que crear una instancia de ningún objeto, así:
=end
GoodDog.what_am_i          # => I'm a GoodDog class!
=begin
¿Por qué necesitamos un método de clase para esto? Este ejemplo es un poco artificial,
pero los métodos de clase son donde colocamos funcionalidad que no pertenece a objetos
individuales. Los objetos contienen estado, y si tenemos un método que no necesita tratar
con estados, entonces podemos usar un método de clase, como en nuestro ejemplo simple.
Veremos un ejemplo más útil en la siguiente sección.

Variables de clase
Así como las variables de instancia capturan información relacionada con instancias
específicas de clases (es decir, objetos), podemos crear variables para una clase completa
que se denominen apropiadamente variables de clase . Las variables de clase se crean usando
dos @símbolos como este: @@. Creemos una variable de clase y un método de clase para ver esa
variable.
=end
class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs   # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs   # => 2
=begin
Tenemos una variable de clase llamada @@number_of_dogs, que inicializamos en 0. Luego,
en nuestro constructor (el initializemétodo), incrementamos ese número en 1. Recuerde que
initializese llama cada vez que creamos una instancia de un nuevo objeto a través del
new método. Esto también demuestra que podemos acceder a variables de clase desde un método
de instancia ( initializees un método de instancia). Finalmente, simplemente devolvemos el
valor de la variable de clase en el método de clase self.total_number_of_dogs. Este es un
ejemplo del uso de una variable de clase y un método de clase para realizar un seguimiento de
un detalle a nivel de clase que pertenece sólo a la clase y no a objetos individuales.

Constantes

Al crear clases también puede haber ciertas variables que nunca querrás cambiar. Puedes hacer
esto creando lo que se llaman constantes . Una constante se define utilizando una letra
mayúscula al principio del nombre de la variable. Si bien técnicamente las constantes solo
necesitan comenzar con una letra mayúscula, la mayoría de los Rubyists pondrán toda la
variable en mayúscula.
=end

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age  = a * DOG_YEARS
  end

  def to_s
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age             # => 28
=begin
Agregue un método de clase a su clase MyCar que calcule el consumo de gasolina (es decir,
millas por galón) de cualquier automóvil.

Anule el método to_s para crear una impresión fácil de usar de su objeto.

Al ejecutar el siguiente código...
=end
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
=begin
Nos sale el siguiente error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

¿Por qué recibimos este error y cómo lo solucionamos?

Porque no existe un metodo para asginar un nuevo valor al atributo del objeto
attr_accesor :name

Obtenemos este error porque attr_reader solo crea un método getter. Cuando intentamos
reasignar el nombre de la variable de instancia a "Bob", necesitamos un método de
establecimiento llamado name=. Podemos obtener esto cambiando attr_reader a attr_accessor o
attr_writer si no tenemos intención de utilizar la funcionalidad getter.
=end
class Person
  attr_accessor :name
  # attr_writer :name ## => This also works but doesn't allow getter access
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

class MyCar
  attr_accessor :color, :modelo
  attr_reader :anho, :prendido, :vel_actual

  def initialize(anho, color, modelo)
    @anho = anho
    @color = color
    @modelo = modelo
    @vel_actual = 0
    @prendido = false
  end

  def self.gas_mileage(galones, millas)
    puts "#{millas / galones} millas por galon de gasolina"
  end

  def apagar
    if prendido && vel_actual == 0
      puts "El carro se ha apagado."
    elsif !prendido
      puts "El carro ya esta apagado."
    else
      puts "No podemos apagar el carro, Velocidad actual: #{vel_actual}"
    end
  end

  def prender
    if !prendido
      self.prendido = true
      puts "El carro se ha prendido... Rum Rum Rum!"
    else
      puts "El carro ya esta prendido ¬¬ cuidado lo descompones!!"
    end
  end

  def frenar(velocidad = 10)
    return "Primero prende el carro!" if prendido == false

    if self.vel_actual != 0
      if self.vel_actual - velocidad < 0
        self.vel_actual = 0
        puts "Hemos frenado completamente!!"
      else
        self.vel_actual -= velocidad
        puts "Hemos frenado #{velocidad} kms!! Velocidad actual: #{vel_actual}"
      end
    else
      puts "Estamos completamente parados!"
    end
  end

  def acelerar(velocidad = 10)
    return "Primero prende el carro!" if prendido == false

    self.vel_actual += velocidad
    puts "Aceleramos a: #{vel_actual} kms por hora!!"
  end

  def pintar_carro(color = negro)
    self.color = color
    puts "El carro ahora es color: #{self.color}"
  end

  def to_s
    "My car is a #{color}, #{anho}, #{@modelo}!"
  end
end

MyCar.gas_mileage(13, 351)
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car  # => My car is a silver, 2010, Ford Focus.
=begin
Herencia

En el capítulo anterior hablamos brevemente sobre la herencia. La herencia es cuando una clase
hereda el comportamiento de otra clase. La clase que hereda el comportamiento se llama subclase
y la clase de la que hereda se llama superclase.

Usamos la herencia como una forma de extraer comportamientos comunes de clases que comparten ese
comportamiento y trasladarlos a una superclase. Esto nos permite mantener la lógica en un solo
lugar. Echemos un vistazo a un ejemplo.

Herencia de clase

Aquí, extraemos el speakmétodo de la GoodDogclase a la superclase Animaly usamos la herencia para
que ese comportamiento esté disponible para GoodDoglas clases y Cat.
=end
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!
=begin
Usamos el <símbolo para indicar que la GoodDogclase hereda de la Animalclase. Esto significa que
todos los métodos de la Animalclase están disponibles GoodDogpara su uso. También creamos una
nueva clase llamada Catque hereda Animaltambién. Hemos eliminado el speakmétodo de la GoodDogclase
para poder utilizar el speakmétodo de Animal.

Cuando ejecutamos este código vemos el resultado correcto. Ambas clases ahora utilizan el método
Animalde la superclase speak.

Pero, ¿qué pasa si queremos utilizar únicamente el speakmétodo original de la clase?
GoodDogVolvamos a agregarlo y veamos qué sucede.
=end
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    "#{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!
=begin
En la GoodDogclase, estamos anulando el speakmétodo en la Animalclase porque Ruby verifica
primero la clase del objeto en busca del método antes de buscar en la superclase.
Eso significa que cuando escribimos el código sparky.speak, primero miró sparkyla clase, que es
GoodDog. Allí encontró el speakmétodo y lo utilizó. Cuando escribimos el código paws.speak,
Ruby miró por primera vez pawsla clase de , que es Cat. No encontró ningún speakmétodo allí,
por lo que continuó buscando en Catla superclase de Animal. Encontró un speakmétodo Animaly lo
utilizó. Hablaremos más en profundidad sobre la ruta de búsqueda de este método en un momento.

La herencia puede ser una excelente manera de eliminar la duplicación en su código base. Hay un
acrónimo que verá a menudo en la comunidad Ruby, "DRY". Esto significa "No te repitas".
Significa que si te encuentras escribiendo la misma lógica una y otra vez en tus programas, hay
formas de extraer esa lógica a un lugar para su reutilización.

súper

Ruby nos proporciona la superpalabra clave para llamar a métodos anteriormente en la ruta de
búsqueda de métodos. Cuando llama superdesde dentro de un método, busca en la ruta de búsqueda
del método un método con el mismo nombre y luego lo invoca. Veamos un ejemplo rápido de cómo
funciona esto:
=end
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
=begin
En el ejemplo anterior, hemos creado una Animalclase simple con un speakmétodo de instancia.
Luego creamos GoodDogqué subclases Animaltambién con un speakmétodo de instancia para anular la
versión heredada. Sin embargo, en el método de la subclase speakusamos superpara invocar el
speakmétodo de la superclase Animaly luego ampliamos la funcionalidad agregando algo de texto al
valor de retorno.

Otra forma de uso más común superes con initialize. Veamos una ilustración de eso:
=end
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
=begin
El concepto interesante que queremos explicar es el uso de superen GoodDogclase. En este ejemplo,
lo usamos supersin argumentos. Sin embargo, el initializemétodo que superse utiliza toma un
argumento y agrega un nuevo giro a la forma en que superse invoca. Aquí, además del comportamiento
predeterminado, superse reenvían automáticamente los argumentos que se pasaron al método desde
el cual superse llama ( initializemétodo en GoodDogla clase). En este punto, superpasará el
colorargumento initializedefinido en la subclase al de la Animalsuperclase y lo invocará. Eso
explica la presencia del @name="brown"momento en que se crea la brunoinstancia. Finalmente, la
subclase initializecontinúa configurando la @colorvariable de instancia.

Cuando se llama con argumentos específicos, por ejemplo. super(a, b), los argumentos
especificados se enviarán a la cadena de búsqueda de métodos. Veamos un ejemplo rápido:
=end
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
=begin
Esto es similar a nuestro ejemplo anterior, con la diferencia de que supertoma un argumento,
por lo tanto, el argumento pasado se envía a la superclase. En consecuencia, en este ejemplo,
cuando BadDogse crea un objeto, el argumento pasado name("oso") se pasa a la superclase y se
establece en la @namevariable de instancia.

Hay un último giro. Si llama super()exactamente como se muestra (con paréntesis), llama al
método en la superclase sin ningún argumento. Si tiene un método en su superclase que no acepta
argumentos, esta es la forma más segura (y a veces la única) de llamarlo:
=end
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super()
    @color = color
  end
end

bear = Bear.new("black")        # => #<Bear:0x007fb40b1e6718 @color="black">
=begin
Si olvida utilizar los paréntesis aquí, Ruby generará una ArgumentErrorexcepción ya que el
número de argumentos es incorrecto.

Mezclando en módulos

Otra forma de SECAR tu código en Ruby es usar módulos . Ya hemos visto un poco sobre cómo usar los
módulos, pero aquí daremos algunos ejemplos más.

Extraer métodos comunes a una superclase, como hicimos en la sección anterior, es una excelente
manera de modelar conceptos que son naturalmente jerárquicos. Dimos el ejemplo de los animales.
Tenemos una superclase genérica llamada Animalque puede mantener todo el comportamiento básico de
todos los animales. Luego podemos ampliar un poco el modelo y tener, quizás, una Mammalsubclase
de Animal. Podemos imaginar que toda la jerarquía de clases se parecería a la figura siguiente.

        Animal
    Fish      Mammal
            Cat    Dog

El diagrama anterior muestra cómo se ve la herencia pura basada en clases. Recuerde que el
objetivo de esto es poner el comportamiento correcto (es decir, métodos) en la clase correcta
para que no necesitemos repetir el código en varias clases. Podemos imaginar que todos Fishlos
objetos están relacionados con animales que viven en el agua, por lo que quizás swimdebería
haber un método en la Fishclase. También podemos imaginar que todos Mammallos objetos tendrán
sangre caliente, por lo que podemos crear un método llamado warm_blooded?en la Mammalclase y
hacer que regrese true. Por lo tanto, los objetos Caty Dogtendrán acceso al método que las clases
y warm_blooded?heredan automáticamente , pero no tendrán acceso a los métodos de la clase.
Mammal Cat Dog Fish.

Este tipo de modelado jerárquico funciona hasta cierto punto, pero siempre hay excepciones.
Por ejemplo, pusimos el swimmétodo en la Fishclase, pero algunos mamíferos también pueden nadar.
No queremos trasladar el swimmétodo Animalporque no todos los animales nadan, y no queremos
crear otro swimmétodo Dogporque viola el principio SECO. Para inquietudes como estas, nos
gustaría agruparlas en un módulo y luego mezclarlas en ese módulo con las clases que requieren
esos comportamientos. He aquí un ejemplo:
=end
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end
# Y ahora Fishlos Dogobjetos pueden nadar, pero los objetos de otras clases no podrán:
sparky = Dog.new
neemo  = Fish.new
paws   = Cat.new

sparky.swim                 # => I'm swimming!
neemo.swim                  # => I'm swimming!
paws.swim                   # => NoMethodError: undefined method `swim' for #<Cat:0x007fc453152308>
=begin
El uso de módulos para agrupar comportamientos comunes nos permite construir un diseño más potente,
flexible y SECO.

Nota: Una convención de nomenclatura común para Ruby es utilizar el sufijo "able" en cualquier
verbo que describa el comportamiento que está modelando el módulo. Puedes ver esta convención
con nuestro Swimmablemódulo. Del mismo modo, podríamos nombrar un módulo que describa "caminar"
como Walkable. No todos los módulos reciben este nombre, aunque es bastante común.

Herencia vs módulos

Ahora conoces las dos formas principales en que Ruby implementa la herencia. La herencia de clases
es la forma tradicional de pensar en la herencia: un tipo hereda los comportamientos de otro tipo.
El resultado es un nuevo tipo que especializa el tipo de la superclase. La otra forma a veces se
denomina herencia de interfaz : aquí es donde entran en juego los módulos mixin. La clase no
hereda de otro tipo, sino que hereda la interfaz proporcionada por el módulo mixin. En este caso,
el tipo de resultado no es un tipo especializado con respecto al módulo.

Quizás se pregunte cuándo utilizar la herencia de clases frente a los mixins. Aquí hay un par de
cosas a considerar al evaluar estas opciones.

Sólo puede crear subclases (herencia de clases) de una clase. Puede mezclar tantos módulos
(herencia de interfaz) como desee.
Si existe una relación "es-a", la herencia de clases suele ser la opción correcta. Si existe una
relación "tiene-a", la herencia de interfaz generalmente es una mejor opción. Por ejemplo, un
perro "es un" animal y "tiene la" capacidad de nadar.
No se pueden crear instancias de módulos. En otras palabras, no se pueden crear objetos a partir
de módulos.
A medida que mejore en el diseño OO, comenzará a desarrollar una idea de cuándo usar la herencia
de clases en lugar de mezclar módulos.

Ruta de busqueda de metodos

Ahora que comprende tanto la herencia como los mixins, juntemos ambos para ver cómo afecta eso a
la ruta de búsqueda de métodos . Recuerde que la ruta de búsqueda de métodos es el orden en que
se inspeccionan las clases cuando llama a un método. Echemos un vistazo al código de ejemplo a
continuación.
=end
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
=begin
Contamos con tres módulos y una clase. Hemos mezclado un módulo en la Animalclase.
La ruta de búsqueda de métodos es la ruta que toma Ruby para buscar un método. Podemos ver este
camino con el ancestorsmétodo de clase.
=end
puts "---Animal method lookup---"
puts Animal.ancestors
# La salida se ve así:
---Animal method lookup---
Animal
Walkable
Object
Kernel
BasicObject
=begin
Esto significa que cuando llamamos a un método de cualquier Animalobjeto, Ruby primero busca en
la Animalclase, luego en el Walkablemódulo, luego en la Objectclase, luego en el Kernelmódulo y
finalmente en la BasicObject clase.
=end
fido = Animal.new
fido.speak                  # => I'm an animal, and I speak!
# Ruby encontró el speakmétodo en la Animalclase y no buscó más.
fido.walk                   # => I'm walking.
=begin
Ruby primero buscó el walkmétodo de instancia en y Animal, al no encontrarlo allí,
siguió buscando en el siguiente lugar según nuestra lista, que es el Walkablemódulo.
Vio un walkmétodo allí, lo ejecutó y dejó de buscar más.
=end
fido.swim # => NoMethodError: undefined method `swim' for #<Animal:0x007f92832625b0>
=begin
Ruby recorrió todas las clases y módulos de la lista y no encontró ningún swimmétodo, por lo que
arrojó un error.

Agreguemos otra clase al código anterior. Esta clase heredará de la Animalclase y se mezclará en
los módulos Swimmabley Climbable.
=end
class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors
# Y este es el resultado que obtenemos:
---GoodDog method lookup---
GoodDog
Climbable
Swimmable
Animal
Walkable
Object
Kernel
BasicObject
=begin
Hay varias cosas interesantes sobre el resultado anterior. Primero, esto nos dice que el orden
en el que incluimos los módulos es importante. Ruby en realidad mira primero el último módulo
que incluimos . Esto significa que en el raro caso de que los módulos que mezclamos contengan un
método con el mismo nombre, se consultará primero el último módulo incluido. La segunda cosa
interesante es que el módulo incluido en la superclase llegó a la ruta de búsqueda de métodos.
Eso significa que todos GoodDoglos objetos tendrán acceso no sólo a Animallos métodos, sino
también a los métodos definidos en el Walkablemódulo, así como a todos los demás módulos mezclados
con cualquiera de sus superclases.

A veces, cuando trabajas en un proyecto grande, puede resultar confuso de dónde provienen todos
estos métodos. Al comprender la ruta de búsqueda de métodos, podemos tener una mejor idea de
dónde y cómo se organizan todos los métodos disponibles.

Más módulos

Ya hemos visto cómo se pueden utilizar los módulos para mezclar comportamientos comunes en clases.
Ahora veremos dos usos más para los módulos.

El primer caso de uso que discutiremos es el uso de módulos para el espacio de nombres.
En este contexto, el espacio de nombres significa organizar clases similares bajo un módulo.
En otras palabras, usaremos módulos para agrupar clases relacionadas. Ahí radica la primera
ventaja de utilizar módulos para el espacio de nombres. Nos resulta fácil reconocer clases
relacionadas en nuestro código. La segunda ventaja es que reduce la probabilidad de que nuestras
clases colisionen con otras clases con nombres similares en nuestro código base. Así es como lo
hacemos
=end
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
=begin
Llamamos a clases en un módulo agregando el nombre de la clase al nombre del módulo con dos dos
puntos ( ::)
=end
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"
=begin
El segundo caso de uso de módulos que veremos es el uso de módulos como contenedor de métodos,
llamados métodos de módulo. Esto implica el uso de módulos para albergar otros métodos.
Esto es muy útil para métodos que parecen fuera de lugar dentro de su código. Usemos nuestro
Mammalmódulo para demostrar:
=end
module Mammal

  def self.some_out_of_place_method(num)
    num ** 2
  end
end
=begin
Definir métodos de esta manera dentro de un módulo significa que podemos llamarlos directamente
desde el módulo:
=end
value = Mammal.some_out_of_place_method(4)
# También podemos llamar a dichos métodos haciendo:
value = Mammal::some_out_of_place_method(4)
=begin
aunque la primera es la forma preferida.

Privado, Protegido y Público

Lo último que queremos cubrir es algo que en realidad es bastante simple, pero necesario; Control
de acceso al método. El control de acceso es un concepto que existe en varios lenguajes de
programación, incluido Ruby. Generalmente se implementa mediante el uso de modificadores de acceso.
El propósito de los modificadores de acceso es permitir o restringir el acceso a una cosa en
particular. En Ruby, las cosas a las que nos preocupa restringir el acceso son los métodos definidos
en una clase. Por lo tanto, en el contexto de Ruby, comúnmente verá este concepto denominado
Control de acceso a métodos .

La forma en que se implementa el control de acceso a métodos en Ruby es mediante el uso de
modificadores de acceso public, privatey protected. En este momento, todos los métodos de nuestra
GoodDogclase son métodos públicos. Un método público es un método que está disponible para
cualquiera que conozca el nombre de la clase o el nombre del objeto. Estos métodos están
disponibles para que los use el resto del programa y comprenden la interfaz de la clase (así es
como otras clases y objetos interactuarán con esta clase y sus objetos).

A veces tendrás métodos que funcionan en la clase pero que no necesitan estar disponibles para el
resto del programa. Estos métodos se pueden definir como privados . ¿Cómo definimos los métodos
privados? Usamos la privatellamada al método en nuestro programa y todo lo que esté debajo
es privado (a menos que protectedse llame a otro método, como , después para negarlo).

En nuestra GoodDogclase tenemos una operación que podemos pasar a un método privado. Cuando
inicializamos un objeto, calculamos la edad del perro en años Perro. Refactoricemos esta
lógica en un método y hagámosla privada para que nada fuera de la clase pueda usarla.
=end
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
sparky.human_years
=begin
Recibimos el mensaje de error:


NoMethodError: private method `human_years' called for
  #<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>

Hemos hecho que el human_yearsmétodo sea privado colocándolo bajo el privatemétodo.
¿Para qué sirve entonces si no podemos llamarlo? privateLos métodos solo son accesibles desde
otros métodos de la clase. Por ejemplo, dado el código anterior, se permitiría lo siguiente:
=end
# assume the method definition below is above the "private" method

def public_disclosure
  "#{self.name} in human years is #{human_years}"
end
=begin
Tenga en cuenta que en este caso no podemos utilizar self.human_yearsporque el human_yearsmétodo
es privado. Recuerde que self.human_yearses equivalente a sparky.human_years, que no está
permitido para métodos privados. Por lo tanto, solo tenemos que usar human_years. En resumen,
no se puede acceder a los métodos privados fuera de la definición de clase y solo se puede
acceder a ellos desde dentro de la clase cuando se llaman sin self.

A partir de Ruby 2.7, ahora es legal llamar a métodos privados con un literal selfcomo llamador.
Tenga en cuenta que esto no significa que podamos llamar a un método privado con cualquier otro
objeto, ni siquiera uno del mismo tipo. Solo podemos llamar a un método privado con el objeto
actual.

Los métodos públicos y privados son los más comunes, pero en algunas situaciones menos comunes,
querremos un enfoque intermedio. Para ello, podemos utilizar el protectedmétodo para crear métodos
protegidos . Los métodos protegidos son similares a los métodos privados en que no se pueden
invocar fuera de la clase. La principal diferencia entre ellos es que los métodos protegidos
permiten el acceso entre instancias de clases, mientras que los métodos privados no.

Echemos un vistazo a un ejemplo:
=end
class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age
  end

  protected

  attr_reader :age
end

malory = Person.new(64)
sterling = Person.new(42)

malory.older?(sterling)  # => true
sterling.older?(malory)  # => false

malory.age
  # => NoMethodError: protected method `age' called for #<Person: @age=64>
=begin
El código anterior nos muestra que, al igual que los métodos privados, los métodos protegidos
no se pueden invocar desde fuera de la clase. Sin embargo, a diferencia de los métodos privados,
otras instancias de la clase (o subclase) también pueden invocar el método. Esto permite un
acceso controlado, pero un acceso más amplio entre objetos del mismo tipo de clase.

Anulación de método accidental // Accidental Method Overriding

Es importante recordar que cada clase que creas es inherentemente subclases de la clase Objeto.
La Objectclase está integrada en Ruby y viene con muchos métodos críticos.
=end
class Parent
  def say_hi
    p "Hi from Parent."
  end
end

Parent.superclass       # => Object
=begin
Esto significa que los métodos definidos en la Objectclase están disponibles en todas las clases.

Además, recuerde que mediante la magia de la herencia, una subclase puede anular el método de una
superclase.
=end
class Child < Parent
  def say_hi
    p "Hi from Child."
  end
end

child = Child.new
child.say_hi         # => "Hi from Child."
=begin
Esto significa que, si accidentalmente anulas un método que se definió originalmente en la
Objectclase, puede tener efectos de gran alcance en tu código. Por ejemplo, sendes un método de
instancia del que heredan todas las clases Object. Si definiste un nuevo sendmétodo de instancia
en tu clase, todos los objetos de tu clase llamarán a tu sendmétodo personalizado, en lugar del
de la clase Object, que es probablemente el que pretenden llamar. El objeto sendsirve como una
forma de llamar a un método pasándole un símbolo o una cadena que representa el método que
desea llamar. Los siguientes dos argumentos representarán los argumentos del método, si los
hay. Veamos cómo funciona normalmente el envío haciendo uso de nuestra Childclase:
=end
son = Child.new
son.send :say_hi       # => "Hi from Child."
=begin
Veamos qué sucede cuando definimos un sendmétodo en nuestra Childclase y luego intentamos
invocar el método Objectde send:
=end
class Child
  def say_hi
    p "Hi from Child."
  end

  def send
    p "send from Child..."
  end
end

lad = Child.new
lad.send :say_hi
=begin
Normalmente esperaríamos que el resultado de esta llamada fuera, "Hi from Child."pero al
ejecutar el código obtenemos un resultado completamente diferente:

ArgumentError: wrong number of arguments (1 for 0)
from (pry):12:in `send'

En nuestro ejemplo, pasamos sendun argumento aunque nuestro sendmétodo anulado no acepta ningún
argumento. Echemos un vistazo a otro ejemplo explorando instance_of?el método de Object.
Lo que hace este práctico método es devolver truesi un objeto es una instancia de una clase
determinada y falseen caso contrario. Veámoslo en acción:
=end
c = Child.new
c.instance_of? Child      # => true
c.instance_of? Parent     # => false
# Ahora anulemos instance_of?dentro de Child:
class Child
  # other methods omitted

  def instance_of?
    p "I am a fake instance"
  end
end

heir = Child.new
heir.instance_of? Child
=begin
Nuevamente, veremos algo completamente diferente aunque nuestra intención era usar
instance_of?el método de Object:

ArgumentError: wrong number of arguments (1 for 0)
from (pry):22:in `instance_of?'
Dicho esto, un Objectmétodo de instancia que se anula fácilmente sin ningún efecto secundario
importante es el to_smétodo. Normalmente querrás hacer esto cuando quieras una representación
de cadena diferente de un objeto. En general, es importante familiarizarse con algunos de los
Objectmétodos comunes y asegurarse de no anularlos accidentalmente, ya que esto puede tener
consecuencias devastadoras para su aplicación.

Resumen

Ya hemos recorrido bastante terreno. Deberías sentirte bastante cómodo con la sintaxis general y
la estructura del lenguaje Ruby. Tienes un conjunto más de ejercicios para ayudarte a hacer un
buen uso de esta información, luego estarás listo para dar el siguiente paso en tu viaje como
desarrollador de Ruby.

Todo este conocimiento complejo sobre la programación orientada a objetos está destinado a
ayudarnos a crear aplicaciones mejor diseñadas. Si bien definitivamente existen formas
incorrectas de diseñar una aplicación, a menudo no existe una opción correcta cuando se trata
de diseño orientado a objetos, sólo diferentes compensaciones. A medida que adquiera más
experiencia en diseño orientado a objetos, comenzará a desarrollar el gusto por cómo organizar
y dar forma a sus clases. Por ahora, todo esto puede parecer un poco desalentador, pero una vez
que aprendes a pensar en OO, es difícil no pensar de esa manera.

Finalmente, asegúrese de tomarse el tiempo para realizar los ejercicios. La programación
orientada a objetos es un concepto difícil si es la primera vez que lo encuentras. Incluso si ya
has programado en otro lenguaje OO antes, la implementación de Ruby puede ser un poco
diferente. No basta con leer y comprender; debes aprender haciendo. ¡Pasemos a los ejercicios!

Cree una superclase llamada Vehiclepara que su MyCarclase herede y mueva el comportamiento que no
es específico de la MyCarclase a la superclase. Crea una constante en tu MyCarclase que almacene
información sobre el vehículo que lo haga diferente de otros tipos de Vehículos.

Luego crea una nueva clase llamada MyTruck que hereda de tu superclase y que también tiene una
constante definida que la separa de la clase MyCar de alguna manera.

Agregue una variable de clase a su superclase que pueda realizar un seguimiento de la cantidad de
objetos creados que heredan de la superclase. Cree también un método para imprimir el valor de
esta variable de clase
=end
class Vehicle
  @@number_of_vehicles = 0

  def initialize
    @@number_of_vehicles += 1
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.number_of_vehicles
    @@number_of_vehicles
  end
end

module Jeeply
  def can_jeeply?
    puts "I can jeeply!"
  end
end

class MyCar < Vehicle
  MODEL = "Astra"
end

class Mytruck < Vehicle
  include Jeeply

  TRACCION = "4 x 4"
end

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

=begin
Mueva todos los métodos de la clase MyCar que también pertenecen a la clase MyTruck a la
clase Vehicle. Asegúrese de que todas las llamadas a métodos anteriores estén funcionando cuando
haya terminado.
=end
module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
MyCar.gas_mileage(13, 351)
lumina.spray_paint("red")
puts lumina
puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors
=begin
Escriba un método llamado ageque llame a un método privado para calcular la antigüedad del
vehículo. Asegúrese de que el método privado no esté disponible desde fuera de la clase.
Necesitará utilizar la clase Time integrada de Ruby como ayuda.
=end
class Vehicle
  # code omitted for brevity...
  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

# code omitted for brevity...

puts lumina.age   #=> "Your chevy lumina is 17 years old"
=begin
Crea una clase 'Estudiante' con atributos namey grade. NO haga público el método para obtener
calificaciones, ya que joe.gradegenerará un error. Crea un better_grade_than?método que puedas
llamar así...
=end
puts "Well done!" if joe.better_grade_than?(bob)

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)
# Dado el siguiente código...
bob = Person.new
bob.hi
=begin
Y el mensaje de error correspondiente...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

¿Cuál es el problema y cómo harías para solucionarlo?

El problema es que el método hies privado, por lo tanto no está disponible para el objeto.
Yo solucionaría este problema moviendo el himétodo encima de la privatellamada al método en la
clase.
=end
