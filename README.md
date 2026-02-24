# Adminer DataPlay Themes

Una colección de temas CSS minimalistas para Adminer personalizables mediante
variables predefinidas.

Usa un tema predefinido o ajusta color y fuentes a tus gustos personales.

## Archivo principal: `adminer.css`

Este es el archivo principal que configura la interfaz de Adminer  con las
siguientes características configurables:

### Selecciona tu tema de color preferido

Todos los temas disponibles:

| Tema                  | Archivo                                  |
| --------------------- | ---------------------------------------- |
| Cream (light)         | `themes/assets/theme-cream.css`          |
| Let It Snow (light)   | `themes/assets/theme-let-it-snow.css`    |
| Black is Black (dark) | `themes/assets/theme-black-is-black.css` |
| Purple Rain (dark)    | `themes/assets/theme-purple-rain.css`    |

Para cambiar el tema activo, edita el archivo `themes/adminer.css` y descomenta
el `@import` según tu preferencia, luego recarga la página

### Configura las fuentes tipográficas

Para usar otras fuentes tipográficas, edita `themes/assets/fonts.css` y carga
fuentes de Google Fonts u otro proveedor, luego, configura las **variables CSS:**

| Variable                          | Uso                                               |
| --------------------------------- | ------------------------------------------------- |
| `--theme-font-primary`            | Tipografía general de la interfaz                 |
| `--theme-font-size-primary`       | Tamaño por defecto                                |
| `--theme-datatable-font`          | Tipografía para datos en tablas  (inherit u otra) |
| `--theme-datatable-font-size`     | Tamaño por defecto (inherit u otro)               |
| `--theme-datatable-white-space`   | Configura white-space en tablas                   |
| `--theme-datatable-overflow-wrap` | Configura overflow-wrap en tablas                 |


Puedes establecer una fuente específica, por ejemplo monospace, para los datos
mostrados en las tablas o bien dejar `inherit` para usar la fuente primaria.
Por defecto Adminer aplica un estilo de `white-space` de tipo `pre` a las celdas
de datos que, a veces, dificulta la legibilidad al hacer que las filas sean
demasiado largas y salgan de la pantalla. Las dos últimas flags sirven
para modificar ese comportamiento (ver capturas de pantalla).

## Inicio rápido con Docker

Si tienes Docker puedes usar las siguientes instrucciones definidas en el
`Makefile`.


```bash
# Iniciar Adminer con Docker
make up

# Detener servicios
make down

# Reiniciar servicios
make restart

# Reconstruir todo - OJO: elimina volúmenes de bases de datos
make rebuild
```

Al iniciar con `make up`, **Adminer** estará disponible en `http://localhost:8080`
y habrá dos bases de datos `acme` disponibles, una en MySQL y otra para
PostgreSQL, con un par de tablas con datos de prueba.

Para acceder, en el formulario de login:

- **system**: `MySQL/MariaDB` | `PostgreSQL`
- **server**: `mysql` | `pgsql` (contenedores docker)
- **username**: `root`
- **password**: `root`
- **database**: `acme` (o dejar en blanco y seleccionar luego)

## Estructura de carpetas

```
.
├── themes/
│   ├── adminer.css
│   └── assets/
│       ├── fonts.css
│       ├── theme-black-is-black.css
│       ├── theme-cream.css
│       ├── theme-let-it-snow.css
│       └── theme-purple-rain.css
├── init/
│   ├── mysql-setup.sql
│   └── pgsql-setup.sql
├── compose.yaml
└── Makefile
```

## Galería

### Black is Black

![Login](schreenshots/black-is-black-login.png)
![Snow Patrol Datatable](schreenshots/black-is-black-datatable.png)
![Show Structure](schreenshots/black-is-black-show-structure.png)
![Alter Table](schreenshots/black-is-black-alter-table.png)
![New Item](schreenshots/black-is-black-new-item.png)

### Cream

![Login](schreenshots/cream-login.png)
![Datatable](schreenshots/cream-datatable.png)
![Show Structure](schreenshots/cream-show-structure.png)
![Alter Table](schreenshots/cream-alter-table.png)
![New Item](schreenshots/cream-new-item.png)

### Purple Rain

![Login](schreenshots/purple-rain-login.png)
![Snow Patrol Datatable](schreenshots/purple-rain-datatable.png)
![Show Structure](schreenshots/purple-rain-show-structure.png)
![Alter Table](schreenshots/purple-rain-alter-table.png)
![New Item](schreenshots/purple-rain-new-item.png)

### Let It Snow

![Login](schreenshots/let-it-snow-login.png)
![Snow Patrol Datatable](schreenshots/let-it-snow-datatable.png)
![Show Structure](schreenshots/let-it-snow-show-structure.png)
![Alter Table](schreenshots/let-it-snow-alter-table.png)
![New Item](schreenshots/let-it-snow-new-item.png)
