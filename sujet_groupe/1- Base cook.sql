CREATE table utilisateur(
id_util int auto_increment primary key not null,
nom_util varchar (50) not null,
prenom_util varchar (50) not null,
mail_util varchar (50) not null,
pseudo_util varchar (50) not null,
password_util varchar (50) not null,
date_inscription_util DATETIME not null,
valid_util tinyint (1) default (0),
id_role int,
id_image int,
id_commentaire int
)Engine=InnoDB;


CREATE table image(
id_image int auto_increment primary key not null,
nom_image varchar (50),
url_image varchar (100),
id_recette int
)Engine=InnoDB;

CREATE table recette (
id_recette int auto_increment primary key not null,
titre_recette varchar (50),
contenu_recette TEXT 
)Engine=InnoDB;

CREATE table categorie (
id_categorie int auto_increment primary key not null,
nom_categorie varchar (50)

)Engine=InnoDB;

DROP table categorie;

CREATE table commentaire(
id_commentaire int auto_increment primary key not null,
contenu_commentaire varchar (50),
date_commentaire DATETIME
)Engine=InnoDB;


CREATE table role(
id_role int auto_increment primary key not null,
nom_role varchar (50)
)Engine=InnoDB;


CREATE table lire(
id_recette int,
id_util int,
primary key (id_recette,id_util)
)Engine=InnoDB;


CREATE table entrer(
id_recette int,
id_categorie int,
primary key (id_recette,id_categorie)
)Engine=InnoDB;


CREATE table aggrementer(
id_recette int,
id_commentaire int,
primary key (id_recette,id_commentaire)
)Engine=InnoDB;


alter table aggrementer
add constraint fk_aggrementer_commentaire
foreign key (id_commentaire)
references commentaire(id_commentaire);


alter table aggrementer
add constraint fk_aggrementer_recette
foreign key (id_recette)
references recette(id_recette);


alter table entrer
add constraint fk_entrer_recette
foreign key (id_recette)
references recette(id_recette);

alter table entrer
add constraint fk_entrer_categorie
foreign key (id_categorie)
references categorie(id_categorie);


alter table lire
add constraint fk_lire_recette
foreign key (id_recette)
references recette(id_recette);


alter table lire
add constraint fk_lire_utilisateur
foreign key (id_util)
references utilisateur(id_util);


alter table utilisateur
add constraint fk_posseder_role
foreign key (id_role)
references role(id_role);

alter table utilisateur
add constraint fk_appliquer_image
foreign key (id_image)
references image(id_image);


alter table utilisateur
add constraint fk_ecrire_commentaire
foreign key (id_commentaire)
references commentaire(id_commentaire);