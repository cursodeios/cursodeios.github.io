---
layout: post
title:  "Programación Orientada a Protocolos en Swift"
date:   2017-01-02 10:25:00
categories: iOS Swift
archive: true
comments: true
---

# Programación Orientada a Protocolos en Swift

## Aprende cómo animar Buttons, Labels e ImageViews sin crear muchas clases.

Hay una frase que dice: el conocimiento sin ejecución es como tener dientes, pero sólo beber leche. Ya es suficiente de teorías. ¿Cómo puedes empezar a usar la POP en tu aplicación? 🤔

Con el fin de sacar mejor provecho, espero que ya estés familiarizado con los **completion handlers** en Swift y su implementación básica protocolos. Si aun no estas claro con el uso de protocolos, te pido que revises el post sobre  ([Introdución a Protocolos en Swift](https://blog.bobthedeveloper.io/introduction-to-protocol-oriented-programming-in-swift-b358fe4974f)).

### Que aprenderás en este Post

Aprenderás a utilizar Protocolos para animar componentes de la interfaz de usuario tales como UIButton, UILabel y UIImageView. También te mostraré las diferencias entre los métodos tradicionales versus Protocolos. 😎

### UI (Interfaz de usuario)

La aplicación de demostración se llama "Bienvenido a mi fiesta". He hecho esta aplicación para verificar si te he invitado a mi fiesta y debes introducir tu código de invitación. No hay lógica detrás de esta aplicación. Si presionas el botón, los componentes se animarán. Hay cuatro componentes que se animan codigoTextField, loginButton, errorLabel y perfilImageView.

Hay dos animaciones: Vibrar y Desvanecer.

![Animaciones](https://cdn.bobthedeveloper.io/posts/5993515e761f601bc340f5c6/completed-project-using-protocol-oriented-programming.gif)

### Echemos un vistazo

Para comprender completamente el poder de la POP en aplicaciones reales, vamos a comparar con el método tradicional. Digamos que deseamos animar un UIButton y UILabel, puedes hacer una subclase para ambos y luego agregar un método a él:

```swift
class BotonAnimado: UIButton {
 func vibrar() { // Lógica de la animación }
}

class EtiquetaAnimada: UIButton {
 func vibrar() { // Lógica de la animación }
}
```

Entonces hagamos que vibre al presionarl el botón:

```swift
@IBOutlet wear var errorLabel: EtiquetaAnimada!
@IBOutlet wear var loginButton: BotonAnimado!

@IBAction func verificarCodigo(_ sender: UIButton) {
 errorLabel.vibrar()
 loginButton.vibrar()
}
```

¿Ves cómo estamos repitiendo? La lógica de animación es al menos 5 líneas y hay una "mejor" manera de hacerlo usando un extensión porque UILabel y UIButton pertenecen a UIView, podemos añadir:

```swift
extension UIView {
 func vibrar() { // Lógica de la animación }
}
```
Entonces nuestro BotonAnimado y EtiquetaAnimada tendrian un método **vibrar**. Ya no estamos repitiendo en nuestro código:

```swift
class BotonAnimado: UIButton {}
class EtiquetaAnimada: UILabel {}

@IBOutlet wear var errorLabel: EtiquetaAnimada!
@IBOutlet wear var loginButton: BotonAnimado!

@IBAction func verificarCodigo(_ sender: UIButton) {
 errorLabel.vibrar()
 loginButton.vibrar()
}
```

### Esta bien pero, ¿ Por qué usar POP?

Como Has visto, el errorLabel, que dice "introduce por favor un código válido 😂" también tiene una animación, aparece y desaparece.

Hay dos maneras de hacer esto. En primer lugar, podrías de nuevo agregar otro método a UIView.

```swift
// Extensión de UIView
extension UIView {
 func vibrar() { // Lógica de Animación }
 func desvanecer() { // Lógica de Animación del UILabel }
}
```

Sin embargo, si agregamos métodos a UIView, el método desvanecer estará disponible para otros components además del UILabel y estariamos heredando  funciones innecesarias.

La segunda forma sería hacer una subclase de UILabel:

```swift
// Subclase de UILabel
class EtiquetaAnimada: UILabel {
 func desvanecer() { // Lógica de Animaciń del UILabel }  
}
```

De esta forma funcionaría bien pero ahora voy a mostrarte como se hace con POP.

### Usando Programación Orientada a Protocolos


Bueno, suficiente de hacer subclases. Vamos a crear un protocolo "Vibrante" primero.

```swift
protocol Vibrante {}

extension Vibrante where Self: UIView {
 func vibrar() { // Lógica de Animación }
}
```

Por lo tanto, cualquier componente que se ajuste al protocolo Vibrante tendría el método vibrar asociado. A diferencia de la extensión sólo aquellos que se ajustan al protocolo tendrán ese método. Se utiliza Self: UIView para indicar que el protocolo debe ser sólo conformado con UIView o componentes que heredan de UIView.

Ahora, vamos a aplicar Vibrante a loginButton, codigoTextField, errorLabel y perfilImageView Pero, espera, ¿como hacemos para Desvanecer?

Bueno de la misma manera:

```swift
protocol Desvanecedor {}

extension Desvanecedor where Self: UIView {
 func desvanecer() { // Lógica de Animación }
}
```

Ahora vamos a completarlo:

```swift
class TextFieldAnimado: UITextField, Vibrante {}
class ButtonAnimado: UIButton, Vibrante {}
class ImageViewAnimado: UIImageView, Vibrante {}
class LabelAnimado: UILabel, Vibrante, Desvanecedor {}

class LoginViewController: UIViewController {

  @IBOutlet weak var codigoTextField: TextFieldAnimado!
  @IBOutlet weak var loginButton: ButtonAnimado!
  @IBOutlet weak var errorLabel: LabelAnimado!
  @IBOutlet weak var perfilImageView: ImageViewAnimado!

  @IBAction func verificarCodigo(_ sender: UIButton) {
    codigoTextField.vibrar()
    loginButton.vibrar()
    errorLabel.vibrar()
    errorLabel.desvanecer()
    perfilImageView.vibrar()
  }
}
```

Lo genial de la POP es que incluso puedes aplicar desvanecer a cualquier otro componente sin hacer subclase en absoluto.

`class LabelAnimado: UILabel, Vibrante, Desvanecedor`

Ahora declaramos nuestra clase de forma más elegante conociendo los protocolos a los que conforma y evitaremos crear subclases, tendremos nombres de clases más flexibles y nos sentiremos mejores desarrolladores de Swift. 😎

### Última observación

Si has encontrado este tutorial útil y crees que hice un buen trabajo, por favor ❤️ para mí y comparte con tu comunidad. Más desarrolladores iOS deben implementar POP! y es por eso que escribí esto, pero necesito tu apoyo para un mayor impacto!

Ahora, si deseas llevar su juego Swift al siguiente nivel, no dudes en unirse al curso intermedio de Swift. Aprenderá acerca de los enumeraciones avanzados, introducción a la programación funcional, protocolos, genéricos y más. Aprende Swift con Bob.
