
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   17/01/2018                      */
/*  description |   Agregar tipo de usuario         */
/*  name        |   type_user_new                   */
/*  parameters  |   in tu_name varchar(100)         */
/*  call        |   call type_user_new('')          */
/****************************************************/
create procedure type_user_new(in tu_name varchar(100))
sp_type_user : begin
	set tu_name = trim(tu_name);

    if tu_name = '' or tu_name = null or tu_name is null then
    	select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_type_user;
    end if;
    
	insert into type_user set 
    	name = tu_name;
    select 
    	'000' as error,
        'Correcto' as error_message; 
end 

delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   17/01/2018                      */
/*  description |   Modificar tipo de usuario       */
/*  name        |   type_user_update                */
/*  parameters  |   in tu_id integer                */
/*                  in tu_name varchar(100)         */
/*  call        |   call type_user_update(0, '')    */
/****************************************************/
create procedure type_user_update(in tu_id integer, in tu_name varchar(100))
sp_type_user : begin

    declare var_id integer;
    set tu_name = trim(tu_name);
    
    select var_id = id from type_user where id = tu_id and active = true;
    
    if(tu_name = '' or tu_name = null or tu_name is null) then
        select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_type_user;
    elseif (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '002' as error,
            'No existe el tipo de usuario' as error_message; 
        leave sp_type_user;
    end if;
    
    update type_user set 
        name = tu_name
    where id = tu_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;
end
;;

delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Eliminar tipo de usuario        */
/*  name        |   type_user_delete                */
/*  parameters  |   in tu_id integer                */
/*  call        |   call type_user_delete(0)        */
/****************************************************/
create procedure type_user_delete(in tu_id integer)
sp_type_user : begin

    declare var_id integer;
    declare var_foreign_key integer;
    
    select var_id = id from type_user where id = tu_id and active = true;
    select var_foreign_key = id from user_codice where id_type_user = tu_id and active = true;
    
    if (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '001' as error,
            'No existe el tipo de usuario' as error_message; 
        leave sp_type_user;
    elseif (var_foreign_key = 0 or var_foreign_key = null or var_foreign_key is null) then 
         select 
            '002' as error,
            'El tipo de usuario está ' as error_message; 
        leave sp_type_user;
    end if;
    
    update type_user set 
        active = false
    where id = tu_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;    
end
;;

delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Consultar tipo de usuario       */
/*  name        |   type_user_consult               */
/*  parameters  |   in tu_id integer                */
/*              |   in tu_name varchar(100)         */
/*              |   in tu_consult varchar(2)        */
/*  call        |   call                            */
/*                  type_user_consult(0, '', 'xx')  */
/****************************************************/
create procedure type_user_consult(in tu_id integer, in tu_name varchar(100), in tu_consult varchar(2))
sp_type_user : begin
    
    declare    LIST_L1 varchar(2)       default 'L1';
    declare    LIST_L2 varchar(2)       default 'L2';
    declare    CONSULT_L1 varchar(2)    default 'C1';
    declare    CONSTANT_LIKE varchar(1) default '%';

    set tu_consult = upper(trim(tu_consult));

    if tu_consult = LIST_L1 then
        select id, name
        from type_user
        where active = true;
    elseif tu_consult = LIST_L2 then
        select id, name
        from type_user
        where active = true and
            name like concat(CONSTANT_LIKE, tu_name, CONSTANT_LIKE);
    elseif tu_consult = CONSULT_L1 then
        select id, name
        from type_user
        where active = true and
            id = tu_id;
    end if;
end