---
layout: post
title: "No tengas miedo a los Closures en Swift"
date: 2017-01-05 12:00:00
categories: iOS Swift
archive: true
comments: true
---

# No tengas miedo a los Closures en Swift

## Entonces, ¿Quieres ser un programador funcional?

### Introducción

Algun tiempo atrás le temia al uso de `Closures`, evité usarlos lo más posible. Esos palabras de aspecto extraño como `completion handler` o `@escaping` me asustaban.

Si no estás familiarizado con los `Closures`, no te preocupes, yo te ayudaré a avanzar. Espero que al terminar entiendas el significado de devolver un valor a través de una función. Sino, puedes comenzar con mis lecciones de YouTube sobre cosas básicas y volver después.

### Recursos

[Tutorial de Swift con Bob](https://www.youtube.com/playlist?list=PL8btZwalbjYlRZh8Q1VK80Ly0YsZ7PZxx)

### Motivación

La programación funcional es tendencia en iOS y los `Closures` tienen que ver mucho con eso. ¿Qué? ¿Por qué? ¿Cómo? Bueno, creo que es demasiado pronto para discutir esta relación. Es como comer carne sin dientes.

### Lo que vamos a aprender

El significado de `Closures`, funciones de orden superior y funciones de primera clase. Estas palabras pueden ser extrañas para tí. Bueno, aprendamos juntos.

### ¿Que son los Clousures?

Cuando se lo explico a mi hermana de 13 años, solo digo que es una función sin la palabra clave `func` y sin un nombre. Sin embargo, los Clousures parecen desnudos e incluso incompletos.

Entonces, comparemos cómo sumarias dos números en una función vs clousure. Ambos tomarán dos parámetros Int y devolverán uno Int. Comencemos con una función.

```swift
func sumarNumeros(numero1: Int, numero2: Int) -> Int {
 return numero1 + numero2
}

var funcionAlmacenada = sumarNumeros
funcionAlmacenada(5, 9) // 14

```

He almacenado la función sumarNumeros en una variable llamada `funcionAlmacenada`. ¿Pero, cómo es esto posible? Bueno, en Swift, al igual que muchos otros lenguajes de programación, las funciones se describen como una función de primera clase. No sé por qué se llama así, pero puedes almacenar una función en una variable o constante.

Sin embargo, no tenemos que usar la palabra clave `func` para almacenar una función. De hecho, podemos usar un Clousure en su lugar.

```swift
var closureAlmacenado: (Int, Int) -> Int = { (numero1, numero2) in
 return numero1 + numero2
}

closureAlmacenado(numero1: 5, numero2: 9) // 14
```

El ejemplo anterior es idéntico al primer ejemplo. La palabra clave `in` se utiliza para separar los parámetros de entrada, número 1 y número 2 de la parte de retorno. Además, hemos declarado que el tipo es (Int, Int) -> Int. El tipo preestablecido indica a la variable que toma dos parámetros y devuelve un `Int`.

Espero que ahora, hayas comenzado a comprender la idea de que el Clousure es una función sin nombre y la palabra clave `func`. O bien, puedes decir que una función es un Clousure más detallado.

Pero, el ejemplo anterior se puede simplificar y, sí, todavía se llama Clousure.

```swift
// Más corto
var closureAlmacenado: (Int, Int) -> Int = { return $0 + $1 }

// Aún más corto
var closureAlmacenado: (Int, Int) -> Int = { $0 + $1 }
```

¿Entonces, ¿qué diablos es $0 y $1? Bueno, es solo una sintaxis de Swift. Reconoce automáticamente dos parámetros `Int`. El primer valor de entrada es `$0` y el segundo, `$1`. Además, ni siquiera necesitamos devolver el resultado si solo estás jugando con esos dos parámetros. Sin embargo, si desea agregar un poco más de brillo al closure como imprimir algo:

```swift
var closureAlmacenado: (Int, Int) -> Int = { (numero1, numero2) in
 print("Hola")
 return numero1 + numero2

}
closureAlmacenado(3, 5) // "Hola"
```

### Insertar una funcion en una funcion :open_mouth:

Hasta ahora, has aprendido que los Closures y las funciones son más o menos lo mismo y ambos son de primera clase, ya que puedes almacenarlos en una variable. Pero también se les llama función de orden superior. ¿Qué? (Una vez más, no sé de dónde viene el nombre). Puedes usar el Closure/función como parámetros e incluso devolverlos.

Por ejemplo, puedes insertar una función en una función. Intentemos insertar una función de impresión que regrese, "hola mundo" dentro de una función. El tipo de función utilizada como parámetro es  `() -> String`

```swift
func insertarAlgo(closure: () -> String) {
 closure()
}
```

OK, ahora agregamos una función que devuelve un "Hola mundo":

```swift
func retornarHolaMundo() -> String {
 print("Hola mundo")
 return "Hola mundo"
}
```

 Ejecutemoslo:

 ```swift
insertarAlgo(closure: retornarHolaMundo) // "Hola mundo"
 ```

 Solo para recapitular, has insertado retornarHolaMundo, que es una función que devuelve un valor de cadena, en `insertarAlgo`.

 Si desea agregar un closure como parámetro de inmediato, puede hacerlo de esta manera:

 ```swift
var closureHolaMundo: () -> String = { return "Hola" }
 ```

Si solo quieres agregar algo de inmediato, puedes hacer esto:

```swift
insertarAlgo(closure: { return "Hola mundo"}) // "Hola mundo"
```

### Últimas observaciones

Si quieres saber más sobre `Closures` avanzados como `CompletionHandler`, `@escaping`, puedes unirte al curso intermedio Swift. He creado un capítulo llamado "Introducción a la programación funcional". Siéntete libre de unirte al curso [Aquí](https://www.udemy.com/learn-swift-with-bob/?couponCode=BOBTHEDEVELOPER)
