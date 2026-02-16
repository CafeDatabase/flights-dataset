set echo off
 
-- NOTE: DBMS_OUTPUT is disabled during bulk load to avoid buffer overflow in SQL*Plus/SQLcl/SQL Developer.
begin
  dbms_output.disable;
end;
/
 
PROMPT Valores para la tabla SEXO
PROMPT *********************************

insert into sexos(id_sexo, cn_sexo) values ('H','Hombre');
insert into sexos(id_sexo, cn_sexo) values ('M','Mujer');
PROMPT Valores para la tabla ESTADOS CIVILES
PROMPT *********************************

insert into estadosciviles(id_ec, cn_ec) values ('SO','Soltero');
insert into estadosciviles(id_ec, cn_ec) values ('SE','Separado');
insert into estadosciviles(id_ec, cn_ec) values ('CA','Casado');
insert into estadosciviles(id_ec, cn_ec) values ('VI','Viudo');
insert into estadosciviles(id_ec, cn_ec) values ('DI','Divorciado');
PROMPT Valores para la tabla CATERING
PROMPT *********************************

insert into catering(id_catering, cn_catering) values ('SI','Incluido en vuelo');
insert into catering(id_catering, cn_catering) values ('NO','No presente en vuelo');
PROMPT Valores para la tabla TIPOS_VUELO
PROMPT *********************************

insert into tipos_vuelo(id_vuelo, cn_vuelo) values ('CHA','Charter');
insert into tipos_vuelo(id_vuelo, cn_vuelo) values ('REG','Regular');
insert into tipos_vuelo(id_vuelo, cn_vuelo) values ('INT','Internacional');
insert into tipos_vuelo(id_vuelo, cn_vuelo) values ('NAC','Nacional');
PROMPT Valores para la tabla COMPANIAS
PROMPT *********************************

insert into companias(id_comp, cn_comp) values ('IBERI','Aurea Air');
insert into companias(id_comp, cn_comp) values ('AIRNS','Northwind Air');
insert into companias(id_comp, cn_comp) values ('AIREU','Blue Meridian Airlines');
insert into companias(id_comp, cn_comp) values ('SPNAI','Skyforge Airways');
insert into companias(id_comp, cn_comp) values ('KLM','Kestrel Air Lines');
insert into companias(id_comp, cn_comp) values ('BRITA','Britannic Skies');
insert into companias(id_comp, cn_comp) values ('ALITA','Altavia Airlines');
insert into companias(id_comp, cn_comp) values ('AIFRA','Aether France Air');
PROMPT Valores para la tabla ESTADOSLABORALES
PROMPT *********************************

insert into estadoslaborales(id_el, cn_el) values ('AC','Activo');
insert into estadoslaborales(id_el, cn_el) values ('IN','Inactivo');
PROMPT Valores para la tabla EDADES
PROMPT *********************************

insert into edades(eda_id, id_edad, rango_edad) values (1,'JUV','Menores de 18 a�os');
insert into edades(eda_id, id_edad, rango_edad) values (2,'ADU','Menores de 50 a�os');
insert into edades(eda_id, id_edad, rango_edad) values (3,'VEJ','Mayores de 50 a�os');
PROMPT Valores para la tabla TIPOS_RESERVAS
PROMPT *********************************

insert into tipos_reservas(id_treserva, cn_treserva) values ('TEL','Telefonica');
insert into tipos_reservas(id_treserva, cn_treserva) values ('INT','Internet');
insert into tipos_reservas(id_treserva, cn_treserva) values ('VEN','Venta directa');
PROMPT Valores para la tabla EMPRESAS_VIAJES
PROMPT *********************************

insert into empresas_viajes(id_emp_viaje, cn_emp_viaje) values ('1','Viajes Aurea');
insert into empresas_viajes(id_emp_viaje, cn_emp_viaje) values ('2','Grupo Northwind Viajes');
insert into empresas_viajes(id_emp_viaje, cn_emp_viaje) values ('3','Meridian Travel');
insert into empresas_viajes(id_emp_viaje, cn_emp_viaje) values ('4','TuriNova');
insert into empresas_viajes(id_emp_viaje, cn_emp_viaje) values ('5','VacayPlan');
PROMPT Valores para la tabla PAISES
PROMPT *********************************

insert into paises(id_pais, cn_pais) values (1,'España');
insert into paises(id_pais, cn_pais) values (2,'Portugal');
insert into paises(id_pais, cn_pais) values (3,'Reino Unido');
insert into paises(id_pais, cn_pais) values (4,'Francia');
insert into paises(id_pais, cn_pais) values (5,'Alemania');
insert into paises(id_pais, cn_pais) values (6,'EEUU');
insert into paises(id_pais, cn_pais) values (7,'Italia');
PROMPT Valores para la tabla CIUDADES
PROMPT *********************************

insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (1,'Barcelona',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (2,'Madrid',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (3,'Valencia',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (4,'Sevilla',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (5,'Pamplona',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (6,'Bilbao',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (7,'Malaga',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (8,'Santa Cruz de Tenerife',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (9,'Palma de Mallorca',1);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (10,'Lisboa',2);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (11,'Madeira',2);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (12,'Londres',3);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (13,'Manchester',3);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (14,'Liverpool',3);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (15,'Essex',3);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (16,'Paris',4);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (17,'Lyon',4);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (18,'Berlin',5);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (19,'Bonn',5);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (20,'Munich',5);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (21,'Washinton',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (22,'Boston',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (23,'Chicago',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (24,'Los Angeles',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (25,'New York',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (26,'Denver',6);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (27,'Florencia',7);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (28,'Roma',7);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (29,'Milan',7);
insert into ciudades(id_ciudad,cn_ciudad,pai_id_pais) values (30,'Venecia',7);
PROMPT Valores para la tabla AEROPUERTOS
PROMPT *********************************
-- España
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('BCN','Josep Tarradellas Barcelona-El Prat Airport',1);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('MAD','Adolfo Suárez Madrid-Barajas Airport',2);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('VLC','Valencia Airport',3);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('SVQ','Seville Airport',4);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('PNA','Pamplona Airport',5);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('BIO','Bilbao Airport',6);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('AGP','Málaga-Costa del Sol Airport',7);
-- Santa Cruz de Tenerife: ciudad ↔ aeropuerto más cercano = Tenerife Norte (TFN)
-- Segundo aeropuerto ficticio "Tenerife Sur"
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('TFN','Tenerife North Airport',8);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('TFS','Tenerife South Airport',8);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('PMI','Palma de Mallorca Airport',9);
-- Portugal
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LIS','Lisbon Airport',10);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('FNC','Madeira Airport',11);
-- Reino Unido
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LHR','Heathrow Airport',12);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LGW','Gatwick Airport',12);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('MAN','Manchester Airport',13);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LPL','Liverpool John Lennon Airport',14);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('STN','London Stansted Airport',15);
-- Francia
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('CDG','Paris Charles de Gaulle Airport',16);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('ORY','Paris Orly Airport',16);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LYS','Lyon-Saint Exupéry Airport',17);
-- Alemania
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('BER','Berlin Brandenburg Airport',18);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('CGN','Cologne Bonn Airport',19);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('MUC','Munich Airport',20);
-- Estados Unidos
-- OJO: Washington tiene 2 aeropuertos típicos (DCA/IAD). El más “de ciudad” suele ser DCA.
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('DCA','Ronald Reagan Washington National Airport',21);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('IAD','Washington Dulles International Airport',21);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('BOS','Logan International Airport',22);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('ORD','O''Hare International Airport',23);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('LAX','Los Angeles International Airport',24);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('JFK','John F. Kennedy International Airport',25);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('DEN','Denver International Airport',26);
-- Italia
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('FLR','Florence Airport',27);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('FCO','Rome Fiumicino Airport',28);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('MXP','Milan Malpensa Airport',29);
insert into aeropuertos(id_aero, cn_aero, ciu_id_ciudad) values ('VCE','Venice Marco Polo Airport',30);

PROMPT Valores para la tabla AGENCIAS (GENERADO)
PROMPT *********************************

insert into agencias (id_agencia, cn_agencia, ciu_id_ciudad, evia_id_emp_viaje)
select
  age_seq.nextval,
  -- Nombre neutro y consistente: <Empresa>-<Ciudad>
  replace(ev.cn_emp_viaje,' ','') || '_' || replace(c.cn_ciudad,' ',''),
  c.id_ciudad,
  ev.id_emp_viaje
from empresas_viajes ev
cross join ciudades c;

commit;

PROMPT Valores para la tabla VUELOS-PLAZAS
PROMPT *************************************

declare


     contador_vuelos number;
     contador_plazas number;
     
     type tipo_aeropuertos is table of aeropuertos%rowtype ;
     type tipo_compania    is table of companias%rowtype ;
     type tipo_tipos_vuelo is table of tipos_vuelo%rowtype ;
     type tipo_catering    is table of catering%rowtype ;
     
     t_aeropuertos tipo_aeropuertos;
     t_compania    tipo_compania;
     t_tipos_vuelo tipo_tipos_vuelo;
     t_catering    tipo_catering;
     
begin
  
     select * 
     bulk collect into t_aeropuertos
     from aeropuertos;
     
     select * 
     bulk collect into t_compania
     from companias;
     
     select * 
     bulk collect into t_tipos_vuelo
     from tipos_vuelo;
     
     select * 
     bulk collect into t_catering
     from catering;
     
     contador_vuelos:=0;
     dbms_random.initialize(NULL);
     
     for x in 1..100000
     loop
--          dbms_output.put_line ('vuelo '||x);  -- disabled
         
         contador_vuelos:=contador_vuelos+1;
          declare
              num_ae number;
              num_co number;
              num_ti number;
              num_ca number;
          
          begin
              num_ae :=t_aeropuertos.count;
              num_co :=t_compania.count;
              num_ti :=t_tipos_vuelo.count;
              num_ca :=t_catering.count;
                    
              insert into vuelos( id_vuelo,
                              fecha_vuelo,
                              detalles,
                              aer_id_aero,
                              aer_id_aero_destino,
                              comp_id_comp,
                              tvue_id_vuelo,
                              cat_id_catering)
             
              values (
                 contador_vuelos,
                 SYSDATE+(dbms_random.value*24),
                 'VUELO'||x,
                 t_aeropuertos((dbms_random.value)*num_ae).id_aero,
                 t_aeropuertos((dbms_random.value)*num_ae).id_aero,
                 t_compania   ((dbms_random.value)*num_co).id_comp,
                 t_tipos_vuelo((dbms_random.value)*num_ti).id_vuelo,
                 t_catering   ((dbms_random.value)*num_ca).id_catering
                 );
     
                 contador_plazas:=0;
                 for y in 1..50
                 loop
--                  dbms_output.put_line ('vuelo '||x);  -- disabled
                        contador_plazas:=contador_plazas+1;
                        begin
                        
                        insert into plazas(pla_id,asiento,vue_id_vuelo)
                        values  ( contador_plazas,
                                  decode(mod(contador_plazas,3),1,'V','P'),
                                  contador_vuelos);
                        exception
                            when others then null;
                        end;
                                  
                 end loop;     
     
          exception
              when others then null;
          end;
     commit;    
     end loop;
     
end;
/


PROMPT Valores para la tabla CLIENTES
PROMPT *************************************

declare

     contador_reservas number;
     reserva number;
     
     type tipo_sexo    is table of sexos%rowtype ;
     type tipo_estado  is table of estadosciviles%rowtype ;
     type tipo_laboral is table of estadoslaborales%rowtype ;
     type tipo_edad    is table of edades%rowtype ;
     type tipo_ciudad  is table of ciudades%rowtype ;

     t_sexo    tipo_sexo;
     t_estado  tipo_estado;
     t_laboral tipo_laboral;
     t_edad    tipo_edad;
     t_ciudad  tipo_ciudad;
                    
begin
     select * 
     bulk collect into t_sexo
     from sexos;
     
     select * 
     bulk collect into t_estado
     from estadosciviles;
     
     select * 
     bulk collect into t_laboral
     from estadoslaborales;
     
     select * 
     bulk collect into t_edad
     from edades;

     select * 
     bulk collect into t_ciudad
     from ciudades;

     contador_reservas:=0;
     reserva :=0;
                  
     for x in 1..10000
     loop

     dbms_random.initialize(x);          
          declare
             num_se number;
             num_es number;
             num_la number;
             num_ed number;
             num_ci number;
             
             v_nif varchar2(10);
             v_sexo   number;
             v_estado number;
             v_laboral number;
             v_edad   number;
             v_ciudad number;
          
          begin
             num_se :=t_sexo.count;
             num_es :=t_estado.count;
             num_la :=t_laboral.count;
             num_ed :=t_edad.count;
             num_ci :=t_ciudad.count;

             v_nif := round(dbms_random.value*100000000)||'-'||chr(65+(mod((dbms_random.value*1000000),25)));
             v_sexo    :=trunc((dbms_random.value)*num_se)+1;
             v_estado  :=trunc((dbms_random.value)*num_es)+1;
             v_laboral  :=trunc((dbms_random.value)*num_la)+1;
             v_edad    :=trunc((dbms_random.value)*num_ed)+1;
             v_ciudad  :=trunc((dbms_random.value)*num_ci)+1;
             
             insert into clientes( nif,
                                    nombre,
                                    apellidos,
                                    sex_id_sexo,
                                    ec_id_ec,
                                    el_id_el,
                                    eda_eda_id,
                                    ciu_id_ciudad)
              
             values (
                 v_nif,
                 'Nombre'||x,
                 'Apellido'||x||' Apellido'||x,
                 t_sexo   (v_sexo).id_sexo,
                 t_estado (v_estado).id_ec,
                 t_laboral(v_laboral).id_el,
                 t_edad   (v_edad).eda_id,
                 t_ciudad (v_ciudad).id_ciudad
                 );
                 
             reserva:=round(dbms_random.value);
          exception
              when others then 
                  declare
                      v_error varchar2(500);
                  begin
                      v_error :=substr(sqlerrm,1,500);
                  end;
          end;
     commit;    
     end loop;
     
end;
/


PROMPT Valores para la tabla RESERVAS
PROMPT *************************************

declare

     contador_reservas number;
     reserva number;
     
     type tipo_tres    is table of tipos_reservas%rowtype ;
     type tipo_agencia is table of agencias%rowtype ;

     t_tres    tipo_tres;
     t_agencia tipo_agencia;

     
     num_tr number;
     num_ag number;

     v_nif varchar2(10);
               
begin
--      dbms_output.enable(100000);  -- disabled
     
     select * 
     bulk collect into t_tres
     from tipos_reservas;
 
     select * 
     bulk collect into t_agencia
     from agencias;

     contador_reservas:=0;
     reserva :=0;
           
     num_tr :=t_tres.count;
     num_ag :=t_agencia.count;

     for y in (select rownum fila, nif from clientes) 
     loop           
 
           dbms_random.initialize(y.fila);     
           for z in 1..30
           loop        
                   declare
                              v_reserva varchar2(10):='';
                              v_plaza number:=((dbms_random.value)*50)+1;
                              v_vuelo number:=((dbms_random.value)*100000)+1;
                   begin
      
                              for x in 1..10 
                              loop
                                     v_reserva:=v_reserva||chr(65+
                                                 (mod((dbms_random.value*100000000),41)));
                              end loop;
                              insert into reservas(id_reserva,
                                                importe,
                                                cli_nif,
                                                trs_id_treserva,
                                                age_id_agencia,
                                                pla_id_plaza,
                                                vue_id_vuelo)
                              values              ( v_reserva,
                                            round((dbms_random.value*100)+100,2),
                                            y.nif,
                                            t_tres(trunc(mod(dbms_random.value*1000000,num_tr)+1)).id_treserva,
                                            t_agencia(trunc(mod(dbms_random.value*1000000,num_ag)+1)).id_agencia,
                                            v_plaza,
                                            v_vuelo
                                          );
                              commit;
      
                   exception
                      when others then 
                        declare
                            v_error varchar2(500);
                        begin
                            v_error :=substr(sqlerrm,1,500);
                        end;
                   end;
           end loop;
           commit;    
      end loop;
     
end;
/
