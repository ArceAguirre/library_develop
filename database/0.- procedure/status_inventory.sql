delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Agregar estatus del libro       */
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

delimiter;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Modificar estatus del libro     */
/*  name        |   status_inventory_update         */
/*  parameters  |   in tu_id integer                */
/*                  in tu_name varchar(100)         */
/*  call        |   call type_user_update(0, '')    */
/****************************************************/
create procedure status_inventory_update(in si_id integer, in si_name varchar(100))
sp_status : begin

    declare var_id integer;
    set si_name = trim(si_name);
    
    select var_id = id from status_inventory where id = si_id and active = true;
    
    if(si_name = '' or si_name = null or si_name is null) then
        select 
            '001' as error,
            'El nombre está vacio' as error_message; 
        leave sp_status;
    elseif (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '002' as error,
            'No existe el tipo de usuario' as error_message; 
        leave sp_status;
    end if;
    
    update status_inventory set 
        name = si_name
    where id = si_id;
    
    select 
        '000' as error,
        'Correcto' as error_message;
end
;;
delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   18/01/2018                      */
/*  description |   Eliminar estatus de libro       */
/*  name        |   status_inventory_delete         */
/*  parameters  |   in p_id integer                 */
/*  call        |   call status_inventory_delete(0) */
/****************************************************/
create procedure status_inventory_delete(in p_id integer)
sp_status : begin

    declare var_id integer;
    declare var_foreign_key integer;
    
    select var_id = id from status_inventory where id = p_id and active = true;
    select var_foreign_key = id from inventory where id_status_inventory = p_id and active = true;
    
    if (var_id = 0 or var_id = null or var_id is null) then 
        select 
            '001' as error,
            'No existe el estatus del inventario' as error_message; 
        leave sp_status;
    elseif (var_foreign_key <> 0 or var_foreign_key <> null or var_foreign_key is not null) then 
         select 
            '002' as error,
            'El  estatus de inventario se usa en otro registro' as error_message; 
        leave sp_status;
    end if;
    
    update status_inventory set 
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
/*  description |   Consultar estado de libro       */
/*  name        |   status_inventory_consult        */
/*  parameters  |   in p_id integer                 */
/*              |   in p_name varchar(100)          */
/*              |   in p_consult varchar(2)         */
/*  call        |   call status_inventory_consult   */
/*                  (0, '', 'xx')                   */
/****************************************************/
create procedure status_inventory_consult(in p_id integer, in p_name varchar(100), in p_consult varchar(2))
sp_status : begin
    
    declare    LIST_L1 varchar(2)       default 'L1';
    declare    LIST_L2 varchar(2)       default 'L2';
    declare    CONSULT_L1 varchar(2)    default 'C1';
    declare    CONSTANT_LIKE varchar(1) default '%';

    set p_consult = upper(trim(p_consult));

    if p_consult = LIST_L1 then
        select id, name
        from status_inventory
        where active = true;
    elseif p_consult = LIST_L2 then
        select id, name
        from status_inventory
        where active = true and
            name like concat(CONSTANT_LIKE, p_name, CONSTANT_LIKE);
    elseif p_consult = CONSULT_L1 then
        select id, name
        from status_inventory
        where active = true and
            id = p_id;
    end if;
end
;;  