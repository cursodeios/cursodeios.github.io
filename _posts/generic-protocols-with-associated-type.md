---
layout: post
title:  "Protocolos Genéricos con Tipo Asociado"
date:   2017-01-04 10:25:00
categories: iOS Swift
archive: true
comments: true
---

# Protocolos Genéricos con Tipo Asociado

## Aprende cómo crear Protocolos Genéricos y Tipos Asociados

### Introducción

Ya hemos aprendido a usar Protocolos y sé que te has vuelto adicto a ellos. Ahora vamos a crear Protocolos Genericos con Tipos Asociados y utilizar la palabra reservada `where` para Restricciones de Tipo, similar a cómo se hace con los Generics. Empecemos!

### Requisitos

Este tutorial es para un nivel intermedio/avanzado. Por lo tanto, espero que estés familiarizado con los temas a continuación:

* Introducción a Genérics.
* Introducción a la Programación Orientada a Protocolo.
* Closures
* Typealias.

Si no estas familiarizado con estos temas te recomiendo el [Curso de Bob](https://www.udemy.com/learn-swift-with-bob/?couponCode=BOBTHEDEVELOPER).

### La regla principal

El lenguaje de programación Swift se considera Type Safe (de tipado seguro). Esto significa que los Tipos de Datos deben ser definidos antes de ser compilados.

### Recordatorio

Antes de sumergirnos en Protocolos Genéricos, debes familiarizarte con el código siguiente:

```swift
struct EstructuraGenerica<T> {
 var propiedad: T?
}
```

Podrías declarar explícitamente el tipo de T o dejar que Swift deduzca basado en el valor:

```swift
let estructuraExplicita = EstructuraGenerica<Bool>()
// T es Bool
let estructuraImplicita = EstructuraGenerica(propiedad: "Bob")
// T es String
```

Ten en cuenta el principio de que todo Tipo debe ser definido.

### Protocolo normal

Antes de apreciar los Protocolos Genéricos, echemos un vistazo a como lo haciamos antes. Vamos a crear un protocolo que requiere agregar una propiedad cuyo tipo sea String:

```swift
protocol ProtocoloNormal {
 var propiedad: String { get set }
}
```

Creamos una clase que conforme el Protocolo:

```swift
class ClaseNormal: ProtocoloNormal {
 var propiedad: String = "Bob"
}
```

Suena bien. Sin embargo, `ProtocoloNormal` obliga a `ClaseNormal` a trabajar con String. Pero, ¿qué pasa si quieres una propiedad Int o Bool?

Es hora de introducir los Tipos Asociados en Protocolos.

### Introducción a los Tipos Asociados

En Protocolos Genéricos, para crear algo como <T> en genéricos, debes agregar un Tipo Asociado (associatedtype):

```swift
protocol ProtocoloGenerico {
 associatedtype miTipo
 var miPropiedad: miTipo { get set }
}
```

`Associated type = type alias + generics`

Ahora, cualquier cosa que se conforme a `ProtocoloGenerico` debe implementar `miPropiedad`. Sin embargo, el Tipo no está definido. Por lo tanto, la clase o estructura que se conforma con el protocolo debe definirlo implícita o explícitamente.

En primer lugar, vamos a crear una clase `MiClase` que conforme a `ProtocoloGenerico`. Debemos definir `miTipo`. Hay dos maneras de definir como se indicó anteriormente.

### Definir Tipo Asociado implicitamente

Puede definir `miTipo` basado en el valor asociado con `miPropiedad`.

```swift
class MiClase: ProtocoloGenerico {
 var miPropiedad: miTipo = "Bob"
}
```

Ahora, `miTipo` se ha definido como String basado en "Bob". Sin embargo, puedes dejar que Swift lo infiera como se muestra a continuación:

```swift
class MiClase: ProtocoloGenerico {
 var miPropiedad = "Bob" // miTipo is "String"
}
```

### Definir Tipo Asociado explicitamente

También puedes definir el tipo asociado `miTipo` llamando a `typealias`. ¿Qué? Vamos a ver.

```swift
class MiClase: ProtocoloGenerico {
 typealias miTipo = String
 var miPropiedad: miTipo = "Bob"
}
```

Si desea definir el tipo asociado `miTipo`, puede utilizar `typealias`. Por supuesto, no es necesario ya que puede definir `miTipo` implícitamente como hemos visto.

Hasta ahora, has definido `miTipo` como `String`. Vamos a crear una estructura que se ajuste a `ProtocoloGenerico` pero `miTipo` es `Int` en su lugar.

```swift
struct MiEstructura: ProtocoloGenerico {
 var miPropiedad = 1996
}
```

Has declarado implícitamente que `miTipo` es `Int` basado en el valor de `1996`.

Si escuchas Protocol Associated Types (PATs), sólo significa protocolos genéricos.

### Extensiones de Protocolos y Restricciones de Tipos

Como ya sabes, la extensión de protocolo es increíble porque proporciona implementaciones predeterminadas sin tener que definir los métodos y propiedades necesarios. Veamos:

```swift
extension ProtocoloGenerico {
 static func saludar() {
  print("Hola, soy Bob")
 }
}
```

Cualquier cosa que adopte `ProtocoloGenerico` ahora contiene esta magia:

```swift
MiClase.saludar() // Hola, soy Bob
MiEstructura.saludar() // Hola, soy Bob
```

Pero si solo quieres que `miTipo` como `String` tenga el método `saludar()`. ¿Cómo lo harias?

### Usando la instrucción Where

No te preocupe si nunca has usado `where`. Es sólo una forma más corta de escribir una declaración `if-else`.

Vamos a agregar `saludar()` para aquellos que no sólo se ajustan a `ProtocoloGenerico` pero también tiene el tipo asociado como String.

```swift
extension ProtocoloGenerico where miTipo == String {
 func saludar(){
  print("Hola, soy Bob")
 }
}
```

La cláusula `where` indica que si `miTipo` es `String`, procede, si no ignora el bloque de extensión completo.

### Hagamos la prueba

Si recuerdas, `MiClase` tiene `String` y `MiEstructura` tiene `Int`.

```swift
let instanciaMiClase = MiClase().saludar() // "Hola, soy Bob"
```

Probemos hacerlo con `MiEstructura`:

```swift
let instaciaMiEsctructura = MiEstructura() // Error
```

### Múltiples condiciones Where con Self

Puedes agregar varias cláusulas `where` para que la extensión sea más específica. Todo lo que tienes que hacer es agregar más condiciones al final.

Esta vez, vamos a añadir una restricción más que solo `MiClase` puede tener el método `saludar()`.

```swift
extension ProtocoloGenerico where type == String, Self == MiClase {
 func saludar(){
  print("Hola, soy Bob")
 }
}
```

El `Self` se refiere a la estructura/clase/enum que conforma ProtocoloGenerico. Como resultado, sólo `MiClase` tendrá el método `saludar()`.

### Sobreescribir el Tipo Asociado

Hasta ahora, en `ProtocoloGenerico`, no hemos definido *associatedtype* dentro del propio protocolo.

```swift
protocol ProtocoloGenerico {
 associatedtype miTipo
 var miPropiedad: miTipo { get set }
}
```

El tipo de `miTipo` ha sido definido por aquellos que se ajustan al protocolo. Sin embargo, también puede predefinirse tipos asociados dentro de un protocolo.

### Tipos Asociados predefinidos en un Protocolo

Vamos a crear un protocolo llamado `Familiar` que contiene un tipo asociado llamado `TipoFamilia`. Pero, se pre-define su tipo como `Int`.

```swift
protocol Familiar {
 associatedtype TipoFamilia = Int
 func obtenerNombre() -> [TipoFamilia]
}
```

Es muy parecido a `typealias`.

### Adoptar Tipos Asociados predefinidos en el Protocolo

```swift
class FamiliaNumerica: Familiar {
 func obtenerNombre() -> [TipoFamilia] {
  return [1, 2, 3]
 }
}
```

tambien podría ser:

```swift
class FamiliaNumerica: Familiar {
 func obtenerNombre() -> [Int] {
  return [1, 2, 3]
 }
}
```

Ahora creamos una instancia:

```swift
let familiaDeNumeros = FamiliaNumerica() // FamiliaNumerica<Int>
```

Sin embargo, es posible anular/cambiar el tipo predefinido de un protocolo.

### Sobreescribir el Tipo Asociado

Primero, crearemos una estructura genérica llamada `FamiliaNormal` que se ajustará a `Familiar`, eso significa que `Familiar` forzará a la estructura a trabajar con `Int`, pero esto no es lo que queremos.

Deseamos que la estructura funcione con String, ya que una familia normal debe tener nombres como "Bob" o "Bobby" en lugar de 1, 2, 3.

```swift
struct FamiliaNormal<T: ExpressibleByStringLiteral>: Familiar  {
 func obtenerNombre() -> [T] {
  return ["Bob", "Bobby", "Lee"]
 }
}
```

Ahora creamos una instancia:

```swift
let familiaNormal = FamiliaNormal() // FamiliaNormal<String>
```

¿Cómo es esto posible? Bueno, si presionas option + clic sobre String en Swift, descubrirás que String se ajusta a ExpressibleByStringLiteral.

```swift
// Libreria de Swift
extension String : ExpressibleByStringLiteral {}
```

Descarga el [Código fuente](https://github.com/bobthedev/Blog_Protocol_Associated_Type)

### Últimos Comentarios

En este tutorial, has aprendido cómo sobreescribir Tipos Asociados  e incluso combinar protocolos con genéricos. ¿Cómo fue tu aprendizaje? Hemos hablado de muchas teorías en este artículo. Por supuesto, si usted desea aprender la programación práctica orientada protocolo, RxSwift, MVVM, te recomiendo encarecidamente a unirte a mi lista de correo.
