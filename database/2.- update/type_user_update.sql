delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Eliminar tipo de usuario        */
/*  name        |   type_user_update                */
/*  parameters  |   in tu_id integer                */
/*                  in tu_name varchar(100)         */
/*  call        |   call type_user_update(0, '')    */
/****************************************************/
create procedure type_user_update(in tu_id integer, in tu_name varchar(100))
sp_type_user : begin

    declare var_id integer;
    set tu_name = trim(tu_name);
    
    select var_id = id from type_user where id = tu_id;
    
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