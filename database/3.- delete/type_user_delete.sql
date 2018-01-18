
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