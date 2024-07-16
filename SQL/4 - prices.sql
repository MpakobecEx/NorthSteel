--Таблица цен на товар
create table store.product_prices (
	id_price    serial  primary key,
	id_provider serial  references store.providers(id_provider),
	id_product  serial  references store.products(id_product),
	price       numeric not null,
	begin_dt    date    not null,
	end_dt      date,
	create_user varchar(100) default user,
	create_dt   date default current_date,
	delete_user varchar(100) default null,
	delete_dt   date         default null);

--Получить список цен
create or replace function store.pkg_product_prices_get_list()
returns table(id_price integer,
			  id_provider integer,
			  id_product integer,
			  price numeric,
			  begin_dt date,
			  end_dt date)
as $$
begin
	return query 
		select 
			pp.id_price,
			pp.id_provider,
			pp.id_product,
			pp.price,
			pp.begin_dt,
			pp.end_dt
		from store.product_prices pp
		where pp.delete_dt is null;
end;
$$ language plpgsql;

--Добавить ценник
create or replace procedure store.pkg_product_prices_add(p_id_provider integer,
								                          p_id_product  integer,
								                          p_price       numeric,
								                          p_begin_dt    date,
								                          p_end_dt      date) 
language plpgsql
as $$
begin
	insert into store.product_prices (id_provider,
									   id_product,
									   price,
									   begin_dt,
									   end_dt)
	values (p_id_provider,
			p_id_product,
			p_price,
			p_begin_dt,
			p_end_dt);
end;
$$;

--Изменили ценник
create or replace procedure store.pkg_product_prices_edit(p_id_price    integer,
														   p_id_provider integer,
								                           p_id_product  integer,
								                           p_price       numeric,
								                           p_begin_dt    date,
								                           p_end_dt      date) 
language plpgsql
as $$
begin
	update store.product_prices 
	set id_provider = p_id_provider,
		id_product = p_id_product,
		price = p_price,
		begin_dt = p_begin_dt,
		end_dt = p_end_dt
	where id_price = p_id_price;

	commit;
end;
$$;

--Удалили ценник
create or replace procedure store.pkg_product_prices_delete(p_id_price integer) 
language plpgsql
as $$
begin
	update store.product_prices
	set delete_user = user,
		delete_dt = current_date
	where id_price = p_id_price;
end;
$$;

--Получить список ценников поставщика на дату
create or replace function store.pkg_prices_provider_get_list(p_id_provider integer,
														       p_dt date)
returns table(id_product integer,
			  product_name text,
			  price numeric)
as $$
begin
	return query 
		select 
			pp.id_product,
			pg.name || ': ' || p.name product_name,
			pp.price
		from store.product_prices pp
			inner join store.products p
				on pp.id_product = p.id_product
			inner join store.product_groups pg
				on p.id_group = pg.id_group
		where pp.delete_dt is null
			and id_provider = p_id_provider
			and p_dt between pp.begin_dt and coalesce(pp.end_dt, current_date);
end;
$$ language plpgsql;