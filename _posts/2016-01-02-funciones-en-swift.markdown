---
layout: post
title:  "Funciones en Swift"
date:   2017-01-01 11:00:00
categories: iOS Swift
---


Las funciones son bloques de código aisladas que realizan una tarea especifica, a cada funcion se le daba dar un nombre descriptivo para identificar lo que hace.

Veamos lo siguiente en el Playground que habiamos iniciado anteriormente:

{% highlight swift %}
  func sayHello(person: String)-> String {
    return "Hello \(person)!"
  }

  sayHello(person: "John") // Hello John!
  sayHello(person: "Anna") // Hello Anna!
{% endhighlight %}

En este caso tenemos una funcion que recibe el nombre de una persona y devuelve una saludo como cadena de texto.

La estructura de una funcion debe ser:

`func nombreFuncion(nombreParametro: tipo) -> tipo`

Tambien puede ser que una funcion no devuelva ningun dato:

`func nombreFuncion(nombreParametro: tipo)`

o quizas no reciba ningun parametro:

`func nombreFuncion()`

##### Veamos los ejemplos:

{% highlight swift %}

    // No tiene valor de retorno
    func sayGoodBye(person: String) {
      print("Good bye \(person)!")
    }
    sayGoodBye(person: "Alex") // Good bye Alex!
    sayGoodBye(person: "John") // Good bye Jonh!

    // Recibe 2 parametros y devuelve un Entero
    func sum(a: Int, b: Int) -> Int {
      return a + b
    }
    sum(a: 100, b: 10) // 110

    // No recibe parametros y no tiene valor de retorno
    func sayWelcome(){
      print("Bienvenido al curso de Android!")
    }
    sayWelcome() // Bienvenido al curso de Android!

{% endhighlight %}

##### Omitir nombre del parámetro en la llamada de la función

{% highlight swift %}

    // Escribimos un _ antes del nombre del parámetro

    func sayWelcome(_ person: String){
      print("Welcome \(person)!")
    }

    sayWelcome("Pedro") // "Welcome Pedro!"

{% endhighlight %}


##### Retornar múltiples valores

{% highlight swift %}

    // Esta función nos devolvera 2 enteros y una cadena de texto

    func minMax(a: Int, b: Int)-> (min: Int, max: Int, msg: String) {
        var _min = a
        var _max = b
        if a > b {
            _min = b
            _max = a
        }
        return (_min, _max, "\(_max) es mayor que \(_min)")
    }

    minMax(a: 20, b: 11) // (11, 20, "20 es mayor que 11")

{% endhighlight %}
