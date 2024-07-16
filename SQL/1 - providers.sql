--Таблица поставщиков
create table store.providers (
	id_provider serial       primary key,
	name        varchar(1000),
	create_user varchar(100) default user,
	create_dt   date         default current_date,
	delete_user varchar(100) default null,
	delete_dt   date         default null);

--Получение списка поставщиков
create or replace function store.pkg_providers_get_list()
returns table(id_provider integer,
			   name        varchar(1000))
as $$
begin
	return query 
		select 
			p.id_provider,
			p.name
		from store.providers p
		where p.delete_dt is null;
end;
$$ language plpgsql;

--Добавление поставщика
create or replace procedure store.pkg_providers_add(p_name varchar(1000)) 
language plpgsql
as $$
begin
	insert into store.providers(name)
	values (p_name);
end;
$$;

--Редактирование поставщика
create or replace procedure store.pkg_providers_edit(p_id_provider integer, 
													  p_name varchar(1000)) 
language plpgsql
as $$
begin
	update store.providers
	set name = p_name
	where id_provider = p_id_provider;
end;
$$;

--Полная очистка данных поставщика
create or replace procedure store.pkg_providers_delete(p_id_provider integer) 
language plpgsql
as $$
begin
	--Очистили ценники поставщика
	update store.product_prices
	set delete_user = user,
		delete_dt = current_date
	where id_provider = p_id_provider;

	--Удалили поставщика
	update store.providers
	set delete_user = user,
		delete_dt = current_date
	where id_provider = p_id_provider;
end;
$$;

--Получить список поставщиков на дату
create or replace function store.pkg_providers_by_dt_get_list(p_dt date)
returns table(id_provider integer,
			   name        varchar(1000))
as $$
begin
	return query 
		select distinct
			p.id_provider,
			p.name
		from store.product_prices pp
			inner join store.providers p
				on pp.id_provider = p.id_provider
		where p.delete_dt is null
			and p_dt between pp.begin_dt and coalesce(pp.end_dt, current_date);
end;
$$ language plpgsql;