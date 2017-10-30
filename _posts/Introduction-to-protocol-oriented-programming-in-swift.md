---
layout: post
title:  "Introducción a la Programación Orientada a Protocolos"
date:   2017-01-01 12:00:00
categories: iOS Swift
archive: true
comments: true
---

# Introducción a la Programación Orientada a Protocolos

## La POO está bien, pero podría haber sido mejor

### Introducción

Este tutorial también esta dirigido para aquellos que no están claros sobre la diferencia fundamental entre Clases y Estructuras. Todos sabemos que no existe la herencia en las Estrucutras, pero por qué?

Si no sabes la respuesta, tomate unos segundos para ver el siguiente código:

```swift
class Humano {
  var nombre: String
  init(nombre: String) {
    self.nombre = nombre
  }
}

var miHumano = Humano(nombre: "Danny")
miHumano.nombre // "Danny"

var otroHumano = miHumano // Creamos una "Copia" del objeto

otroHumano.nombre = "Daniel"
miHumano.nombre // "Daniel"

```
Cuando cambié la propiedad *nombre* del objeto *otroHumano* a "Daniel", la propiedad *nombre* del objecto original *miHumano*, también cambio a "Daniel".

Ahora veamos un ejemplo con estructuras:

```swift
struct Humano {
 var nombre: String
}
var humano = Humano(nombre: "Danny")
var nuevoHumano = humano // Copiar y pegar

nuevoHumano.nombre = "Daniel"
humano.nombre // "Danny"
```

¿Ahora ves las diferencia? El cambio de la propiedad nombre del objeto copiado no afecto al objeto original.

En las Clases, cuando haces copia de una variable, ambas hacen referencia al mismo objeto en memoria. Un cambio en una de las variables afectara la otra (tipo por referencia). En las Estructuras, sin embargo, al copiar y pegar una variable se creará un objeto por separado (tipo por valor).


### Adiós POO

Puede que estés preguntándote por qué estoy hablando de estos temas que aparentemente no están relacionados a las POP. Pero antes de hablar de algunos beneficios de usar POP sobre POO, debes entender la diferencia entre Tipo por Referencia y Tipo por Valor.

Hay algunos beneficios de usar POO, pero también algunas desventajas:

1. Cuando haces un Subclase, heredas propiedades y métodos que no necesitas. Tu objeto se vuelve innecesariamente inflado.

2. Cuando tienes muchas Super Clases, se vuelve difícil navegar entre cada clase y arreglar errores o editar.

3. Los objetos, por hacer referencia al mismo lugar en memoria, si creas una copia y haces un pequeño cambio, este afecta al resto. (Mutabilidad debido a referencia)

Por cierto, hecha un vistazo a cómo esta escrito el framework UIKit usando POO:

![Estrucutra de UIKIT](https://cdn.bobthedeveloper.io/posts/5993509c761f601bc340f5c4/uikit-oop-structure.png)

Si fueras a trabajar para Apple como ingeniero de software por primera vez, ¿podrias entender todo este código rapidamente? me refiero a que los desarrolladores podemos tener malos ratos usandolo a nivel superficial.

Alguien dijo que la POO es solo una forma de escribir código espaguetti modularizado. En estos enlaces puedes encontrar algunas cosas malas sobre la POO: [Enlace 1](https://krakendev.io/blog/subclassing-can-suck-and-heres-why),  [Enlace 2](http://www.smashcompany.com/technology/object-oriented-programming-is-an-expensive-disaster-which-must-end) y [Enlace 3](https://www.leaseweb.com/labs/2015/08/object-oriented-programming-is-exceptionally-bad/).

### Bienvenido

Puede que lo hayas adivinado correctamente, a diferencia de las clases, lo fundamental en la programación orientada a los protocolos es el tipo por valor. No más referencias. A diferencia de la estructura de pirámide que se ve arriba, la POP favorece el código plano y no anidado.

Sólo para asustar un poco, voy a mencionar la definición de Apple:

"Un protocolo define un modelo de métodos, propiedades ... El protocolo puede ser adoptado por una clase, estructura o enumeración" - Apple

Lo único que debes recordar ahora es la palabra "modelo". Un protocolo es como un entrenador de baloncesto. Él le dice a sus jugadores qué hacer, pero no sabe cómo clavar la pelota en el aro.

### Entrando a la POP

Primero hagamos un modelo para un humano:

```swift
protocol Humano {
 var nombre: String { get set }
 var raza: String { get set }
 func decirHola()
}
```

El protocolo sólo te dice que existen ciertas cosas. Por cierto, no te preocupes por { get set } por ahora. Simplemente indica que puedes definir el valor de la propiedad en algo diferente y también obtener el valor de la propiedad. No te preocupes por ahora a menos que estés usando una propiedad calculada.

Vamos a hacer una estructura que adopte este protocolo:

```swift
struct Coreano: Humano {
 var nombre: String = "Bob Lee"
 var raza: String = "Asiatico"
 func decirHola() { print("Hola, Yo soy \(nombre)") }
}
```

Una vez que la estructura adopta el protocolo humano, tiene que "conformarse" al protocolo implementando todas las propiedades y métodos que le pertenecen.

Como puedes ver, puedes personalizar todas estas propiedades siempre y cuando cumpla con el modelo.

Por supuesto, para Americanos también:

```swift
struct Americano: Humano {
 var nombre: String = "Joe Smith"
 var raza: String = "Blanco"
 func decirHola() { print("Hola, mi nombre es \(nombre)") }
}
```

¿Muy genial? Mira cuánta libertad tienes al no usar las palabras clave "init" y "override". ¿Comienza a tener sentido?

### Herencia en Protocolos

¿Qué pasa si desea crear un protocolo SuperHumano que también hereda el modelo del protocolo Humano?

```swift
protocol SuperHumano: Humano {
 var puedeVolar: Bool { get set }
 func golpear()
}
```

Ahora, si quieres hacer una estructura o una clase que adopte el protocolo SuperHumano, tienes que cumplir con el modelo del protocolo humano también:

```swift
struct SuperSaiyajin: SuperHumano {
 var nombre: String = "Goku"
 var raza: String = "Asiatico"
 var puedeVolar: Bool = true

 func decirHola() { print("Hola, Yo soy \(nombre)") }

 func golpear() { print("Pufffff") }
}
```

Por supuesto, puedes conformar muchos protocolos como si fuera heredar de más de una Clase.

```swift
// Ejemplo
struct Ejemplo: ProtocoloUno, ProtocoloDos { }
```

### Extensiones en Protocolos

Ahora, esta es la característica más poderosa de usar protocolos. No creo que necesite hablar demasiado.

```swift
// Super Animal habla Inglés
protocol SuperAnimal {
 func hablarIngles()
}
```

Agrega una extensión a SuperAnimal:

```swift
extension SuperAnimal {
 func hablarIngles() { print("Estoy hablando Inglés, genial ¿no?")}
}
```

Ahora hagamos una clase que adopte el protocolo SuperAnimal:

```swift
class Burro: SuperAnimal {}

var ramon = Burro()
ramon.hablarIngles() //  "Estoy hablando Inglés, genial ¿no?"
```

Si utilizas una extensión, puedes agregar funciones y propiedades predeterminadas a Clases, Estructuras y Enumeraciones. ¿No es simplemente impresionante?

### Protocolo como Tipo (Lo último)

¿Qué sucedería si te dijera que podrías crear un arreglo que contenga una  estructura o una clase sin hacer conversión de tipo?

Está bien.

Para el ejemplo, voy a utilizar canguros que luchan por conseguir hembras. Si no me crees, mira esta lucha de canguros:

```swift
protocol Peleador {
 func patear()
}

struct EstructuraCanguro: Peleador {
 func patear() { print("Puffff") }
}

class ClaseCanguro: Peleador {
 func patear() { print("Paffff") }
}
```

Ahora creamos dos objetos Canguro:

```swift
let canguro1 = EstructuraCanguro()
let canguro2 = ClaseCanguro()
```

Ahora los combinamos en un arreglo:

```swift
var canguros: [Peleador] = [canguro1, canguro2]
```

¿Sorprendente?, Mira esto:

```swift
for canguro in canguros {
 canguro.patear()
}
// "Puffff"
// "Paffff"
```

### Parte 2

Ahora apliquemos POP en Apps reales! Clic [Aquí](https://blog.bobthedeveloper.io/protocol-oriented-programming-view-in-swift-3-8bcb3305c427)


### Última observación

Si has encontrado este tutorial útil y crees que hice un buen trabajo, por favor ❤️ para mí y comparte con tu comunidad. Más desarrolladores iOS deben implementar POP! y es por eso que escribí esto, pero necesito tu apoyo para un mayor impacto!

### Próximamente

Este sábado voy a escribir sobre el patrón de Delegación en Swift 3 usando Protocolos. Algunas personas me pidieron que escribiera sobre ello, así que decidí escucharlas. Si quieres actualizaciones rápidas o solicitarme cualquier tema, puedes seguir mi página de Facebook de Bob the Developer en la que me dedico mucho a mis lectores.

Si desea llevar tus conocimientos de Swift al siguiente nivel con administración de memoria, enumeraciones, genéricos y otros temas avanzados de Swift, puedes encontrar el curso intermedio útil para tu aprendizaje. Puedes inscribirte en la lista de espera y recibir el enlace de descuento personal aquí.
