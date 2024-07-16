--Таблица заголовка поставки
create table store.supplie_heads (
	id_supply    serial       primary key,
	id_provider  serial       references store.providers(id_provider),
	dt           date         not null,
	create_user  varchar(100) default user,
	create_dt    date         default current_date,
	delete_user  varchar(100) default null,
	delete_dt    date         default null);

--Таблица спецификаций поставки	
create table store.supplie_tails (
	id_supply_tail serial   primary key,
	id_supply      serial   references store.supplie_heads(id_supply),
	id_product     serial   references stosre.products(id_product),
	amount         numeric  not null,
	price          numeric  not null);

--Получить список поставок
create or replace function store.pkg_supplies_get_report_head(p_dt_begin date,
															   p_dt_end date)
returns table(id_supply integer,
			  id_provider integer,
			  name_provider varchar(1000),
			  dt date,
			  summa numeric)
as $$
begin
	return query 
		select 
			s.id_supply,
			s.id_provider,
			p.name name_provider,
			s.dt,
			sum(st.price * st.amount) summa
		from store.supplie_heads s
			inner join store.supplie_tails st
				on s.id_supply = st.id_supply
			inner join store.providers p
				on s.id_provider = p.id_provider
		where s.delete_dt is null
			and (p_dt_begin is null or s.dt >= p_dt_begin)
			and (p_dt_end is null or s.dt <= p_dt_end)
		group by 
			s.id_supply,
			s.id_provider,
			p.name,
			s.dt;
end;
$$ language plpgsql;

--Получить список спецификаций поставки
create or replace function store.pkg_supplies_get_report_tail(p_id_supply integer)
returns table(id_supply integer,
			  id_product integer,
			  name_product varchar(1000),
			  id_group integer,
			  name_group varchar(1000),
			  price numeric,
			  amount numeric,
			  summa numeric)
as $$
begin
	return query 
		select 
			s.id_supply,
			s.id_product,
			p.name name_product,
			p.id_group,
			pg.name name_group,
			s.price,
			s.amount,
			s.price * s.amount summa
		from store.supplie_tails s
			inner join store.products p
				on s.id_product = p.id_product
			inner join store.product_groups pg
				on p.id_group = pg.id_group
		where s.id_supply = p_id_supply;
end;
$$ language plpgsql;

--Добавили заголовок поставки
create or replace function store.pkg_supplies_add_head(p_id_provider integer,
													  p_dt date)
returns integer
as $$
declare 
	v_id_supply integer;
begin
	insert into store.supplie_heads(id_provider,
								     dt)
	values (p_id_provider,
			p_dt)
	returning id_supply into v_id_supply;

return v_id_supply;
end;
$$ language plpgsql;

--Добавили спецификацию поставки
create or replace procedure store.pkg_supplies_add_tail(p_id_supply integer,
													   p_id_product integer,
													   p_amount numeric,
													   p_price numeric) 
language plpgsql
as $$
begin
	insert into store.supplie_tails(id_supply,
									 id_product,
									 amount,
									 price)
	values (p_id_supply,
			p_id_product,
			p_amount,
			p_price);
end;
$$;

--Удалили поставку
create or replace procedure store.pkg_supplies_delete(p_id_supply integer) 
language plpgsql
as $$
begin
	update store.supplie_heads
	set delete_user = user,
		delete_dt = current_date
	where id_supply = p_id_supply;
end;
$$;