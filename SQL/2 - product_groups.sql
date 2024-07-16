--Группы товаров
create table store.product_groups (
	id_group    serial       primary key,
	name        varchar(1000),
	create_user varchar(100) default user,
	create_dt   date         default current_date,
	delete_user varchar(100) default null,
	delete_dt   date         default null);

--Получение списка группы товаров
create or replace function store.pkg_product_groups_get_list()
returns table(id_group integer,
			   name        varchar(1000))
as $$
begin
	return query 
		select 
			pg.id_group,
			pg.name
		from store.product_groups pg
		where pg.delete_dt is null;
end;
$$ language plpgsql;

--Добавление группы товаров
create or replace procedure store.pkg_product_groups_add(p_name varchar(1000)) 
language plpgsql
as $$
begin
	insert into store.product_groups(name)
	values (p_name);
end;
$$;

--Редактирование группы товаров
create or replace procedure store.pkg_product_groups_edit(p_id_group integer,
														   p_name varchar(1000)) 
language plpgsql
as $$
begin
	update store.product_groups
	set name = p_name
	where id_group = p_id_group;
end;
$$;

--Полная очистка группы товаров
create or replace procedure store.pkg_product_groups_delete(p_id_group integer) 
language plpgsql
as $$
begin
	--Очистили ценники группы товаров
	update store.product_prices
	set delete_user = user,
		delete_dt = current_date
	where id_product in (select id_product 
						 from store.products 
						 where id_group = p_id_group);

	--Очистили товары группы товаров
	update store.products
	set delete_user = user,
		delete_dt = current_date
	where id_group = p_id_group;

	--Удалили группу товаров
	update store.product_groups
	set delete_user = user,
		delete_dt = current_date
	where id_group = p_id_group;
end;
$$;
