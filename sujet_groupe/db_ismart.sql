create database ismart;
use ismart;

create table utilisateur(
id_utilisateur int primary key auto_increment not null,
nom_util varchar(50) not null,
prenom_util varchar(50) not null,
pseudo_util varchar(50) not null,
mail_util varchar(50) not null,
mdp_util varchar(100) not null,
description_util text not null,
id_type_utilisateur int not null
)Engine=InnoDB;

create table dessin(
id_dessin int primary key auto_increment not null,
dessin varchar(50) not null,
description text not null,
id_utilisateur int not null
)Engine=InnoDB;

create table type_utilisateur(
nom_type_util varchar(50) not null,
id_type_utilisateur int not null,
primary key(id_type_utilisateur)
)Engine=InnoDB;

create table commenter(
id_utilisateur int not null,
id_dessin int not null,
commentaire varchar(255) not null,
note float not null,
date_commentaire datetime not null
)Engine=InnoDB;

create table appartenir(
id_dessin int not null,
id_categories int not null,
primary key(id_dessin,id_categories)
)Engine=InnoDB;

create table categories(
id_categories int primary key auto_increment not null,
nom_cat varchar(50)
)Engine=InnoDB;

alter table commenter
add constraint fk_commenter_utilisateur
foreign key(id_utilisateur)
references utilisateur(id_utilisateur);

alter table commenter
add constraint fk_commenter_dessin
foreign key(id_dessin)
references dessin(id_dessin);

alter table appartenir
add constraint fk_appartenir_dessin
foreign key(id_dessin)
references dessin(id_dessin);

alter table appartenir
add constraint fk_appartenir_categories
foreign key(id_categories)
references categories(id_categories);

alter table dessin
add constraint fk_ajouter_utilisateur
foreign key(id_utilisateur)
references utilisateur(id_utilisateur);

alter table utilisateur
add constraint fk_associer_type_utilisateur
foreign key(id_type_utilisateur)
references type_utilisateur(id_type_utilisateur);