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
                       
          create table VENDEDOR1 (NUMERO_VENDEDOR integer, NOMBRE_VENDEDOR VARCHAR2(80),AREA_VENTAS varchar2(80),
                                 constraint pk_n1_ven primary key (NUMERO_VENDEDOR));
                                
          
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
    
    
              BEGIN
             guardar_clicente(325,321,'Alejandra');
              END;
              /
              select * from CLIENTE;
    CREATE OR REPLACE PROCEDURE guardar_vendedor(MY_NUMERO_VENDEDOR IN integer, MY_NOMBRE_VENDEDOR IN VARCHAR2,MY_AREA_VENTAS IN varchar2)
    AS
    BEGIN
    INSERT INTO VENDEDOR1 VALUES (MY_NUMERO_VENDEDOR, MY_NOMBRE_VENDEDOR,MY_AREA_VENTAS  );
 end;
    /
    
    CREATE SEQUENCE SEC_VENTAS
     START WITH 1
     INCREMENT BY 1
     NOMAXVALUE;
     
    -- CREATE OR REPLACE PROCEDURE guardar_ventas (MY_ID_VENTAS in integer, MY_NUMERO_CLIENTE IN integer, MY_NUMERO_VENDEDOR IN integer,MY_MONTO_VENTAS IN float)
    
    
    
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
     --probar el procedimiento
     DECLARE
     VALOR INTEGER;
     BEGIN
    guardar_calificaciones (VALOR,'SEÑALES',9);
     END;
     /
     SELECT * FROM CALIFICACIONES;
     
     --EJEMPLO CURSOR EXPLICITO CON LA TABLA CALIFICACIONES
     DECLARE
     CURSOR CUR_CALF IS SELECT*FROM CALIFICACIONES;
     BEGIN
     FOR REC IN CUR_CALF LOOP
     DBMS_OUTPUT.PUT_LINE('CALIFICACION '||REC.VALOR||' MATERIA ' ||REC.MATERIA);
     END LOOP;
     END;
     /
     SET SERVEROUTPUT ON;