CREATE database groupe3;
use groupe3;

create table utilisateur(
id_util int auto_increment primary key not null,
nom_util varchar (50),
prenom_util varchar (50),
mail_util varchar (50),
password_util varchar (100),
date_inscription_util datetime,
validation_util tinyint (1) default (0)
)Engine=InnoDB;

create table card(
id_card int auto_increment primary key not null,
titre_card varchar (50),
contenu_article text,
id_artiste int not null
)Engine=InnoDB;

create table commentaire (
id_commentaire int auto_increment primary key not null,
nom_commentaire varchar(50),
contenu_commentaire varchar (255),
date_commentaire datetime,
note float 
)Engine=InnoDB;

create table categorie (
id_categorie int auto_increment primary key not null,
nom_categorie varchar (50)
)Engine=InnoDB;


create table artiste(
id_artiste int auto_increment primary key not null,
nom_artiste varchar(50)
)Engine=InnoDB;


create table posseder (
id_card int,
id_categorie int,
primary key(id_card,id_categorie)
)Engine=InnoDB;


create table lire (
id_card int,
id_util int,
primary key (id_card,id_util)
)Engine=InnoDB;

create table commenter (
id_commentaire int,
id_util int,
primary key (id_commentaire,id_util)
)Engine=InnoDB;


alter table posseder
add constraint fk_posseder_categorie
foreign key (id_categorie)
references categorie(id_categorie);

alter table posseder
add constraint fk_posseder_card
foreign key (id_card)
references card(id_card);

alter table lire
add constraint fk_lire_utilisateur
foreign key (id_util)
references utilisateur(id_util);


alter table lire
add constraint fk_lire_card
foreign key (id_card)
references card(id_card);


alter table card
add constraint fk_card_artiste
foreign key (id_artiste)
references artiste(id_artiste);


alter table commenter
add constraint fk_commenter_utilisateur
foreign key (id_util)
references utilisateur(id_util);

alter table commenter
add constraint fk_commenter_commentaire
foreign key (id_commentaire)
references commentaire(id_commentaire);



alter table commentaire
add constraint fk_commentaire_card
foreign key (id_card)
references card(id_card);


alter table commentaire
add column id_card int not null;