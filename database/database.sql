create table type_user(
    id integer primary key auto_increment not null,
    name varchar(100) not null,
    created_at date,
    updated_at timestamp,
    active boolean not null default true
)