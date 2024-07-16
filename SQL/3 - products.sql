--Таблица товаров
create table store.products (
	id_product serial primary key,
	id_group   serial references store.product_groups(id_group),
	name       varchar(1000),
	create_user varchar(100) default user,
	create_dt   date         default current_date,
	delete_user varchar(100) default null,
	delete_dt   date         default null);

--Получить список товаров
create or replace function store.pkg_products_get_list()
returns table(id_product   integer,
			  product_name text)
as $$
begin
	return query 
		select 
			p.id_product,
			pg.name || ': ' || p.name as product_name
		from store.products p
			inner join store.product_groups pg
				on p.id_group = pg.id_group
		where p.delete_dt is null
			and pg.delete_dt is null;
end;
$$ language plpgsql;

--Получить список товаров для детальной вью
create or replace function store.pkg_products_detail_get_list(p_id_group integer)
returns table(id_product integer,
			  id_group integer,
			   name        varchar(1000))
as $$
begin
	return query 
		select 
			p.id_product,
			p.id_group,
			p.name
		from store.products p
		where p.delete_dt is null
			and p.id_group = p_id_group;
end;
$$ language plpgsql;

--Добавить товар
create or replace procedure store.pkg_products_add(p_id_group integer,
													p_name     varchar(1000)) 
language plpgsql
as $$
begin
	insert into store.products(id_group,
								name)
	values (p_id_group,
			p_name);
end;
$$;

--Изменить товар
create or replace procedure store.pkg_products_edit(p_id_product integer,
													 p_name     varchar(1000)) 
language plpgsql
as $$
begin
	update store.products
	set name = p_name
	where id_product = p_id_product;
end;
$$;

--Полная очистка товара
create or replace procedure store.pkg_products_delete(p_id_product integer) 
language plpgsql
as $$
begin
	--Очистили ценники товаров 
	update store.product_prices
	set delete_user = user,
		delete_dt = current_date
	where id_product = p_id_product;

	--Удалили товар
	update store.products
	set delete_user = user,
		delete_dt = current_date
	where id_product = p_id_product;
end;
$$;	