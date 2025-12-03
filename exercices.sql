-------------------- Q1:INSERT - Création d'un nouvel utilisateur --------------------

ALTER table utilisateur add constraint role_check check (role in ('admin','author','éditeur'));

SELECT * FROM utilisateur

INSERT INTO utilisateur (username , email , mod_de_pass , date_inscription , role)
VALUES ('jdupont','jean.dupont@email.com','$2y$10$...','2025-12-03','éditeur');

-------------------- Q2:SELECT - Récupération d'articles --------------------

select nom_article , date_creation , status from article

-------------------- Q3:UPDATE - Modification de statut --------------------

ALTER TABLE article drop constraint article_status_check;
ALTER TABLE article add constraint article_status_check check (status in ('published','draft','archivé'));

UPDATE article 
set status = 'archivé'
where date_creation < '2024-01-01';

-------------------- Q4:DELETE - Nettoyage des commentaires --------------------

DELETE from commentaire 
WHERE status = 'spam' AND date_commentaire < '2024-01-01'

-------------------- Q5:WHERE - Filtrage temporel --------------------

SELECT * FROM article 
WHERE date_creation > '2024-12-01';

-------------------- Q6:ORDER BY - Tri chronologique --------------------

select * from utilisateur
ORDER BY date_inscription ASC

-------------------- Q7:LIMIT - Articles récents --------------------

SELECT * FROM article 
ORDER BY date_creation DESC
LIMIT 5;

-------------------- Q8:DISTINCT - Rôles uniques --------------------

select DISTINCT role from utilisateur

-------------------- Q9:AND/OR - Articles par catégorie et statut --------------------

select ar.nom_article FROM article ar
join categorie ca on ar.id_categorie = ca.id_categorie
where ca.libelle = 'Technologie' and status in ('published','draft');

-------------------- Q10:BETWEEN - Commentaires par période --------------------

select * from commentaire 
where date_commentaire BETWEEN '2024-12-01' and '2024-12-15'

-------------------- Q11:   ------------------