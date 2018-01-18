delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Agregar tipo de usuario         */
/*  name        |   status_inventory_new            */
/*  parameters  |   in si_name varchar(100)         */
/*  call        |   call status_inventory_new('')   */
/****************************************************/
create procedure status_inventory_new(in si_name varchar(100))
sp_status : begin
	set si_name = trim(si_name);

    if si_name = '' or si_name = null or si_name is null then
    	select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_status;
    end if;
    
	insert into status_inventory set 
    	name = si_name;
    select 
    	'000' as error,
        'Correcto' as error_message;
end

;;