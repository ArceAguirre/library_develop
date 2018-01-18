delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Agregar usuario                 */
/*  name        |   user_codice_new                 */
/*  parameters  |   in p_name varchar(100)          */
/*				|	in p_password varchar(40)		*/
/*				|	p_id_type_user					*/
/*  call        |   call user_codice_new('', '', 0) */
/****************************************************/
create procedure user_codice_new(in p_name varchar(100), in p_password varchar(40), in p_id_type_user integer)
sp_user_codice : begin
    
    declare var_id_type_user integer;
    
    set p_name = trim(p_name);
	set p_password = sha(p_password);
    
    select var_id_type_user = id from type_user where id = p_id_type_user and active = true;
    
    if p_name = '' or p_name = null or p_name is null then
        select 
            '001' as error,
            'El nombre está vacio' as error_message;
        leave sp_user_codice;
    elseif p_password = '' or p_password = null or p_password is null then
    	select 
            '002' as error,
            'La contraseña está vacia' as error_message;
        leave sp_user_codice;
    elseif var_id_type_user = '' or var_id_type_user = null or var_id_type_user is null then
    	select 
            '003' as error,
            'No existe el tipo de usuario' as error_message;
        leave sp_user_codice;
    end if;
    
    insert into user_codice set 
        name = p_name,
        password = p_password,
        id_type_user = p_id_type_user;
    select 
        '000' as error,
        'Correcto' as error_message; 
end 
;;

delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Modificar usuario               */
/*  name        |   user_codice_update              */
/*  parameters  |   in p_id integer                 */
/*                  in p_name varchar(100)          */
/*  call        |   call user_codice_update(0, '')  */
/****************************************************/
create procedure user_codice_update(in p_id integer, in p_name varchar(100), in p_password_old varchar(40), in p_password_new varchar(40), in p_id_type_user integer)
sp_user_codice : begin

    declare var_id integer;
    declare var_id_type_user integer;
    declare var_password integer;
    
    set p_name = trim(p_name);
    set p_password_old = sha(p_password_old);
    set p_password_new = sha(p_password_new);
    
    select var_id = id from user_codic where id = tu_id and active = true;
    select var_id_type_user = id from type_user where id = p_id_type_user and active = true;
    select var_password = id from user_codice where password = p_password_old and id = p_id;
    
    if(p_name = '' or p_name = null or p_name is null) then
        select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_user_codice;
    elseif (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '002' as error,
            'No existe el usuario' as error_message; 
        leave sp_user_codice;
    elseif p_password_old = p_password_new then 
        select 
            '003' as error,
            'La contraseña no debe ser la misma' as error_message; 
        leave sp_user_codice;
    elseif var_id_type_user = '' or var_id_type_user = null or var_id_type_user is null then
        select 
            '004' as error,
            'No existe el tipo de usuario' as error_message;
        leave sp_user_codice;
    elseif var_password = '' or var_password = null or var_password is null then
        select 
            '005' as error,
            'No tienes permisos para modificar el usuario' as error_message;
        leave sp_user_codice;
    end if;
    
    update user_codic set 
        name = p_name,
        password = p_password_new,
        id_type_user = p_id_type_user
    where id = p_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;
end
;;

delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Eliminar usuario                */
/*  name        |   user_codice_delete              */
/*  parameters  |   in p_id integer                 */
/*  call        |   call user_codice_delete(0)      */
/****************************************************/
create procedure user_codice_delete(in p_id integer)
sp_user_codice : begin

    declare var_id integer;
    select var_id = id from user_codice where id = p_id and active = true;
    
    if (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '001' as error,
            'No existe el usuario' as error_message; 
        leave sp_user_codice;
    end if;
    
    update user_codice set 
        active = false
    where id = p_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;    
end
;;
delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Consultar usuario               */
/*  name        |   user_codice_consult             */
/*  parameters  |   in p_id integer                 */
/*              |   in p_name varchar(100)          */
/*              |   in p_consult varchar(2)         */
/*  call        |   call                            */
/*                  user_codice_consult(0, '', 'xx')*/
/****************************************************/
create procedure user_codice_consult(in p_id integer, in p_name varchar(100), in p_password varchar(40), in p_consult varchar(2))
sp_user_codice : begin
    
    declare    LIST_L1 varchar(2)       default 'L1';
    declare    LIST_L2 varchar(2)       default 'L2';
    declare    CONSULT_L1 varchar(2)    default 'C1';
    declare    CONSTANT_LIKE varchar(1) default '%';

    set p_consult = upper(trim(p_consult));

    if p_consult = LIST_L1 then
        select uc.id, uc.name, 
            tu.id, tu.name
        from user_codice uc
        inner join type_user tu 
            on tu.id = uc.id_type_user
        where active = true;
        
    elseif p_consult = LIST_L2 then
        select uc.id, uc.name, 
            tu.id, tu.name
        from user_codice
        inner join type_user tu 
            on tu.id = uc.id_type_user
        where active = true and
            name like concat(CONSTANT_LIKE, p_name, CONSTANT_LIKE);
    elseif p_consult = CONSULT_L1 then
         select uc.id, uc.name, 
            tu.id, tu.name
        from user_codice
        inner join type_user tu 
            on tu.id = uc.id_type_user
        where active = true and
            id = p_id;
    end if;
end
;;