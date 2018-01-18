/*Plantilla*/

/****************************************************/
/*  author      |   AUTOR                           */
/*  date        |   --/01/2018                      */
/*  description |   Agregar TABLE                   */
/*  name        |   TABLE_new                       */
/*  parameters  |   in p_name varchar(100)          */
/*  call        |   call TABLE_new('')          */
/****************************************************/
create procedure TABLE_new(in p_name varchar(100))
sp_TABLE : begin
    set p_name = trim(p_name);

    if p_name = '' or p_name = null or p_name is null then
        select 
            '001' as error,
            'El _______ está vacio' as error_message; 
        leave sp_TABLE;
    end if;
    
    insert into TABLE set 
        name = p_name;
    select 
        '000' as error,
        'Correcto' as error_message; 
end 

delimiter ;;
/****************************************************/
/*  author      |   AUTOR                           */
/*  date        |   --/01/2018                      */
/*  description |   Modificar TABLE       */
/*  name        |   TABLE_update                */
/*  parameters  |   in p_id integer                */
/*                  in p_name varchar(100)         */
/*  call        |   call TABLE_update(0, '')    */
/****************************************************/
create procedure TABLE_update(in p_id integer, in p_name varchar(100))
sp_TABLE : begin

    declare var_id integer;
    set p_name = trim(p_name);
    
    select var_id = id from TABLE where id = tu_id and active = true;
    
    if(p_name = '' or p_name = null or p_name is null) then
        select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_TABLE;
    elseif (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '002' as error,
            'No existe el TABLE' as error_message; 
        leave sp_TABLE;
    end if;
    
    update TABLE set 
        name = p_name
    where id = p_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;
end
;;
delimiter ;;
/****************************************************/
/*  author      |   AUTOR         */
/*  date        |   --/01/2018                      */
/*  description |   Eliminar TABLE        */
/*  name        |   TABLE_delete                */
/*  parameters  |   in p_id integer                */
/*  call        |   call TABLE_delete(0)        */
/****************************************************/
create procedure TABLE_delete(in p_id integer)
sp_TABLE : begin

    declare var_id integer;
    declare var_foreign_key integer;
    
    select var_id = id from TABLE where id = p_id and active = true;
    select var_foreign_key = id from TABLE where id_TABLE = p_id and active = true;
    
    if (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '001' as error,
            'No existe el TABLE' as error_message; 
        leave sp_TABLE;
    elseif (var_foreign_key = 0 or var_foreign_key = null or var_foreign_key is null) then 
         select 
            '002' as error,
            'El TABLE se usa en otro registro' as error_message; 
        leave sp_TABLE;
    end if;
    
    update TABLE set 
        active = false
    where id = p_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;    
end
;;

delimiter ;;
/****************************************************/
/*  author      |   AUTOR         */
/*  date        |   --/01/2018                      */
/*  description |   Consultar TABLE       */
/*  name        |   TABLE_consult               */
/*  parameters  |   in p_id integer                */
/*              |   in p_name varchar(100)         */
/*              |   in p_consult varchar(2)        */
/*  call        |   call                            */
/*                  TABLE_consult(0, '', 'xx')  */
/****************************************************/
create procedure TABLE_consult(in p_id integer, in p_name varchar(100), in p_consult varchar(2))
sp_TABLE : begin
    
    declare    LIST_L1 varchar(2)       default 'L1';
    declare    LIST_L2 varchar(2)       default 'L2';
    declare    CONSULT_L1 varchar(2)    default 'C1';
    declare    CONSTANT_LIKE varchar(1) default '%';

    set p_consult = upper(trim(p_consult));

    if p_consult = LIST_L1 then
        select id, name
        from TABLE
        where active = true;
    elseif p_consult = LIST_L2 then
        select id, name
        from TABLE
        where active = true and
            name like concat(CONSTANT_LIKE, p_name, CONSTANT_LIKE);
    elseif p_consult = CONSULT_L1 then
        select id, name
        from TABLE
        where active = true and
            id = p_id;
    end if;
end
;;