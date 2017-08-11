---
layout: post
title:  "Estructuras de control - Parte 1"
date:   2017-01-01 10:25:00
categories: iOS Swift
archive: true
comments: true
---

Permiten modificar el flujo de ejecución de nuestro código. Esta pueden ser secuenciales o iterativas.

##### Secuenciales (IF, ELSE, SWITCH)

Son muy utiles para ejecutar diferentes partes de codigo basados en una condicion, veamos el ejemplo:

{% highlight swift %}

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

{% endhighlight %}


El switch compara un valor con varias sentencias o patrones y luego ejecuta el codigo correspondiente.

Veamos el siguiente ejemplo:

{% highlight swift %}    
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
{% endhighlight %}
