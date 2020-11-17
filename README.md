# README
## Software de Fiscalía
Version de Rails: 2.6.5\
Para instalar la aplicación se deben ingresar por consola los siguientes comandos:
1. `rvm use 2.6.5`
2. `rails db:create`
3. `rails db:migrate`
4. `rails s`

## Crear usuarios
Se pueden crear administradores, fiscales y carabineros.

### Administradores
Solo se pueden crear meditante el uso de consola.
Estos requieren el siguiente formato: `email;nombre;contraseña;rut;cargo`\
Por ejemplo: `admin1@admin.com;Admin1 Name;admin_password;0.000.000-1;Admin`

1. Cargar datos de administradores como csv en `app/assets/Administradores`
2. `lib/taks/create_user.rake` cambiar el nombre del archivo al que corresponda. 
3. En consola ejecutar `rake create_user:admin`

### Fiscales
Solo lo puede hacer un administrador a través de la aplicación.

### Carabineros
Solo lo puede hacer un administrador a través de la aplicación.

## Cargar bases de datos
Se pueden agregar bases de datos en formato CSV de la siguiente manera:

### Para cargar Marcas:
El archivo debe estar en el siguiente formato: `codigo_marca;descripcion_marca`.\
Por ejemplo: `306;FALSO TEST, PERJURIO O DEN.CALUM. ART.206,209,210,211 Y 212`

1. Agregar archivo csv al directorio app/assets/Marcas/
2. En `lib/taks/load_csv.rake` cambiar el nombre del archivo al que corresponda. 
A modo de ejemplo se incluye un csv llamado `datos.csv` que contiene una muestra
del total de Marcas.
3. En consola ejecutar `rake cargar_csv:marcas`.
