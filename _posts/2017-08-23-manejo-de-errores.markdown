---
layout: post
title:  "Manejo de Errores en Swift"
date:   2017-08-23 12:00:00
categories: Swift
archive: true
comments: true
---

Es el proceso de responder y recuperarse de las condiciones de error en nuestra aplicación. Swift nos da un soporte de primera clase para lanzar, capturar, propagar y manipular errores recuperables en tiempo de ejecución.

Por ejemplo, al leer un archivo alojado en disco podrían haber muchas maneras en que esta tarea puede fallar, el archivo no existe en el directorio especificado, el archivo no tiene permisos de lectura o podría estar en otro formato distinto al requerido. Asi que debemos encontrar la manera de resolver estos error y comunicar al usuario que ha ocurrido.

El manejo de errores nos permite saber que algo inesperado ocurrio en el proceso y no podemos continuar, para esto usamos la sentencia `throw`. Por ejemplo la siguiente linea nos indica que el formato valido para un arhivo es *mp3*:

`throw FileReaderError.invalidFormat(validFormat: "mp3")`

##### Propagar errores en Funciones

Para indicar que una función o inicializador puede lanzar un error especificamos la palabra `throws` despues de los parámetros:

{% highlight swift %}
// Con valor de retorno
function nameOfFunction(param: String) throws -> String

// Sin valor de retorno
function nameOfFunction(param: String) throws
{% endhighlight %}

##### Ejemplo


Abrimos un nuevo playground en Xcode y usamos el siguiente código:

{% highlight swift %}
enum FileReaderError: Error {
    case notFound
    case readOnly
    case writeOnly
    case invalidFormat(validFormat: String)
}

struct File {
    var name: String
    var format: String
}

{% endhighlight %}

Creamos una clase llamada **MP3Reader**:
{% highlight swift %}
class MP3Reader {

    var tracks: [File] = []

    func open(file: File) throws {

        guard file.format == "mp3" else {
            throw FileReaderError.invalidFormat(validFormat: "mp3")
        }

        tracks.append(file)
        print("File opened: \(file.name).\(file.format)")
    }
}
{% endhighlight%}

El método `open` lanzara un error si el formato del archivo es diferente de `mp3`, utilizamos la palabra reservada `try` para llamar al método:

{% highlight swift %}
var musicReader = MP3Reader()
try musicReader.open(file: File(name: "On the floor", format: "mp4"))
{% endhighlight %}


##### Manejando errorres usando Do-Catch

Vamos a utilizar el ejemplo de la máquina dispensadora:

{% highlight swift %}
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}
{% endhighlight %}

Creamos la clase VendingMachine:

{% highlight swift %}
class VendingMachine {
    var inventory = [
        "Candies": Item(price: 5, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Soda": Item(price: 20, count: 1)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {

        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensando: \(name)")
    }
}
{% endhighlight %}

Utilizamos `do-catch` para manejar errores de un bloque de código y determinar cual será el tipo de error que se presenta:


{% highlight swift %}

var vendingMachine = VendingMachine()

vendingMachine.coinsDeposited = 10

do {
    try vendingMachine.vend(itemNamed: "Soda")
} catch VendingMachineError.invalidSelection {
    print("Opcion invalida.")
} catch VendingMachineError.outOfStock {
    print("No hay disponible")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Fondos insuficientes. Inserte \(coinsNeeded) monedas.")
}
// Fondos insuficientes. Inserte 10 monedas.
{% endhighlight %}

En este caso el error corresponde a *Fondos insuficientes* y necesitas más monedas para comprar un Soda. Es importante que realices otras pruebas en este ejemplo y puedas lanzar todos los tipos de errores en la máquina dispensadora.

##### Convertir errores en Valores Opcionales

Usamos `try?` para manejar el error y convertirlo en un valor opcional. Si ocurre un error el valor de la expresión sera `nil`. Veamos 2 ejemplos:

{% highlight swift %}
enum AppError: Error {
    case invalid
}

func someThrowingFunction(value: Int) throws -> Int {
    guard value > 0 else {
        throw AppError.invalid
    }
    return value
}

let x = try? someThrowingFunction(value: 0)

let y: Int?

do {
    y = try someThrowingFunction(value: 0)
} catch {
    y = nil
}
{% endhighlight %}

##### Evitar propagación del error

Usamos `try!` para deshabilitar la propagación del error. En este caso estamos seguro que no ocurrirá ningun error con la expresión, en caso contrario habrá un error en tiempo de ejecución:


{% highlight swift %}
let x = try! someThrowingFunction(value: 1)

let x = try! someThrowingFunction(value: 0) // Error en tiempo de ejecución 
{% endhighlight %}
