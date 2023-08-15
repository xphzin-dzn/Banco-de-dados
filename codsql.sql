drop table item;
drop table notafiscal;
drop table produto;
drop table operador;
drop table cliente;
drop table empresa;


create table empresa(
    nome varchar(100) not null,
    endereco varchar (100) not null,
    cnpj char(14) not null,
    primary key (cnpj)
);

create table cliente(
    nome varchar(100) not null,
    endereco varchar (100) not null,
    cpfcnpj varchar(14) not null,
    primary key (cpfcnpj)
);

create table operador(
    codigo int not null,
    nome varchar(100) not null
);

create table produto(
    codigo int not null,
    descricao varchar (100) not null,
    unidade varchar (100) not null,
    preco real not null default 0 check (preco >= 0),
    imposto real not null default 0 check (imposto >= 0)
);

create table notafiscal(
    nserie char(5) not null,
    data date default current_date check (data <= current_date),
    hora time default current_time,
    empresa char(14) not null,
    cliente varchar(14),
    operador integer not null,
    foreign key (empresa) references empresa(cnpj),
    foreign key (cliente) references cliente(cpfcnpj),
    foreign key (operador) references operador(codigo),
    primary key (nserie)
);

create table item(
    nsequencial integer not null check (nsequencial>0),
    notafiscal char(5) not null,
    produto integer not null,
    quantidade real default 1 (quantidade>0),
    foreign key (notafiscal) references notafiscal(nserie),
    foreign key (produto) references produto (codigo),
    primary key (nsequencial,notafiscal)
);