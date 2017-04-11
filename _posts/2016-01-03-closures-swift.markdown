---
layout: post
title:  "Closures en Swift"
date:   2017-01-03 11:05:00
categories: iOS Swift
---

Los *Closures* en Swift son fragmentos con una funcionalidad especifica que puedes usar en tu código. Lo puedes pasar como argumento en una función o usarlo como propiedad de un objeto.

##### Sintaxis

{% highlight swift %}

    // Sintaxis Básica
    {(parametro) -> tipo in
       // Aquí escribimos la funcionalidad
    }

    // Ejemplo sencillo
    {(a: Int) -> Int in
      return a + 1
    }

{% endhighlight %}

Ahora puedes crear un nuevo **playground** y seguir los ejemplos que vamos a realizar.

##### Closure como parámetro en una función

En el siguiente ejemplo vamos a utilizar un arreglo de enteros y elevar al cuadrado cada numero. Vamos a usar la funcion `map()` para crear otro arreglo de los numeros elevados al cuadrado.

{% highlight swift %}

    let numbers = [2,5,7,8,9]

    let result = numbers.map({
        (number: Int) -> Int in
        return number * number
    })

    print(result) // [4, 25, 49, 64, 81]

{% endhighlight %}

##### Omitiendo el TIPO en el closure (Type Inference)

Sabemos que Swift es un lenguaje potente e inteligente, al tener un arreglo de Enteros al invocar la funcion map en el closure no es necesario especificar el tipo del *parámetro number*.

Entonces transformamos nuestro código:

{% highlight swift %}

    let result = numbers.map({
        number -> Int in
        return number * number
    })

    // Pero aun podemos hacerlo mas corto
    // Omitimos la palabra reservada RETURN
    // Y tendremos el mismo resultado

    let result = numbers.map({
        number in number * number
    })

{% endhighlight %}

##### Nombres de Agurmentos Abreviados

Aun podemos resumir mas nuestro código abreviando el nombre de nuestros parámetros, incluso podemos omitir la palabra reservada **in** que separa los parametros del cuerpo del closure.

Swift nos permite nombrar nuestro primer parámetro en el closure como **$0**, el segundo como **$1** y así sucesivamente.

{% highlight swift %}

    // Ahora lo escribimos de la siguiente forma
    // Debemos tener el mismo resultado
    let result = numbers.map({ $0 * $0 })

{% endhighlight %}

##### Trailing Closures

Swift nos da la facilidad que cuando un closure sea el último o único argumento de una función podemos llamarlo fuera de los paréntesis de los parametros.

{% highlight swift %}

    let result = numbers.map(){ $0 * $0 }

    // Si es el unico parametro podemos quitar los paréntesis
    let result = numbers.map { $0 * $0 }

{% endhighlight %}

##### Otro ejemplo

Vamos a ordenar un arreglo de Enteros de mayor a menor usando *closures*:

{% highlight swift %}

    let numbers = [5,2,7,9,8,1,100,22,53]

    let result = numbers.sorted(by: {
        n1, n2 in
        return n1 > n2
    })

    let result2 = numbers.sorted(by: { $0 > $1 })

    // En ambos casos el resultado será:
    // [100, 53, 22, 9, 8, 7, 5, 2, 1]

{% endhighlight %}
