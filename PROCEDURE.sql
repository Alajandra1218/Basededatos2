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
          create table CLIENTE (NUMERO_CLIENTE integer, NUMERO_ALMACEN integer, nombre_cliete varchar2(80),
                       constraint pk_n_c primary key (NUMERO_CLIENTE),
                       constraint fk_n_a foreign key (NUMERO_ALMACEN) references ALMACEN (NUMERO_ALMACEN));
                       
          create table VENDEDOR (NUMERO_VENDEDOR integer, NOMBRE_VENDEDOR VARCHAR2(80),AREA_VENTAS varchar(80),
                                 constraint pk_n_ven primary key (NUMERO_VENDEDOR));
          
          create table VENTAS (ID_VENTAS integer, NUMERO_CLIENTE integer, NUMERO_VENDEDOR integer, MONTO_VENTAS float,
                              constraint pk_i_v primary key (ID_VENTAS),
                              constraint fk_N_C foreign key (NUMERO_CLIENTE)references CLIENTE (NUMERO_CLIENTE),
                              constraint fk_N_v foreign key (NUMERO_VENDEDOR) references VENDEDOR (NUMERO_VENDEDOR));
                              
         create or replace procedure guardar_clicente(my_NUMERO_CLIENTE in integer,my_NUMERO_ALMACEN in integer,my_nombre_cliete in varchar2)
         
         AS
         BEGIN
         INSERT INTO CLIENTE VALUES (my_NUMERO_CLIENTE,my_NUMERO_ALMACEN,my_nombre_cliete);
    end;
    /
    
     
    
    --ejemplo de una tabla y su procedimiento almacenado para guardar con pk impuesto o artificial
    create table CALIFICACIONES (ID_CALIFICACIONES INTEGER, MATERIA VARCHAR2(80), VALOR float,
     constraint pk_id_cal primary key (ID_CALIFICACIONES));
     
     --generamos una secuencia
     create sequence SEC_CALIFICACIONES
     START WITH 1
     INCREMENT BY 1
     NOMAXVALUE;
     
     --creamos el procedimiento
     create or replace procedure guardar_calificaciones (my_ID_CALIFICACIONES OUT INTEGER, MY_MATERIA IN VARCHAR,MY_VALOR IN FLOAT  )
     AS
     
     BEGIN
     SELECT SEC_CALIFICACIONES.NEXTVAL INTO my_ID_CALIFICACIONES FROM DUAL;
     INSERT INTO CALIFICACIONES VALUES (my_ID_CALIFICACIONES , MY_MATERIA ,MY_VALOR);
     END;
     /
     
                                