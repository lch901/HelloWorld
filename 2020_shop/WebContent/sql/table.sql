create t_admin(
	i_admin number primary key,
	mid nvarchar2(30) not null,
	mpw nvarchar2(50) not null,
	nm nvarchar2(10) not null
);