delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Eliminar tipo de usuario        */
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
    	name = tu_name
    select 
    	'000' as error,
        'Correcto' as error_message 
end 
;;