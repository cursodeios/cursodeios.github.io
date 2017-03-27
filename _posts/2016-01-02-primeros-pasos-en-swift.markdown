---
layout: post
title:  "Primeros pasos en Swift"
date:   2017-01-01 10:20:00
categories: iOS Swift
---

Para comenzar a aprender Swift vamos a utilizar un **Playground** que es una herramienta genial creada por Apple que ya está incluida en XCode.

Comenzamos abriendo XCode y veremos varias opciones, vamos a hacer en click en **Get started with a Playground**, le damos un nombre y seleccionamos un directorio para guardarlo.

![XCode Playground](/assets/images/post/img-2-1.png){:class="img-50"}

Luego tendremos una ventana como la siguiente donde empezaremos a probar Swift:

![Xcode Playground](/assets/images/post/img-2-2.png){:class="img-100"}

Un Playground nos permite escribir codigo y ejecutar inmediatamente para ver el resultado, borremos el contenido y escribamos lo siguiente:

{% highlight swift %}

  import UIKit

  var title = "Bienvenido al curso de iOS"
  print(title)
{% endhighlight %}

Ahora podemos ver al lado derecho la *barra de resultado* y en la parte inferior el *Área de DEBUG* para ver la ejecución de nuestro código. Si no pueden ver la barra en la parte inferior podemos ir al menu de XCode y seleccionar `View\Debug Area\Show Debug Area`

![Xcode Playground](/assets/images/post/img-2-3.png){:class="img-100"}
