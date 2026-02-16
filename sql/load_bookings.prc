create or replace procedure load_bookings is
 
      contador_reservas number;
      reserva number;
      
      type tipo_bt      is table of BOOKING_TYPES%rowtype ;
      type tipo_agency  is table of AGENCIES%rowtype ;
 
      t_bt     tipo_bt;
      t_agency tipo_agency;
 
      
      num_bt number;
      num_ag number;
 
      v_nif varchar2(10);
                
 begin
--      dbms_output.enable(100000);  -- disabled
      
      select * 
      bulk collect into t_bt
      from BOOKING_TYPES;
  
      select * 
      bulk collect into t_agency
      from AGENCIES;
 
      contador_reservas:=0;
      reserva :=0;
            
      num_bt :=t_bt.count;
      num_ag :=t_agency.count;
 
      for y in (select rownum fila, NIF from CUSTOMERS) 
      loop           
  
            dbms_random.initialize(y.fila);     
            for z in 1..30
            loop        
                    declare
                               v_reserva varchar2(10):='';
                               v_seat    number:=((dbms_random.value)*50)+1;
                               v_flight  number:=((dbms_random.value)*100000)+1;
                    begin
       
                               for x in 1..10 
                               loop
                                      v_reserva:=v_reserva||chr(65+
                                                  (mod((dbms_random.value*100000000),41)));
                               end loop;
                               insert into BOOKINGS(ID_BOOKING,
                                                 PRICE,
                                                 CUST_NIF,
                                                 BT_ID_BOOKING_TYPE,
                                                 AGENCY_ID_AGENCY,
                                                 SEAT_ID_SEAT,
                                                 FLIGHT_ID_FLIGHT)
                               values              ( v_reserva,
                                             round((dbms_random.value*100)+100,2),
                                             y.nif,
                                             t_bt(trunc(mod(dbms_random.value*1000000,num_bt)+1)).ID_BOOKING_TYPE,
                                             t_agency(trunc(mod(dbms_random.value*1000000,num_ag)+1)).ID_AGENCY,
                                             v_seat,
                                             v_flight
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
      
 end load_bookings;
 /
