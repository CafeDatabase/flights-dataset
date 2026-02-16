create or replace procedure load_customers is
 
 
      contador_reservas number;
      reserva number;
      
      type tipo_gender    is table of GENDERS%rowtype ;
      type tipo_ms        is table of MARITAL_STATUS%rowtype ;
      type tipo_es        is table of EMPLOYMENT_STATUS%rowtype ;
      type tipo_age       is table of AGE_GROUPS%rowtype ;
      type tipo_city      is table of CITIES%rowtype ;
      
      t_gender    tipo_gender;
      t_ms        tipo_ms;
      t_es        tipo_es;
      t_age       tipo_age;
      t_city      tipo_city;
                     
 begin
 
      select * 
      bulk collect into t_gender
      from GENDERS;
      
      select * 
      bulk collect into t_ms
      from MARITAL_STATUS;
      
      select * 
      bulk collect into t_es
      from EMPLOYMENT_STATUS;
      
      select * 
      bulk collect into t_age
      from AGE_GROUPS;
 
      select * 
      bulk collect into t_city
      from CITIES;
 
      contador_reservas:=0;
      reserva :=0;
                   
      for x in 1..10000
      loop
 
      dbms_random.initialize(x);          
           declare
              num_gend number;
              num_ms   number;
              num_es   number;
              num_age  number;
              num_city number;
              
              v_nif varchar2(10);
              v_gender number;
              v_ms     number;
              v_es     number;
              v_age    number;
              v_city   number;
           
           begin
              num_gend :=t_gender.count;
              num_ms   :=t_ms.count;
              num_es   :=t_es.count;
              num_age  :=t_age.count;
              num_city :=t_city.count;
 
              v_nif := round(dbms_random.value*100000000)||'-'||chr(65+(mod((dbms_random.value*1000000),25)));
              v_gender  :=trunc((dbms_random.value)*num_gend)+1;
              v_ms      :=trunc((dbms_random.value)*num_ms)+1;
              v_es      :=trunc((dbms_random.value)*num_es)+1;
              v_age     :=trunc((dbms_random.value)*num_age)+1;
              v_city    :=trunc((dbms_random.value)*num_city)+1;
              
              insert into CUSTOMERS( NIF,
                                     NAME,
                                     LASTNAME,
                                     GEND_ID_GENDER,
                                     MS_ID_MS,
                                     ES_ID_ES,
                                     AGE_AGE_ID,
                                     CITY_ID_CITY)
               
              values (
                  v_nif,
                  'Name'||x,
                  'Lastname'||x||' Lastname'||x,
                  t_gender (v_gender).ID_GENDER,
                  t_ms     (v_ms).ID_MS,
                  t_es     (v_es).ID_ES,
                  t_age    (v_age).AGE_ID,
                  t_city   (v_city).ID_CITY
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
      
 end load_customers;
 /
