#PORHACER B4: Debido a que la Glyphicons no se usa en Bootstrap V4 debeo mantener ls scss de la version 3.3.7 que fueron aportados al clonar rails 5 con devise, cuando se instaló. Están formando parte de gem 'bootstrap-sass', '3.3.7' que se instaló en la gema ruby 2.3.0 del rvm. No cambiar la versión de bootstrap para usar la nueva pila de heroku 16, porque requiere actualizar todas las gemas que son muchas y están en .rvm/gems ruby 2.3.0. Para ellos usar esa gem bootstrap-sass 3.3.7 directriz en el Gemile para poder usar @import desde el application.scss en app/assets/stylesheet. El import se saca de assets/bootstrap/_custom.scss que tienen todo lo que se puede importar con respecto a la versión 3.3.7
#PORHACER B4: Como tengo el addendum con Boostrap 4 también podría intentar copiar todos los componnentes scss de la version 4 e instalarlos en otro directorio. De esta forma puedo hacer la transición a V4
#PORHACER B4: Al importar los navbar de la versión V4 podría usar menues que se colapsan de acuerdo al tamaño de la pantalla. Así es como funcionan. El V3 es necesario cambiar variables son LESSS para cambiar el punto de break si no le gusta. Puedo dejar el menu entonces con la version 3, porque tengo iconos pero debeo conformame con los puntos de rutpura.
#PORHACER B4= render '/layouts/search' carga un control asociado a un script de jekyll para hacer búsquedas de texto en active record en formao json, no queda bien en la barra de menues, porque usa un formato inline de la versión 4. Porque lo copié de ahí. Necesito ver si es necesario cambiar el control. Dado que se ha reemplazado .navbar-form por .form-inline debo hacer lo contrario. Usar utilidades de margen como sea neceario
#PORHACER B4 Tengo un sidebawr de V4 que no puedo preservar porque en V3 no hay offset. Creo que puedo usar .pull-left. Si no funciona, usaré el ejemplo de HART que ocupa divisione y secciones. Creo que es de bootstrap 2
#PORHACER B4 Al encontrar la solución para el sidebar debo actualizar el generador correspondiente

