create or replace procedure carga_vuelos is


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
         dbms_output.put_line ('vuelo '||x);
         
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
                 dbms_output.put_line ('vuelo '||x);
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
     
end carga_vuelos;
/
