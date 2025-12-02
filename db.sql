Create database BlogCMS;

use BlogCMS;

create table utilisateur (
    username varchar(50) PRIMARY KEY unique , 
    nom varchar(50) unique, 
    prenom  varchar(255), 
    email  varchar(100) unique, 
    mod_de_pass  varchar(50), 
    date_inscription date, role varchar(50) , 
    constraint role_check check (role in ('user','admin'))
    );

create table categorie (
    id_categorie int primary key auto_increment, 
    libelle varchar(50)
    );

create table article (
    id_article int primary key auto_increment, 
    nom_article varchar(50), 
    contenu text, 
    date_creation date, 
    date_modification date, 
    id_categorie int, 
    username varchar(50) , 
    foreign key (id_categorie) references categorie (id_categorie) , 
    foreign key (username) references utilisateur (username)
    );

create table commentaire (
    id_commentaire int primary key auto_increment, 
    contenu_commentaire text, 
    date_commentaire date,
    username varchar(50) null, 
    id_article int , 
    foreign key (id_article) references article (id_article) , 
    foreign key (username) references utilisateur (username)
    );