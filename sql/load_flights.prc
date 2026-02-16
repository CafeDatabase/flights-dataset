create or replace procedure load_flights is
 
 
      contador_vuelos number;
      contador_plazas number;
      
      type tipo_airport    is table of AIRPORTS%rowtype ;
      type tipo_airline    is table of AIRLINES%rowtype ;
      type tipo_flight_type is table of FLIGHT_TYPES%rowtype ;
      type tipo_catering   is table of CATERING%rowtype ;
      
      t_airport     tipo_airport;
      t_airline     tipo_airline;
      t_flight_type tipo_flight_type;
      t_catering    tipo_catering;
      
 begin
   
      select * 
      bulk collect into t_airport
      from AIRPORTS;
      
      select * 
      bulk collect into t_airline
      from AIRLINES;
      
      select * 
      bulk collect into t_flight_type
      from FLIGHT_TYPES;
      
      select * 
      bulk collect into t_catering
      from CATERING;
      
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
               v_capacity number;
           
           begin
               num_ae :=t_airport.count;
               num_co :=t_airline.count;
               num_ti :=t_flight_type.count;
               num_ca :=t_catering.count;
               
               -- Random capacity (50, 60, 100, 120)
               -- We use mod 4 to pick one
               case trunc(dbms_random.value(0,4))
                 when 0 then v_capacity := 50;
                 when 1 then v_capacity := 60;
                 when 2 then v_capacity := 100;
                 else v_capacity := 120;
               end case;
                     
               insert into FLIGHTS( ID_FLIGHT,
                               FLIGHT_DATE,
                               DETAILS,
                               AIRP_ID_AIRPORT_ORIGIN,
                               AIRP_ID_AIRPORT_DEST,
                               AIRL_ID_AIRLINE,
                               FT_ID_FLIGHT_TYPE,
                               CAT_ID_CATERING,
                               AIRCRAFT_CAPACITY)
              
               values (
                  contador_vuelos,
                  SYSDATE+(dbms_random.value*24),
                  'FLIGHT'||x,
                  t_airport    ((dbms_random.value)*num_ae).ID_AIRPORT,
                  t_airport    ((dbms_random.value)*num_ae).ID_AIRPORT,
                  t_airline    ((dbms_random.value)*num_co).ID_AIRLINE,
                  t_flight_type((dbms_random.value)*num_ti).ID_FLIGHT_TYPE,
                  t_catering   ((dbms_random.value)*num_ca).ID_CATERING,
                  v_capacity
                  );
      
                  contador_plazas:=0;
                  for y in 1..v_capacity
                  loop
--                  dbms_output.put_line ('vuelo '||x);  -- disabled
                         contador_plazas:=contador_plazas+1;
                         begin
                         
                         insert into SEATS(SEAT_ID, SEAT_LOC, FLIGHT_ID_FLIGHT)
                         values  ( contador_plazas,
                                   decode(mod(contador_plazas,3),1,'W','A'), -- Window / Aisle
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
      
 end load_flights;
 /
