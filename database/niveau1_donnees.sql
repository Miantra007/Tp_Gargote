INSERT into categorie(libelle) VALUES ('Goûter') on CONFLICT (libelle) do NOTHING;

INSERT INTO plat (nom, prix, id_categorie, description)
SELECT 'Koba', 1000, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
FROM categorie WHERE libelle = 'Goûter';

INSERT INTO plat (nom, prix, id_categorie, description)
SELECT '*mofo gasy', 200, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
FROM categorie WHERE libelle = 'Goûter';

INSERT INTO plat (nom, prix, id_categorie, description)
SELECT ' mokary', 200, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
FROM categorie WHERE libelle = 'Goûter';

INSERT INTO plat (nom, prix, id_categorie, description)
SELECT 'godrogodro', 500, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
FROM categorie WHERE libelle = 'Goûter';

INSERT INTO plat (nom, prix, id_categorie, description)
SELECT 'menakely', 300, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
FROM categorie WHERE libelle = 'Goûter';


UPDATE plat set description = 'Sakafo matsiro' WHERE id_categorie = 1 or id_categorie = 2 or id_categorie =3;
UPDATE plat set disponnible = false WHERE id = 1 or id= 2;

INSERT INTO plat_du_jour(date_jour,id_plat) VALUES
(CURRENT_DATE,1),
(CURRENT_DATE - 6,2);



-- INSERT INTO plat (nom, prix, id_categorie, description)
-- SELECT 'tsaramaso', 0, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
-- FROM categorie WHERE libelle = 'Goûter';

-- INSERT INTO plat (nom, prix, id_categorie, description)
-- SELECT 'menakely', 600, id, 'Pâte d''arachide, banane et farine de riz, cuite en feuille de bananier'
-- FROM categorie WHERE libelle = 'Goûter';