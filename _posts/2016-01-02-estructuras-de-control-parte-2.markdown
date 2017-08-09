---
layout: post
title:  "Estructuras de control - Parte 2"
date:   2017-01-01 10:25:00
categories: iOS Swift
archive: true
---

##### Ciclo For-In

Itera sobre una secuencia que podria ser un arreglo, rango de numeros o los caracteres de una cadena.

{% highlight swift %}

  //- Arreglo de String

  let persons = ["Juan", "Pedro", "Carlos"]

  for person in persons {
    print("Hola \(person)")
  }
  // Hola Juan
  // Hola Pedro
  // Hola Carlos

  //- Diccionario
  let numberOfLegs = ["Araña": 8, "Hormiga": 6, "Vaca": 4]

  for (animalName, legs) in numberOfLegs {
    print("La \(animalName) tiene \(legs) patas")
  }

  // La Vaca tiene 4 patas
  // La Hormiga tiene 6 patas
  // La Araña tiene 8 patas

  //- Rango de numeros

  // Imprime la tabla de multiplicar del 5
  for index in 1...12 {
      print("\(index) x 5 = \(index * 5)")
  }

{% endhighlight %}

##### Ciclo While

Evalua una condicion para ejecutar un bloque de codigo, mientras sea **true** y se detiene cuando se vuelve **false**.

{% highlight swift %}

  var year = 2000

  while year <= 2010 {
      print("Feliz año \(year)")
      // Incrementamos el valor de la variable "year"
      year = year + 1
  }

{% endhighlight %}

##### Ciclo Repeat while

Igualmente evalua un condicion pero que ejecuta el bloque de codigo antes de la condicion.

{% highlight swift %}
    var year = 1990

    repeat {
        print("Feliz año \(year)")
        year = year + 1
    } while year <= 2000
{% endhighlight %}
