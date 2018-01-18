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