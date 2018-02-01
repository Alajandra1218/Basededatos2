 --generamos la primera tabla
        create table ALMACEN (NUMERO_ALMACEN integer,
                             UBICACION_ALMACEN varchar2(40),
                             constraint pk_NUM_ALM PRIMARY KEY (NUMERO_ALMACEN));
        
        --PROCEDIMIENTO ALMACENADO 
          create or replace procedure guardar_almacen(my_NUMERO_ALMACEN in integer , my__UBICACION_ALMACEN in varchar2)
                  as
                  --VARIABLES LOCALES SI SE NECESITA
                  BEGIN
                  --cuerpo o lógica del procedimiento
              INSERT INTO ALMACEN VALUES(my_NUMERO_ALMACEN, my__UBICACION_ALMACEN);
              END;
          /
            
          --USAREMOS UN BLOQUE PL SQL PARA PROBAR NUESTRO PROCEDIMIETO
          
              BEGIN
              guardar_almacen(321,'Ecatepec');
              END;
              /
              
          SELECT * FROM ALMACEN;
          
          --Probar el procedimiento con NETBEANS