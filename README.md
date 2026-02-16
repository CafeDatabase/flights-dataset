# VUELOS–RESERVAS dataset (Café Database)

Este repositorio contiene el **modelo VUELOS–RESERVAS** usado como base de ejemplos para *Optimización SQL en Oracle*.

## Dos vías

### 1) Dataset canónico (reproducir libro/clases)

- **Objetivo:** reproducibilidad (mismos resultados que el libro/clases).
- **Estado:** el artefacto canónico (p. ej. `expdp/impdp`) se añadirá cuando se publique como export Data Pump.

### 2) Dataset exploratorio (aleatorio)

- **Objetivo:** variabilidad realista. La carga admite rechazos silenciosos por diseño para mantener un escenario impredecible.
- **Uso:** ideal para experimentar y encontrar (o no) patrones emergentes, como en entornos reales.

## Instalación (exploratorio)

1. Crear usuario (ejemplo):

```sql
create user vuelos identified by vuelos default tablespace users quota unlimited on users;
grant connect, resource to vuelos;
```

2. Ejecutar el instalador (SQL*Plus / SQLcl):

```sql
@sql/install.sql
```

El script ejecuta:
- creación de objetos (`02_create_objects.sql`)
- carga aleatoria (`03_load_random.sql`)
- validación mínima (`04_validate.sql`)

## Validación

El validador produce **OK / WARN / FAIL**.
- **FAIL:** rehacer carga.
- **WARN:** dataset utilizable, pero puede limitar algunos ejemplos (volumen/distribución).

Umbral acordado: `VUELOS >= 30.000`.
