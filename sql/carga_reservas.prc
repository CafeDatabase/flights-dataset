create or replace procedure carga_reservas is

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
     dbms_output.enable(100000);
     
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
     
end carga_reservas;
/
