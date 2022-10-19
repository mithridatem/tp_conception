create database recette;
use recette;

create table type_utilisateur (
id_type_util int auto_increment primary key not null,
nom_type_util varchar(50) not null
)Engine=InnoDB;

create table utilisateur (
id_util int auto_increment primary key not null,
nom_util varchar(50) not null,
prenom_util varchar(50) not null,
mail_util varchar(50) not null,
mdp_util varchar(50) not null,
id_image int not null,
id_type_util int not null
)Engine=InnoDB;

create table recette (
id_recette int auto_increment primary key not null,
nom_recette varchar(50) not null,
description_recette text not null,
date_recette datetime not null,
id_image int not null
)Engine=InnoDB;

create table categorie (
id_cat int auto_increment primary key not null,
nom_cat varchar(50) not null
)Engine=InnoDB;

create table image (
id_image int auto_increment primary key not null,
url_image varchar(100) not null
)Engine=InnoDB;

create table lire (
id_util int not null,
id_recette int not null,
primary key (id_util, id_recette),
commentaire text null,
date_des_trucs datetime not null
)Engine=InnoDB;

create table attribuer (
id_cat int not null,
id_recette int not null,
primary key (id_cat, id_recette)
)Engine=InnoDB;

alter table utilisateur
add constraint fk_representer_image
foreign key (id_image)
references image(id_image);

alter table utilisateur
add constraint fk_grader_type_utilisateur
foreign key (id_type_util)
references type_utilisateur(id_type_util);

alter table recette
add constraint fk_illustrer_image
foreign key (id_image)
references image(id_image);

alter table attribuer
add constraint fk_attibuer_recette
foreign key (id_recette)
references recette(id_recette);

alter table attribuer
add constraint fk_attibuer_categorie
foreign key (id_cat)
references categorie(id_cat);

alter table lire
add constraint fk_lire_recette
foreign key (id_recette)
references recette(id_recette);

alter table lire
add constraint fk_lire_utilisateur
foreign key (id_util)
references utilisateur(id_util);