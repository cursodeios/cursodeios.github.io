---
layout: post
title: "Introducción a Generics en Swift"
date: 2017-01-03 12:00:00
categories: iOS Swift
archive: true
comments: true
---

# Introducción a Generics en Swift

## Sé que estás frustrado. He estado allí, únete a mi. Yo te guiaré.

### Historia personal

Mientras escribía un post sobre Programación Funcional en Swift, me di cuenta de que los lectores debían tener una base sólida en Generics y Protocolos para sobrevivir en Swift.

Para saber si habían buenos articulos sobre Generics, visite cada enlace de las primeras 5 páginas de la búsqueda de Google. Después de haber pasado algunos, llegué a la conclusión de que tenía que hacer algo al respecto - sentí la urgencia de ayudar a mis lectores. Podía imaginar su lucha y dolor para comprender estos temas.

### Antecedentes

Con el fin de disfrutar plenamente de este artículo, asegúrate que estás familiarizado con Protocolos, POO, funciones y extensiones. Si no, puedes encontrar todos los recursos necesarios disponibles aquí, que es mi viaje de aprendizaje personal. Dado que estamos hablando de Generics, voy a utilizar ejemplos de la documentación de Swift 3.

### Tu pasado

Antes de hablar de cualquier otra cosa, veamos tu pasado. Cómo te enseñaron y te lavaron el cerebro. Imagina que necesitas imprimir cada elemento dentro de un arreglo, probablemente lo hiciste asi:

```swift
let arregloString = ["1", "2", "3", "4"]

let arregloInt = [1, 2, 3, 4]

let arregloDouble = [1.1, 1.2, 1.3, 1.4]
```

OK, Ahora imprimimos:

```swift
func imprimirArregloString(a: [String]) {
 for s in a {
  print(s)
 }
}

func imprimirArregloInt(a: [Int]) {
 for i in a {
  print(i)
 }

}
func imprimirArregloDouble(a: [Double]) {
 for d in a {
  print(d)
 }
}
```

El código de arriba es simplemente redundante. Cada función sólo toma un tipo específico de un arreglo. Se repite como un argumento. ¿Puede haber sólo una sola función que le permite introducir cualquier parámetro cuyo tipo sea indefinido?

Esa fue una pregunta retórica. Por supuesto. Si no hubiera, probablemente no habría escrito este artículo. Despeguemos!

### Generics

En primer lugar, sólo hay una regla si deseas hacer una función genérica. Todo lo que necesitas hacer es poner <algo> justo al lado de un nombre de función. Vamos a ver:

```swift
func funcionGenerica<algo>(valor: algo) {
 print(valor)
}

funcionGenerica(valor: 123)     // Int: Wow 😀
funcionGenerica(valor: "Bob")   // String: Genial 😲
funcionGenerica(valor: 123.12)  // Double: Wooow 😵
funcionGenerica(valor: true)    // Bool: Increible 😱
```


Espera un segundo. Sólo para aclarar, cuando se introduce cualquier tipo de valor, Swift determina automáticamente el tipo de valor basado en la entrada. Por ejemplo, si llama:

```swift
funcionGenerica(valor: “Bob”)
```

El tipo de valor ahora es String y puede utilizarse dentro de la función. Si usted llama:

```swift
funcionGenerica(valor: false)
```

El valor ahora es de tipo Bool. Espero que ahora estés claro. Por supuesto, no tienes que llamarlo "algo", puedes llamarlo como quieras:

```swift
func funcionGenerica<T>(valor: T) {
 print(valor)
}
```

### Apliquemoslo

Ahora que sabemos como funcionan los generics, veamos nuestro ejemplo:

```swift
func imprimirElemento<T>(arreglo: [T]) {
 for elemento in arreglo {
  print(elemento)
 }
}
```

Entonces tendrás como resultado:

```swift
imprimirElemento(arreglo: arregloDouble)  // 1.1 1.2 1.3 1.4
imprimirElemento(arreglo: arregloInt)     // 1 2 3 4
imprimirElemento(arreglo: arregloString)  // "1" "2" "3" "4"
```

Así que, veamos la definición de Apple sobre los genéricos:

> Los Generics permiten escribir funciones y tipos flexibles y reutilizables que pueden funcionar con cualquier tipo, sujeto a los requisitos que defina. Puede escribir código que evita la duplicación y expresa su intención de una manera clara y abstracta. - Lenguaje de programación rápido

De hecho, la biblioteca Swift que usas para interactuar con una matriz y un diccionario tiene muchos Generics.

### Strucs y Generics

Generics no sólo se aplica a las funciones, sino también a las clases y estructuras. Digamos que hay una estructura llamada Familia, cuya propiedad array es llamada miembros. Puedes agregar o quitar un elemento a la matriz.

```swift
struct Familia {
 var miembros = [String]()

 mutating func push(miembro: String) {
  miembros.append(miembro)
 }

 mutating func pop() -> String {
  return miembros.removeLast()
 }
}
```

La palabra clave mutating es necesaria si desea modificar su propiedad. Puesto que usted está agregando y quitando elementos para los miembros que usted tiene que agregar mutating para esas funciones.

### De nuevo, un problema

El problema es que sólo puede añadir String al elemento porque no sólo los miembros están predefinidos como [String], sino que también pop() y push() sólo permiten que String funcione. Esto no es genérico. Esto no es genial. Si desea crear una familia cuyo nombre esté en Int, debe crear una estructura completa.

Permítanme presentar la estructura genérica que permite insertar cualquier cosa independientemente de su tipo. Similar a la función con la que trabajamos, usted pone algo al lado de su nombre.

```swift
struct FamiliaGenial<T> {
 var miembros = [T]()

 mutating func push(miembro: T) {
  miembros.append(member)
 }

 mutating func pop() -> T {
  return miembros.removeLast()
 }
}
```

Por lo tanto, ahora vamos a crear un objeto cuyo tipo puede ser Declarado explicitamente o Inferido.

### 1- Declarado explicitamente

Vamos a crear un objeto utilizando la estructura FamiliaGenial. Al igual que una función, tienes que insertar <> en su nombre. Por ejemplo:

```swift
var miFamilia = FamiliaGenial<String>()
var otraFamilia = FamiliaGenial<Int>()
```

Has declarado que la instancia miFamilia solo podrá interactuar con String y otraFamilia con Int. El beneficio es que no es necesario crear dos estructuras separadas con el fin de producir el resultado anterior. Así que, vamos a interactuar.

```swift
// miFamilia
miFamilia.members = ["Mamá", "Papá", "Hermana", "Bob"]
miFamilia.push(member: "Dog")

// otraFamilia
otraFamilia.members = [1, 2, 3, 4, 5]
otraFamilia.pop()
```

### 2- Inferido

Cuando creas un objeto, no tienes que especificar su tipo al igual que crear una variable. Swift es lo suficientemente inteligente como para adivinar su tipo. Por ejemplo:

```swift
let nombre = "Bob" // nombre es String
```

De manera similar, se aplica también a la estructura genérica. Por lo tanto, puede crear un objeto genérico como:

```swift
let familiaString = FamiliaGenial(miembros: [“Hola, Mundo])
let familiaBool = FamiliaGenial(miembros: [false, false, false])
```

Aparentemente, familiaString solo puede interactuar con String y familiaBool solo puede interactuar con Bool. No tienes que tratar con esos <> cuando creas un objeto utilizando una estructura genérica.

### Extensiones con Generics

No sólo eso, de hecho puede agregar una extensión a la estructura genérica o la clase también.

Vamos a agregar una propiedad que nos devuelve el primer elemento:

```swift
extension FamiliaGenial {

 var primerElemento: T? {
  if miembros.isEmpty {
   return nil
  } else {
   return miembros[0]
  }
 }

}
```

Ahora, puedes utilizar libremente la propiedad dentro de un objeto:

```swift
let familiaTigres = FamiliaGenial<String>()
familiaTigres.primerElemento  // nil

let familiaLeones = FamiliaGenial(members: ["Padre", "Madre"])
familiaLeones.primerElemento   // "Padre"
```

Estupendo! Has recorrido un largo camino. Estoy agradecido por tu atención y amor. Ahora vamos a la parte final.

### Restricción de tipos

Recuerda que creaste una función genérica:

```swift
func hacerAlgo<algo>(arreglo: [algo]) {}
func hacerNada<T>(valor: T) {}
```

Puedes agregar cualquier cosa independientemente, cualquier objeto. Sin embargo, ¿qué pasa si desea limitar a sólo un par de tipos? ¿Podemos limitar una función que sólo puede tomar ciertas clases?

Justo al lado de T, puede especificar los tipos con los que sólo trabaja. Vamos a crear una clase llamada, LOL.

```swift
class LOL {}
```

OK, entonces creamos una función genérica que solo acepte LOL:

```swift
func agregarClase<T: LOL>(arreglo: [T]) {}

agregarClase(arreglo: [LOL(), LOL(), LOL()]) // Funciona
agregarClase(arreglo: ["Lol", "Lol", "Lol"]) // No funciona
```

Crea una subclase de LOL:

```swift
class HijoLOL: LOL {}
```

Tambien puedes agregar a la función un valor que sea de tipo LOL:

```swift
agregarClase(arreglo: [LOL(), LOL(), HijoLOL(), HijoLOL()])
```

¿Por qué? HijoLOL() ha sido automáticamente convertido a LOL. Si no estás seguro como funciona la conversión de tipos, no dudes en unirte al curso intermedio Swift.

### Últimos Comentarios

De ahora en adelante, usarás muchos Generics. Sólo he cubierto los aspectos teóricos de los Generics. ¡Si piensas que disfrutaste este artículo o aprendiste algo nuevo, por favor ♥ o comenta abajo para mostrar tu ayuda y amor!

En la próxima serie, hablaré sobre cómo aplicar Generics a Protocolos y AssociatedType. Si estás interesado, no dudes en seguirme! 🤗

### Recursos

[Código fuente](https://github.com/bobthedev/Blog_Intro_to_Swift_Generics)
