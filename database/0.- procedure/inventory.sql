delimiter ;;
/****************************************************/
/*  author      |   Arcelia Aguirre Treviño         */
/*  date        |   19/01/2018                      */
/*  description |   Agregar inventario              */
/*  name        |   inventory_new                   */
/*  parameters  |   in p_name varchar(100)          */
/*  call        |   call inventory_new('')          */
/****************************************************/
create procedure inventory_new(in p_type varchar(100), p_code varchar(20), p_classification varchar(100), p_copy int(10),
     p_volume varchar(100), p_bibid varchar(100), p_title varchar(255), p_author varchar(100), p_editorial varchar(255), p_edition varchar(100),
	 p_year year(4), p_description varchar(255), p_ref bit(1), p_id_status_inventory int(11))
sp_inventory : begin
	
    declare var_id_status_inventory int(11);
    declare var_code varchar(20);
    
    set p_type = trim(p_type);
    set p_code = trim(p_code);
    set p_classification = trim(p_classification);
    set p_volume = trim(p_bibid);
    set p_bibid = trim(p_bibid);
    set p_title = trim(p_title);
    set p_author = trim(p_author);
    set p_editorial = trim(p_editorial);
    set p_edition = trim(p_edition);
    set p_description = trim(p_description);
    
    select var_id_status_inventory = id from status_inventory where id = p_id_status_inventory and active = true;
    select var_code = id from inventory where code = p_code and active = true;

    if p_type = '' or p_type = null or p_type is null then
        select 
            '001' as error,
            'El tipo está vacio' as error_message; 
        leave sp_inventory;
    elseif p_code = '' or p_code = null or p_code is null then
        select 
            '002' as error,
            'El código está vacio' as error_message; 
        leave sp_inventory;
    elseif p_classification = '' or p_classification = null or p_classification is null then
        select 
            '003' as error,
            'La clasificación está vacía' as error_message; 
        leave sp_inventory;
    elseif p_volume = '' or p_volume = null or p_volume is null then
        select 
            '004' as error,
            'El volumen está vacio' as error_message; 
        leave sp_inventory;
    elseif p_ref = '' or p_ref = null or p_ref is null then
        select 
            '005' as error,
            'El ref está vacio' as error_message; 
        leave sp_inventory;
    elseif p_bibid = '' or p_bibid = null or p_bibid is null then
        select 
            '006' as error,
            'El bibid está vacio' as error_message; 
        leave sp_inventory;
    elseif var_id_status_inventory = 0 or var_id_status_inventory = '' or var_id_status_inventory = null or var_id_status_inventory is null then
        select 
            '007' as error,
            'El estatus de libro está vacio' as error_message; 
        leave sp_inventory;
    elseif p_title = '' or p_title = null or p_title is null then
        select 
            '008' as error,
            'El título está vacio' as error_message; 
        leave sp_inventory;
    elseif p_author = '' or p_author = null or p_author is null then
        select 
            '009' as error,
            'El autor está vacio' as error_message; 
        leave sp_inventory;
    elseif p_editorial = '' or p_editorial = null or p_editorial is null then
        select 
            '010' as error,
            'La editorial está vacia' as error_message; 
        leave sp_inventory;
    elseif p_edition = '' or p_edition = null or p_edition is null then
        select 
            '011' as error,
            'La edición está vacia' as error_message; 
        leave sp_inventory;
    elseif p_description = '' or p_description = null or p_description is null then
        select 
            '012' as error,
            'La descripción está vacia' as error_message; 
        leave sp_inventory;
    elseif p_copy = '' or p_copy = null or p_copy is null then
        select 
            '013' as error,
            'El número de cópia está vacío' as error_message; 
        leave sp_inventory;
    elseif p_year = '' or p_year = null or p_year is null then
        select 
            '014' as error,
            'El año está vacio' as error_message; 
        leave sp_inventory;
     elseif var_code = 0 or var_code = '' or var_code = null or var_code is null then
        select 
            '015' as error,
            'El código ya existe' as error_message; 
        leave sp_inventory;
    end if;
    
    insert into inventory set 
        name = p_name;
    select 
        '000' as error,
        'Correcto' as error_message; 
end 
;;