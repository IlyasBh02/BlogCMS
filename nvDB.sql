CREATE DATABASE BlogCMS;
USE BlogCMS;


CREATE TABLE utilisateur (
    username VARCHAR(50) PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    mod_de_pass VARCHAR(255),
    date_inscription DATE,
    role ENUM('admin','author','user') DEFAULT 'user'
);


CREATE TABLE categorie (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT,
    libelle VARCHAR(50),
    description TEXT
);


CREATE TABLE article (
    id_article INT PRIMARY KEY AUTO_INCREMENT,
    nom_article VARCHAR(50),
    contenu TEXT,
    date_creation DATE,
    date_modification DATE,
    id_categorie INT,
    username VARCHAR(50),
    image_url VARCHAR(255),
    status VARCHAR(50),
    view_count INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_article_categorie FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie),
    CONSTRAINT fk_article_user FOREIGN KEY (username) REFERENCES utilisateur(username),
    CONSTRAINT article_status_check CHECK (status IN ('published','draft'))
);



CREATE TABLE commentaire (
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    contenu_commentaire TEXT,
    date_commentaire DATE,
    username VARCHAR(50) NULL,
    id_article INT,
    email VARCHAR(100) NULL,
    status VARCHAR(50),
    CONSTRAINT fk_commentaire_article FOREIGN KEY(id_article) REFERENCES article(id_article),
    CONSTRAINT fk_commentaire_user FOREIGN KEY(username) REFERENCES utilisateur(username),
    CONSTRAINT comment_status_check CHECK (status IN ('approved','spam','pending'))
);



INSERT INTO utilisateur (username, nom, prenom, email, mod_de_pass, date_inscription, role) VALUES 
('admin_amine', 'El Amrani', 'Amine', 'amine.elamrani@mail.ma', 'pass123secure', '2024-01-10', 'admin'),
('fatima_dev', 'Bennani', 'Fatima-Zahra', 'fatima.bennani@gmail.com', 'dev2024pass', '2024-02-15', 'user'),
('youssef_casa', 'Chraibi', 'Youssef', 'youssef.c@hotmail.fr', 'raja1949', '2024-03-20', 'user'),
('leila_travel', 'Tazi', 'Leila', 'leila.tazi@yahoo.com', 'travel2024', '2024-04-05', 'user'),
('admin_blog', NULL, NULL, 'admin@blogcms.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-01-15','admin'),
('marie_dubois', NULL, NULL, 'marie.dubois@email.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-02-10','author'),
('pierre_leroy', NULL, NULL, 'pierre.leroy@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-02-15','author'),
('sophie_martin', NULL, NULL, 'sophie.martin@protonmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-01','author'),
('jean_dupont', NULL, NULL, 'jean.dupont@yahoo.fr','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-10','author'),
('lucie_bernard', NULL, NULL, 'lucie.bernard@email.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-15','author'),
('thomas_petit', NULL, NULL, 'thomas.petit@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-20','author'),
('julie_roux', NULL, NULL, 'julie.roux@protonmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-01','author'),
('marc_vincent', NULL, NULL, 'marc.vincent@yahoo.fr','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn9p36WQoeG6Lruj3vjPGga31lW','2024-04-05','author'),
('isabelle_leroy', NULL, NULL, 'isabelle.leroy@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-10','author'),
('david_morel', NULL, NULL, 'david.morel@email.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-15','author'),
('caroline_duval', NULL, NULL, 'caroline.duval@protonmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-02','author'),
('nicolas_lambert', NULL, NULL, 'nicolas.lambert@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-10','author'),
('elodie_garnier', NULL, NULL, 'elodie.garnier@email.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-20','author'),
('antoine_chevalier', NULL, NULL, 'antoine.chevalier@yahoo.fr','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-01','author'),
('clara_royer', NULL, NULL, 'clara.royer@protonmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-10','author'),
('quentin_menard', NULL, NULL, 'quentin.menard@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-15','author'),
('amelie_colin', NULL, NULL, 'amelie.colin@email.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-03','author'),
('vincent_gauthier', NULL, NULL, 'vincent.gauthier@protonmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-12','author'),
('marine_lebrun', NULL, NULL, 'marine.lebrun@gmail.com','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-20','author');



INSERT INTO categorie (id_categorie, libelle, description) VALUES
(1,'Technologie','Actualités, tutoriels et analyses sur les nouvelles technologies'),
(2,'Santé','Conseils santé, bien-être et médecine préventive'),
(3,'Voyage','Récits de voyage, guides pratiques et conseils touristiques'),
(4,'Cuisine','Recettes, techniques culinaires et astuces de cuisine'),
(5,'Sport','Actualités sportives, conseils d’entraînement et nutrition'),
(6,'Éducation','Pédagogie, conseils d’apprentissage et innovations éducatives'),
(7,'Finance','Gestion budgétaire, investissements et actualités économiques'),
(8,'Mode','Tendances, conseils style et actualités de la mode');



INSERT INTO article (id_article, nom_article, contenu, date_creation, date_modification, id_categorie, username, image_url, status, view_count) VALUES
(1,'Les Nouvelles Tensions Technologiques en 2024','Explorez les technologies émergentes...','2024-02-20','2024-02-21',1,'pierre_leroy','tech1.jpg','published',1245),
(2,'Comment Maintenir une Bonne Santé au Travail','Des conseils pratiques...','2024-02-25','2024-02-25',2,'sophie_martin','sante1.jpg','published',876),
(3,'Les 10 Destinations à Visiter Absolument en 2024','Découvrez les destinations...','2024-03-05','2024-03-06',3,'jean_dupont','voyage1.jpg','draft',0),
(4,'Recette du Gâteau au Chocolat Fondant','Une recette simple...','2024-03-10','2024-03-11',4,'lucie_bernard','cuisine1.jpg','published',2345),
(5,'Préparation Marathon : Guide Complet du Débutant','Tout ce qu’il faut savoir...','2024-03-15','2024-03-16',5,'marc_vincent','sport1.jpg','published',1567),
(6,'Apprendre à Coder en 6 Mois : Mon Parcours','Comment j’ai appris...','2024-03-20','2024-03-21',6,'david_morel','education1.jpg','published',3210),
(7,'Investir dans la Cryptomonnaie en 2024','Guide pour débutants...','2024-04-01','2024-04-02',7,'nicolas_lambert','finance1.jpg','published',1890),
(8,'Les Tendances Mode Printemps-Été 2024','Découvrez les must-have...','2024-04-05','2024-04-06',8,'antoine_chevalier','mode1.jpg','published',943);




INSERT INTO commentaire (id_commentaire, contenu_commentaire, date_commentaire, username, id_article, email, status) VALUES
(1, 'Excellent article, très bien documenté !', '2024-02-21', NULL, 1, 'jean.martin@email.com', 'approved'),
(2, 'Je ne suis pas tout à fait d''accord sur certains points.', '2024-02-22', NULL, 1, 'sophie.leroy@gmail.com', 'approved'),
(3, 'Cela m''a beaucoup aidé, merci pour ces conseils.', '2024-02-25', NULL, 2, 'thomas.dubois@protonmail.com', 'approved'),
(4, 'Très bel article, les photos sont magnifiques !', '2024-02-26', NULL, 3, 'marie.petit@yahoo.fr', 'approved'),
(5, 'Je trouve que certains conseils sont dangereux.', '2024-02-27', NULL, 4, 'pierre.bernard@gmail.com', 'spam'),
(6, 'Parfait pour les débutants comme moi, merci !', '2024-02-28', NULL, 5, 'julie.vincent@email.com', 'approved'),
(7, 'Très détaillé, j''ai appris beaucoup de choses.', '2024-02-29', NULL, 6, 'marc.roux@protonmail.com', 'approved'),
(8, 'C''est exactement ce que je cherchais, merci !', '2024-03-01', NULL, 7, 'isabelle.morel@yahoo.fr', 'approved'),
;


