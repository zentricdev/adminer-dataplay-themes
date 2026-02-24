## Características de adminer.css

Esta hoja de estilos personaliza la interfaz de Adminer con las siguientes características:

### 1. Imports de temas

Carga fuentes y un tema activo (Snow Patrol por defecto), con otros disponibles pero comentados:
- theme-cream.css
- theme-snow-patrol.css (activo)
- theme-black-is-black.css
- theme-deep-purple.css

### 2. Reset y variables globales

- Define `box-sizing: border-box` global
- Usa variables CSS para colores, tipografías y bordes
- Variables globales html para bg, fg, dim, lit

### 3. Layout global

- **Selector de idioma (#lang)**: Posicionado absolutamente, padding específico
- **Encabezados (h1, h2)**: Color acento, box-shadow, border-radius
- **Version badge**: Estilo redondeado (9999px), posicionado con transform
- **Logo (#logo)**: Filter personalizable vía variable
- **Breadcrumb**: Margin, box-shadow, color acento
- **Logout**: Transform y box-shadow específicos

### 4. Enlaces

- Colores personalizables vía variables
- Hover con color acento
- Estado active con subrayado y font-weight 500
- Text-transform: lowercase

### 5. Tablas

- **Filas alternadas**: Estilos diferentes para filas impares (odd) y pares (even) usando colores primario y secundario
- **Tipografía de datatable**:
  - Permite usar una tipografía diferente para los datos en las tablas (comúnmente monospace)
  - Configurable vía variables `--theme-datatable-font` y `--theme-datatable-font-size`
- **Ajuste de white-space**:
  - Por defecto Adminer usa `pre` para todas las columnas, dificultando la legibilidad de valores extensos
  - La variable `--theme-datatable-whitespace` permite configurar el comportamiento según preferencia

### 6. Formularios

- **Inputs, selects, buttons**: Estilos personalizados con colores heredados
- **Focus**: Outline de color acento, border-color transparente
- **Submit buttons**: Box-shadow, background secundario, hover con color acento
- **Checkboxes y radios custom**:
  - appearance: none
  - SVG checkmark integrado
  - Estados checked con background y border del color de enlace

### 7. Otros elementos

- Mensajes de formulario con bordes
- Área SQL con fondo secundario y padding

### Nota importante

El tema depende fuertemente de **variables CSS** (`--theme-*`) definidas en los archivos de theme importados. Esto permite cambiar toda la apariencia modificando solo esas variables, facilitando la creación de nuevos temas.
