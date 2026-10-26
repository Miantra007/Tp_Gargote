ALTER Table plat add COLUMN description VARCHAR(255);
ALTER Table plat add COLUMN disponnible BOOLEAN DEFAULT true;
ALTER Table plat add constraint ck_prix_plat Check(prix>0);
ALTER Table plat add constraint ck_nom_plat UNIQUE(nom);

CREATE Table if not exists plat_du_jour(
    date_jour date PRIMARY key,
    id_plat INTEGER REFERENCES plat(id)
);


