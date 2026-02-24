# Adminer DataPlay Themes

Una colección de temas CSS minimalistas para Adminer configurables mediante las
variables predefinidas en los archivos de theme importados para cambiar la
apariencia modificando solo esas variables y facilitando la creación de nuevos
temas.

## Archivo principal: `adminer.css`

Este es el archivo principal que configura la interfaz de Adminer con las siguientes características:

### 1) Imports de fuentes y tema

Carga fuentes y un tema activo (Cream por defecto). Todos los temas disponibles:

| theme          | mode  | filepath                                 |
| -------------- | ----- | ---------------------------------------- |
| Cream          | light | `themes/assets/theme-cream.css`          |
| Let It Snow    | light | `themes/assets/theme-let-it-snow.css`    |
| Black is Black | dark  | `themes/assets/theme-black-is-black.css` |
| Purple Rain    | dark  | `themes/assets/theme-purple-rain.css`    |

### 2) Reset y variables globales

- Define `box-sizing: border-box` global
- Usa variables CSS para colores, tipografías y bordes
- Variables globales html para bg, fg, dim, lit

### 3) Layout global

- **Selector de idioma (#lang)**: Posicionado absolutamente, padding específico
- **Encabezados (h1, h2)**: Color acento, box-shadow, border-radius
- **Version badge**: Estilo redondeado (9999px), posicionado con transform
- **Logo (#logo)**: Filter personalizable vía variable
- **Breadcrumb**: Margin, box-shadow, color acento
- **Logout**: Transform y box-shadow específicos

### 4) Enlaces

- Colores personalizables vía variables
- Hover con color acento
- Estado active con subrayado y font-weight 500
- Text-transform: lowercase

### 5) Tablas

- **Filas alternadas**: Estilos diferentes para filas impares (odd) y pares (even) usando colores primario y secundario
- **Tipografía de datatable**:
  - Permite usar una tipografía diferente para los datos en las tablas (comúnmente monospace)
  - Configurable vía variables `--theme-datatable-font` y `--theme-datatable-font-size`
- **Ajuste de white-space**:
  - Por defecto Adminer usa `pre` para todas las columnas, dificultando la legibilidad de valores extensos
  - La variable `--theme-datatable-whitespace` permite configurar el comportamiento según preferencia

### 6) Formularios

- **Inputs, selects, buttons**: Estilos personalizados con colores heredados
- **Focus**: Outline de color acento, border-color transparente
- **Submit buttons**: Box-shadow, background secundario, hover con color acento
- **Checkboxes y radios custom**:
  - appearance: none
  - SVG checkmark integrado
  - Estados checked con background y border del color de enlace

### 7) Otros elementos

- Mensajes de formulario con bordes
- Área SQL con fondo secundario y padding

## Uso rápido

```bash
# Iniciar Adminer con Docker
make up

# Detener servicios
make down

# Reiniciar servicios
make restart

# Reconstruir contenedores
make rebuild
```

Al iniciar con `make up`, Adminer estará disponible en `http://localhost:8080`
y habrá dos bases de datos de muestra disponibles `test_db`, una para MySQL y
otra para PostgreSQL.

Para acceder, en el formulario de login:

- **system**: MySQL/MariaDB | PostgreSQL
- **server**: mysql | pgsql (contenedores docker)
- **username**: root
- **password**: root
- **database**: test_db (o dejar en blanco y seleccionar luego)

### Cambiar y personalizar el tema activo

Para cambiar el tema activo, edita `themes/adminer.css` y descomenta el
`@import` correspondiente al tema preferido:

```css
/* edit and set your font preferences */
@import url('./assets/fonts.css');

/* uncomment your favorite theme */
@import url('./assets/theme-black-is-black.css');
/* @import url('./assets/theme-cream.css'); */
/* @import url('./assets/theme-let-it-snow.css'); */
/* @import url('./assets/theme-purple-rain.css'); */
```

Luego recarga la página

### Configurar fuentes

Para usar otras fuentes tipográficas, edita `themes/assets/fonts.css` y carga
fuentes de Google Fonts u otro proveedor.

```css
@import url("https://fonts.googleapis.com/css2?family=Tu-Fuente:wght@400;500;700&display=swap");
```

Luego, configura las **variables CSS:**

| Variable                      | Descripción                                       |
| ----------------------------- | ------------------------------------------------- |
| `--theme-font-primary`        | Tipografía general de la interfaz                 |
| `--theme-font-size-primary`   | Tamaño por defecto                                |
| `--theme-datatable-font`      | Tipografía para datos en tablas  (inherit u otra) |
| `--theme-datatable-font-size` | Tamaño por defecto (inherit u otro)               |

Ejemplo de configuración:

```css
:root {
    --theme-font-primary: 'Saira', sans-serif;
    --theme-font-datatable: 'Sometype Mono', monospace;
}
```

## Estructura del proyecto

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

## Requisitos

- Docker
- Docker Compose

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
