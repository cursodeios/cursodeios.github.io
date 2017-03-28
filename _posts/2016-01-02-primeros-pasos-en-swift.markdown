---
layout: post
title:  "2- Primeros pasos en Swift"
date:   2017-01-01 10:20:00
categories: iOS Swift
---

Para comenzar a aprender Swift vamos a utilizar un **Playground** que es una herramienta genial creada por Apple que ya está incluida en XCode.

Comenzamos abriendo XCode y veremos varias opciones, vamos a hacer en click en **Get started with a Playground**, le damos un nombre y seleccionamos un directorio para guardarlo.

![XCode Playground](/assets/images/post/img-2-1.png){:class="img-50"}

Luego tendremos una ventana como la siguiente donde empezaremos a probar Swift:

![Xcode Playground](/assets/images/post/img-2-2.png){:class="img-100"}

Un Playground nos permite escribir codigo y ejecutar inmediatamente para ver el resultado, borremos el contenido y escribamos lo siguiente:

{% highlight swift %}

  import UIKit

  var title = "Bienvenido al curso de iOS"
  print(title)
{% endhighlight %}

Ahora podemos ver al lado derecho la *barra de resultado* y en la parte inferior el *Área de DEBUG* para ver la ejecución de nuestro código. Si no pueden ver la barra en la parte inferior podemos ir al menu de XCode y seleccionar `View\Debug Area\Show Debug Area`

![Xcode Playground](/assets/images/post/img-2-3.png){:class="img-100"}

Ahora vamos a escribir mas código debajo de lo que ya tenemos:

{% highlight swift %}

    // Variables y constantes
    // Una variable se declara con la palabra reservada var
    // Una constante con la palable reservada let

    var a = 10
    let b = 100

    print(a*b)
    print(b/a)

    // Tambien podemos escribir especificando el tipo de datos
    var c: Int = 100
    let pi: Double = 3.14159
    // No podemos cambiar el valor de una constante
    // pi = 2.10 // nos daria un error
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
{% endhighlight %}


Ahora ya sabes como crear y jugar con un *Playground* en XCode, en los proximos Posts seguiremos aprendiendo sobre Swift hasta que puedas desarrollar un App totalmente funcional.

![Programming](https://media.giphy.com/media/UcK7JalnjCz0k/giphy.gif)
