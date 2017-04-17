//: Playground - noun: a place where people can play

import UIKit

var title = "Bienvenido al curso de iOS"

print(title)


// Variables y constantes

var a = 10

let b = 100

print(a*b)

print(b/a)

// Tambien podemos escribir especificando el tipo de datos

var c: Int = 100

let pi: Double = 3.14159

// No podemos cambiar el valor de una constante

//pi = 2.10

// Actualizar el valor de una variable

c = a * b

print(c)

// Valores booleanos

var x = false

var z: Bool =  true

if z == true {
    print("z es verdadero")
}

if x == false {
    print("x es falso")
}

// Tambien lo podemos escribir de esta manera

if !x {
    print("x es falso")
}

// El signo ! es un operador lógico de negación





// Funciones

func sayHello(person: String)-> String {
    return "Hello \(person)!"
}

sayHello(person: "John")
sayHello(person: "Anna")


// No tiene valor de retorno
func sayGoodBye(person: String) {
    print("Good bye \(person)!")
}

sayGoodBye(person: "Alex") // Good bye Alex!
sayGoodBye(person: "John") // Good bye Jonh!


func sum(a: Int, b: Int) -> Int {
    return a + b
}

sum(a: 100, b: 10) // 110


func sayWelcome(){
    print("Bienvenido al curso de Android!")
}

sayWelcome() // Bienvenido al curso de Android!

// Omitir nombre del parametro en la llamada de la funcion

func sayWelcome(_ person: String){
    print("Welcome \(person)!")
}

sayWelcome("Pedro")

// Retornar multiples valores

func minMax(a: Int, b: Int)-> (min: Int, max: Int, message: String) {
    var _min = a
    var _max = b
    if a > b {
        _min = b
        _max = a
    }
    return (_min, _max, "\(_max) es mayor que \(_min)")
}

minMax(a: 20, b: 11)


// Estructuras de control

// If
var temperature = 10

if temperature <= 15 {
    print("Hace frio")
}

// If ... else ...

if temperature <= 20 {
    print("Hace frio")
} else {
    print("Hace calor")
}


// Multiples condiciones

temperature = 16

if temperature <= 10 {
    print("Hace mucho frio")
} else if temperature <= 20 {
    print("Hace frio")
} else {
    print("Hace calor")
}


if temperature >= 15 && temperature <= 20 {
    print("El clima es agradable")
}


// Switch

let myCharacter = "z"


switch myCharacter {
    
case "a":
    print("La primer letra del abecedario")
    
case "z":
    print("La ultima letra del abecedario")
    
case "1":
    print("Esto es un numero")

default:
    // Se ejecuta si no cumple ninguno de los anteriores
    print("No identificado")
}



// For...in Loop

// Arreglo de String

let persons = ["Juan", "Pedro", "Carlos"]

for person in persons {
    print("Hola \(person)")
}

// Diccionario
let numberOfLegs = ["Araña": 8, "Hormiga": 6, "Vaca": 4]

for (animalName, legs) in numberOfLegs {
    print("La \(animalName) tiene \(legs) piernas")
}

// Rango de numeros

// Imprime la tabla de multiplicar del 5
for index in 1...12 {
    print("\(index) x 5 = \(index * 5)")
}


var year = 2000

while year <= 2010 {
    print("Feliz año \(year)")
    // Incrementamos el valor de la variable "year"
    year = year + 1
}


year = 1990

repeat {
    print("Feliz año \(year)")
    year = year + 1
} while year <= 2000





// Clases y Estructuras

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var someResolution = Resolution()

var someVideoMode = VideoMode()

// Accedemos a las propiedades de nuestras instancias

print(someResolution.height)

print(someVideoMode.resolution.height)


// Modificamos los atributos de nuestra instancia de "VideoMode"
someVideoMode.resolution.height = 1080
someVideoMode.resolution.width = 1920
someVideoMode.name = "HD"

print(someVideoMode.resolution.height)
print(someVideoMode.resolution.width)
print(someVideoMode.name!)


someResolution.width = 640
someResolution.width = 480

print(someResolution.width) // 640
print(someResolution.height)  // 480

// Tambien podemos inicializar una estructura de esta manera:
someResolution = Resolution(width: 640, height: 480)


// Metodos de instancia


class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
print(counter.count) // 1

counter.increment(by: 5)
print(counter.count) // 6

counter.reset()
print(counter.count) // 0


