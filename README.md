# estacion_de_despaletizado_vision_robotica
Trabajo de fin de máster. Diseño de una estación de despaletizado mediante un sistema de visión robótica

![Memoria del trabajo](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/Memoria.pdf)

![](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/A3.jpg)

# Resumen
En esta memoria se detalla el desarrollo de un proyecto piloto de una estación de
despaletizado de tablas de madera mediante visión robótica en la sede de Santiago de
Compostela de la empresa Financiera Maderera S.A. (FINSA). El diseño de la estación está
orientado a un lugar concreto en la fábrica donde actualmente esta tarea se realiza de forma
manual. Para poder hacer un buen diseño, fue necesario hacer un estudio de cómo se trabaja
actualmente en dicha estación, que necesidades tiene y cómo es su entorno.
Conocida la problemática, se procedió al diseño de la arquitectura, estando compuesta por 3
sistemas bien diferenciados, y sensores y actuadores auxiliares. Estos 3 sistemas son: el sistema
de gobierno, dirigido por un procesador lógico programable (PLC); el sistema de visión
artificial; y el robótico. Estos 3 sistemas se comunican entre sí, estando dirigidos por el PLC.
El siguiente paso fue definir la secuencia de operaciones. Se diseñó la aplicación para que
pudiese funcionar con cualquier medida de tabla. Cuando el PLC lo ordena, el sistema de visión
artificial reconoce las tablas de un nivel del palé, calculando sus centros y orientaciones, y envía
la información al PLC. Con los datos del sistema de visión y de los demás sensores, el PLC le da
la orden al robot de ir retirando las tablas, enviándole los datos necesarios para ello. Este
procedimiento se repite nivel tras nivel hasta completar el palé.
A continuación, se eligieron las tecnologías y herramientas que conforman la estación. Esta
elección se hizo teniendo en cuenta no solo las necesidades de este proyecto, sino también el
presupuesto disponible, y las necesidades y familiaridades con proveedores de la fábrica. Se
decidió utilizar tecnología 2D para el sistema de visión y un sensor de distancia para obtener los
datos de profundidad, y que tanto este sensor como la cámara fuesen solidarios a la garra del
robot. También se decidió extraer las piezas mediante el uso de una garra de vacío por tener las
tablas un acabado superficial lo suficientemente liso y ser poco porosas.
Elegidas las herramientas, se hizo el diseño de la estructura de unión entre la garra de vacío,
la cámara, el sensor de distancia y la muñeca del robot. Se realizaron varios diseños, priorizando
diferentes factores y pensados para diferentes métodos de fabricación, decidiendo finalmente
realizar la estructura con fabricación 3D y diseñándola para que facilitase las tareas de
calibración y redujese los tiempos de ciclo.
A continuación, se procedió a la programación de los 3 sistemas. El primer objetivo fue
conseguir el reconocimiento de las tablas. Para ello se probaron diferentes algoritmos hasta
decidir usar un algoritmo de crecimiento de región (Region Growing). Lograda la localización de
las tablas, se programaron los otros 2 sistemas y se comprobaron sus funcionamientos por
separado de forma virtual.
Una vez las herramientas llegaron a fábrica, se procedió al montaje de la estación en el
laboratorio. En este punto se configuraron las comunicaciones entre los sistemas. Se hicieron las
calibraciones de las herramientas del robot y de la conversión a magnitudes físicas del sistema de
visión, y se ajustaron los parámetros de la cámara y la colocación de la iluminación. También se
realizaron ajustes en los programas, necesarios para el correcto funcionamiento del conjunto.
Finalmente, se realizaron pruebas con el fin de valorar la precisión y el tiempo de ciclo de la
estación de visión robótica.

# Imágenes del diseño de la garra
![](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/imagenes_garra/ingeniero.PNG)
![](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/imagenes_garra/union_camara.PNG)
![](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/imagenes_garra/brida.PNG)
![](https://github.com/Daniel22L/estacion_de_despaletizado_vision_robotica/blob/main/Documentos/imagenes_garra/union_ventosa.PNG)
