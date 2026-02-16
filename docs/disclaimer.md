## Disclaimer: dataset canónico vs exploratorio

- Para reproducir exactamente el libro/clases: usa el **dataset canónico** (cuando esté disponible como export Data Pump).
- Para exploración y variabilidad realista: usa el **generador aleatorio** (`install_random.sql`).

En modo exploratorio, parte de la variabilidad proviene de inserciones descartadas durante la carga al no cumplir restricciones.
Esto es intencionado para favorecer un entorno impredecible.