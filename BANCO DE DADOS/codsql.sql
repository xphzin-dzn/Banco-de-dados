create table empresa(
    nome varchar(100) not null,
    endereco varchar (100) not null ,
    cnpj char(14) not null,
    primary key (cnpj)
);

create table cliente(
    nome varchar(100) not null,
    endereco varchar (100) not null,
    cpfcnpj varchar(14) not null,
    primary key (cpfcnpj)
) ;
create table operador(
    codigo int not null,
    nome varchar(100) not null
);
create table produto(
    codigo int not null,
    descricao varchar (100) not null,
    unidade varchar (100) noy null,
    preco real not null default 0 check (preco>=0),
    imposto rea7l not null default 0 check (imposto>=0)
);
create table notafiscal(
  nserie char(5) not null,
  data date default current_date, 
);
create table item(

);