---
title: Sentencias Guard y Defer
layout: post
date: '2017-01-05 06:00:00 -0600'
categories: Swift
archive: true
comments: true
---

La sentencia **guard** se utiliza para transferir el control del programa fuera del entorno si la condición dada no se cumple.

{% highlight swift %}

func getServerResponse(code: String) -> Int {
    guard let code = Int(code) else {
        return 500
    }
    return code
}

getServerResponse(code: "404") // 404
getServerResponse(code: "Not found") // 500

{% endhighlight %}

En este ejemplo si la conversión del valor de tipo `String` falla, el método retorna `500` (Internal Server Error) sino retorna el valor convertido.

> La condición debe ser de tipo Bool o puede ser un valor opcional (como vimos en el post anterior donde estudiamos **Optional Binding**) y se puede usar la variable asignada siempre y cuando esté en el mismo ámbito.

La sentencia *else* siempre es requerida y ademas de *return* podemos usar *continue*, *break* o *throw*. Veamos un ejemplo sencillo:

{% highlight swift %}
for number in 1...20 {
    guard number <= 10 else {
        continue
    }
    print(item) // 1...10
}
{% endhighlight %}

En este caso usamos un ciclo *for in* y paramos la ejecución cuando la variable *number* sea mayor que 10.

##### Defer

La sentencia **defer** aplaza la ejecución de una instrucción hasta el final del ámbito en que se encuentra. Veamos el ejemplo:

{% highlight swift %}

func readFile(name: String?){
    if let filename = name {
        defer {
            print("Cerrar el archivo \(filename)")
        }
        print("Abrir el archivo \(filename)")

    } else {
        print("Error al abrir archivo")
    }
}

readFile(name: "profile.doc")
readFile(name: "tables.xls")
readFile(name: nil)
// Abrir el archivo profile.doc
// Cerrar el archivo profile.doc
// Abrir el archivo tables.xls
// Cerrar el archivo tables.xls
// Error al abrir archivo
{% endhighlight %}

Podemos ver que al final de la ejecución del método **readFile** se hace el cierre del archivo cuando este es distinto de `nil`.

En una sentencia *defer* no puede existir ninguna clausula *return* o *break* y en caso de que haya más de una sentencia *defer* se ejecutarán en orden contrario a su declaración, es decir, el último declarado se ejecutará primero.

{% highlight swift %}

func readFile(name: String?){
    if let filename = name {
        defer {
            print("Cerrar sesión")
        }
        defer {
            print("Cerrar el archivo \(filename)")
        }
        print("Abrir el archivo \(filename)")

    }
}
// Abrir el archivo tables.xls
// Cerrar el archivo tables.xls
// Cerrar sesión

{% endhighlight %}