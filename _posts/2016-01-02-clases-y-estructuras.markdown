---
layout: post
title:  "Clases y Estructuras"
date:   2017-01-02 11:00:00
categories: iOS Swift
archive: true
comments: true
---

Las clases y estructuras son modelos flexibles que definen una variable. Estas tienen algunas caracteristicas en común como:

1. Se pueden definir propiedades y métodos en ellas.
2. Podemos definir *subscripts* para tener acceso a propiedades.
3. Podemos definir inicializadores para configurar valores iniciales en nuestras *clase* o *estructuras*.
4. Pueden ser extendidas para expandir su funcionalidad por defecto.
5. Pueden cumplir *protocolos* con una funcionalidad por defecto.

Tambien entre ellas hay algunas diferencias como:

1. Una clase puede heredar caracteristicas de otra clase.
2. Podemos saber el tipo de una instacia de clase en tiempo de ejecución.
3. Podemos liberar recursos usados por una instancia de clase a través de *Deinitializers*.
4. Podemos tener más de una referencia hacia una instancia de clase.


##### Sintaxis para definir una clase

{% highlight swift %}
  class NombreClase {
      // Definicion de la clase
  }
  struct NombreStructura {
      // Definicion de la estructura
  }
{% endhighlight %}

> Cuando declares una clase debes utilizar notación *UpperCamelCase* y para sus propiedades debes utilizar *lowerCamelCase*. Si no conoces sobre CamelCase [ve a este enlace](https://es.wikipedia.org/wiki/CamelCase){:target="_blank"}


Veamos la definición completa de una clase y estructura:

{% highlight swift %}
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

{% endhighlight %}

Ahora creamos la instancias de nuestra clase y estructura, luego accedemos a sus propiedades:

{% highlight swift %}

    var someResolution = Resolution()

    var someVideoMode = VideoMode()

    // Accedemos a las propiedades de nuestras instancias

    print(someResolution.height) // 0
    print(someVideoMode.resolution.height)  // 0

{% endhighlight %}

Podemos actualizar las propiedades de nuestras instancias:

{% highlight swift %}
    someVideoMode.resolution.height = 1080
    someVideoMode.resolution.width = 1920
    someVideoMode.name = "HD"

    print(someVideoMode.resolution.height) // 1080
    print(someVideoMode.resolution.width)  // 1920
    print(someVideoMode.name!)  // "HD"

    someResolution.width = 640
    someResolution.width = 480

    print(someResolution.width) // 640
    print(someResolution.height)  // 480

    // Tambien podemos inicializar una estructura de esta manera:
    someResolution = Resolution(width: 640, height: 480)
{% endhighlight %}
