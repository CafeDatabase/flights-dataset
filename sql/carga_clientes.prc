create or replace procedure carga_clientes is


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
     
end carga_clientes;
/
