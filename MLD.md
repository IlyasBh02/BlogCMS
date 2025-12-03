utilisateur (nom , prenom , email , username , mod_de_pass , date_inscription , role);

categorie (id_categorie , libelle , nom_categorie);

article (id_article , nom_article , contenu , date_création , date_modification , #id_categorie , #username);

commentaire (id_commentaire , contenu_commentaire , date_commentaire , #id_utilisateur , #id_article);