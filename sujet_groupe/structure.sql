create database bibli;
use bibli;

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

create table livre_audio (
id_livre_audio int auto_increment primary key not null,
nom_livre varchar(50) not null,
url_livre varchar(100) not null,
description_livre text not null,
date_livre datetime not null
)Engine=InnoDB;

create table categorie (
id_cat int auto_increment primary key not null,
nom_cat varchar(50) not null
)Engine=InnoDB;

create table image (
id_image int auto_increment primary key not null,
url_image varchar(100) not null
)Engine=InnoDB;

alter table livre_audio
add column id_image int not null;

create table lire (
id_util int not null,
id_livre_audio int not null,
primary key (id_util, id_livre_audio),
note int null,
commentaire text null,
date_des_trucs datetime not null
)Engine=InnoDB;

create table Favoriser (
id_util int not null,
id_livre_audio int not null,
primary key (id_util, id_livre_audio)
)Engine=InnoDB;

create table attribuer (
id_cat int not null,
id_livre_audio int not null,
primary key (id_cat, id_livre_audio)
)Engine=InnoDB;

alter table utilisateur
add constraint fk_representer_image
foreign key (id_image)
references image(id_image);

alter table utilisateur
add constraint fk_grader_type_utilisateur
foreign key (id_type_util)
references type_utilisateur(id_type_util);

alter table favoriser
add constraint fk_favoriser_utilisateur
foreign key (id_util)
references utilisateur(id_util);

alter table favoriser
add constraint fk_favoriser_livre_audio
foreign key (id_livre_audio)
references livre_audio(id_livre_audio);

alter table livre_audio
add constraint fk_illustrer_image
foreign key (id_image)
references image(id_image);

alter table attribuer
add constraint fk_attibuer_livre_audio
foreign key (id_livre_audio)
references livre_audio(id_livre_audio);

alter table attribuer
add constraint fk_attibuer_categorie
foreign key (id_cat)
references categorie(id_cat);

alter table lire
add constraint fk_lire_livre_audio
foreign key (id_livre_audio)
references livre_audio(id_livre_audio);

alter table lire
add constraint fk_lire_utilisateur
foreign key (id_util)
references utilisateur(id_util);