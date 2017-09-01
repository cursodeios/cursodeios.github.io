---
layout: post
title:  "Generics"
date:   2017-08-24 12:00:00
categories: Swift
archive: true
comments: true
---

Los *Generics* son una de las cosas mas cool y poderosas de Swift, nos permite escribir funciones que pueden trabajar con cualquier tipo de dato, sujeto a los requerimientos que definimos, de esta manera evitamos duplicados y escribimos código de forma sencilla (casi toda la libreria estandar de Swift usa *generics*).


##### Ejemplo Sencillo del uso de *Generics*

Veamos una función que intercambia 2 valores enteros:
{% highlight swift %}
func swipeInts(x: inout Int, y: inout Int){
    let temp = x
    x = y
    y = temp
}

var x = 10
var y = 55
swipeInts(x: &x, y: &y) // El signo & indica que es un parametro de entrada y salida.
print(x) // 55
print(y) // 10

{% endhighlight %}

Ahora veamos una función que intercambia 2 valores String:
{% highlight swift %}
func swipeStrings(x: inout String, y: inout String){
    let temp = x
    x = y
    y = temp
}

var x = "Hello"
var y = "World"
swipeStrings(x: &x, y: &y)
print(x) // World
print(y) // Hello

{% endhighlight %}

Ahora veamos una función usando *Generics* que intercambia valores de cualquier tipo de dato:

{% highlight swift %}
func swipeValues<T>(x: inout T, y: inout T){
    let temp = x
    x = y
    y = temp
}

// Usamos Strings
var x = "Hello"
var y = "World"
swipeValues(x: &x, y: &y)
print(x) // World
print(y) // Hello


// Usamos Ints
var a = 1
var b = 3
swipeValues(x: &a, y: &b)
print(a) // 3
print(b) // 1

{% endhighlight %}

Vemos que el cuerpo de las funciones es el mismo, pero en la declaración indicamos que usaremos generics:

{% highlight swift %}
// Sin usar generics
func swipeStrings(x: inout String, y: inout String)
func swipeInts(x: inout Int, y: inout Int)

// El tipo generico se declara luego del nombre de la función entre signos <>
func swipeValues<T>(x: inout T, y: inout T)

{% endhighlight %}
