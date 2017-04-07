---
layout: post
title:  "Métodos de Instancia"
date:   2017-01-02 11:05:00
categories: iOS Swift
---

Los métodos de instancia son funciones que pertenecen a una instacia de **clase** o **estructura**. Deben ser declaradas dentro de la clase de la misma forma que ya aprendimos a declarar funciones.


{% highlight swift %}
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

{% endhighlight %}

En esta clase se definen 3 métodos para manejar un contador:

1. `increment()` aumenta el contador por 1.
2. `increment(by amount: Int)` incrementa el contador por el valor especificado.
3. `reset()` reestablece el contador a su valor inicial.


{% highlight swift %}

    let counter = Counter()

    counter.increment()
    print(counter.count) // 1

    counter.increment(by: 5)
    print(counter.count) // 6

    counter.reset()
    print(counter.count) // 0

{% endhighlight %}


##### Propiedad self

Cada instancia de una clase o estructura tiene una propiedad implicita llamada **self** que hace referencia a si misma, con ella podemos llamar propiedades y métodos.

{% highlight swift %}
    // Podriamos reescribir el método increment() de esta forma:
    func increment() {
        self.count += 1
    }
{% endhighlight %}
