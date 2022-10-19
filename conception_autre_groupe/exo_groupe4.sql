CREATE DATABASE  bibio;
use bibio;
  -- creation des tables 
  
  
  -- table utilisateur

CREATE TABLE utilisateur (
    id_util INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_util VARCHAR(50) NOT NULL,
    prenom_util VARCHAR(50) NOT NULL,
    mdp_util VARCHAR(100),
    mail_util VARCHAR(50),
    id_historique INT,
    id_type_util INT
)  ENGINE=INNODB;
  
CREATE TABLE type_utilisateur (
    id_type_util INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    type_util VARCHAR(50) NOT NULL
)ENGINE =InnoDB;
CREATE TABLE image (
    id_image INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_image VARCHAR(50) NOT NULL,
    url_image VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE livre_audio (
    id_livre_audio INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_livre VARCHAR(50) NOT NULL,
   url_livre VARCHAR(50) NOT NULL,
    description_livre VARCHAR(255),
    date_livre VARCHAR(50),
    id_historique INT
    
)  ENGINE=INNODB;

CREATE TABLE categorie (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_categorie VARCHAR(50) NOT NULL
)ENGINE =InnoDB;


CREATE TABLE historique (
    id_historique INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    livre_lu VARCHAR(50) NOT NULL,
    date_lecture datetime,
    duree_lecture decimal(2,2)
)  ENGINE=INNODB;

-- creation tables associative

CREATE TABLE posseder (
    id_util INT NOT NULL,
    id_image int  not  null,
    primary key(id_util,id_image)
 
)ENGINE =InnoDB;
CREATE TABLE ecouter (
    id_util INT NOT NULL,
    id_livre_audio int  not  null,
    date_commentaire datetime not null,
    primary key(id_util,id_livre_audio,date_commentaire),
    commenetaire text not null,
    note float not null
 
)ENGINE =InnoDB;


CREATE TABLE assigner (
    id_categorie INT NOT NULL,
    id_livre_audio int  not  null,
    primary key(id_categorie,id_livre_audio)
 
)ENGINE =InnoDB;

CREATE TABLE illustrer(
   id_livre_audio int  not  null,
    id_image int  not  null,
    primary key(id_livre_audio,id_image)
)ENGINE =InnoDB;


-- forgein
alter table posseder
add constraint fk_posseder_image
foreign key(id_image)
references image(id_image);


alter table posseder
add constraint fk_posseder_utilisateur
foreign key(id_util)
references utilisateur(id_util);


alter table ecouter
add constraint fk_ecouter_livre_audio
foreign key(id_livre_audio)
references livre_audio(id_livre_audio);

alter table ecouter
add constraint fk_ecouter_utilisateur
foreign key(id_util)
references utilisateur(id_util);



alter table assigner
add constraint fk_assigner_livre_audio
foreign key(id_livre_audio)
references livre_audio(id_livre_audio);

alter table assigner
add constraint fk_assigner_categorie
foreign key(id_categorie)
references categorie(id_categorie);

alter table illustrer
add constraint fk_illustrer_livre_audio
foreign key(id_livre_audio)
references livre_audio(id_livre_audio);

alter table illustrer
add constraint fk_illustrer_image
foreign key(id_image)
references image(id_image);

alter table utilisateur
add constraint fk_attribuer_type_utilisateur
foreign key(id_type_util)
references type_utilisateur(id_type_util);

alter table utilisateur
add constraint fk_avoir_historique
foreign key(id_historique)
references historique(id_historique);

alter table livre_audio
add constraint fk_contenir_historique
foreign key(id_historique)
references historique(id_historique);


