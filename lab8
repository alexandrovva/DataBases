create index title on film(title);              --1

create index first_last on customer(first_name, last_name);             --2

create unique index duration_length on film(rental_duration, length);                --3

create index subst_index on customer(substring(first_name from 1 for 3));            --4

create index join_index on rental(rental_date);                 --5

select tablename as table_name, indexname as index_name from pg_indexes;              --6
