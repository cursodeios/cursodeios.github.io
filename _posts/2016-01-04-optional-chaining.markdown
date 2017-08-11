---
layout: post
title:  "Optionals y Optional Chaining"
date:   2017-01-04 11:00:00
categories: Swift
archive: true
comments: true
---

Usamos optionals en los casos que el valor de una variable podría ser nulo. Veamos el siguiente ejemolo:

{% highlight swift %}
var possibleNumber = "123"
var convertedNumber = Int(possibleNumber) // 123

// convertedNumber es de tipo int? o optional int ya que podria ser igual a nil

possibleNumber = "123ABC"
convertedNumber = Int(possibleNumber) // nil

{% endhighlight %}

Tambien podemos asignar `nil` a un opcional:

{% highlight swift %}
var serverResponseCode: Int? = 404 // 404

serverResponseCode = nil // nil
{% endhighlight %}

##### Optional Chaining

Es un proceso mediante el cual se llaman propiedades o métodos que podrian tener un valor **nulo**. Si el opcional tiene un valor entonces la llamada se satisfactoria sino retornará **nil**.

En el ejemplo tendremos una clase *Person* que tiene una propiedad opcional que es de tipo *Residence*:

{% highlight swift %}
class Person {
  var residence: Residence?
}

class Residence {
  var numberOfRooms = 1
}
{% endhighlight %}

Creamos una instancia de la clase *Person* y tratamos de obtener el valor de de *numberOfRooms*:

{% highlight swift %}
let john = Person()

john.residence!.numberOfRooms
// Esto nos deberia dar un error: unexpectedly found nil while unwrapping an Optional value
{% endhighlight %}

Nos da un error porque la propiedad *residence* es nula. Con **optional chaining** podemos obtener el valor de **numberOfRooms** usando un signo de interrogación `?` en vez de signo de exclamación `!` de la siguiente forma:

{% highlight swift %}

if let roomCount = john.residence?.numberOfRooms {
  print("La residencia de John tiene \(roomCount) habitaciones.")
} else {
  print("No se puede obtener la cantidad de habitaciones.")
}
// No se puede obtener la cantidad de habitaciones.
{% endhighlight %}

De esta forma obtenemos el valor de *numberOfRooms* de tipo `int?` si *residence* es distinto de nulo. Si el valor de *residence* es nil entonces el valor de *numberOfRooms* será nil.

Ahora inicializamos la propiedad `john.residence` para que ya no sea `nil` y tendremos el resultado:

{% highlight swift %}
john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("La residencia de John tiene \(roomCount) habitaciones.")
} else {
    print("No se puede obtener la cantidad de habitaciones.")
}
// La residencia de John tiene 1 habitaciones.
{% endhighlight %}

##### Llamando métodos a través de Optional Chaining

Vamos a refactorizar nuestras clases de la siguiente forma:

{% highlight swift %}
class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Residence {

    var rooms = [Room]()

    var numberOfRooms: Int {
        return rooms.count
    }

    func printNumberOfRooms() {
        "The number of rooms is \(numberOfRooms)"
    }

}

class Person {
    var residence: Residence?
}
{% endhighlight %}

En el método `printNumberOfRooms` no se especifica tipo de retorno, sin embargo por defecto retorna un tipo `void` pero al ser invocado en desde un valor opcional con *optional chaining* este retornará un tipo `void?`. Veamos el ejemplo:

{% highlight swift %}
var john = Person()

if john.residence?.printNumberOfRooms() != nil {
  print("Completado con exito!")
} else {
  print("No se ha completado!")
}
// No se ha completado!

{% endhighlight %}

Ahora inicializamos la propiedad **residence** y agregamos una habitación:

{% highlight swift %}

john.residence = Residence()

john.residence?.rooms.append(Room(name: "Habitación sencilla"))

if john.residence?.printNumberOfRooms() != nil {
    print("Completado con exito!")
} else {
    print("No se ha completado!")
}
// Completado con exito!
{% endhighlight %}
