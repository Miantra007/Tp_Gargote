## 0.2 Lire le schéma relationnel
1) 
- categorie(**id**,libelle)
- plat(**id**,nom,prix,#id_categorie)
- commande(**id**,date_commande,numero_table)
- commande_ligne(**id**,#id_commande,quantite,prix_unitaire)

2) - C'est recuperer facilement le prix d'un plat a une commande donnee
- Si on saisit a la main le prix dans commande_ligne il peut y avoir des erreur , mais on le recupere grace a l'id_plat
  
3) - Ca doit afficher un erreur , l'instruction responsable est le foreign key, c'est a dire on ne peut pas supprimer une commande lorsque cela est un fk d'une autre table

4) - prix < 0 pour un plat
   - quantite < 0 dans commande_ligne
   - prix unitaire < 0 dans commande ligne
  
## 0.3 Interroger l’API à la main
# a) liste des soupes : curl -i http://localhost:8080/api/plats?categorie=2
- code = 200 ok
- reponse = 
 [
    {
        "id": 11,
        "nom": "akoho",
        "prix": -2,
        "id_categorie": 2,
        "categorie": "Soupe"
    },
    {
        "id": 7,
        "nom": "Mi sao",
        "prix": 6500,
        "id_categorie": 2,
        "categorie": "Soupe"
    },
    {
        "id": 6,
        "nom": "Soupe chinoise",
        "prix": 6000,
        "id_categorie": 2,
        "categorie": "Soupe"
    }
]

# b) création d'un plat valide : 
curl -i -X POST http://localhost:8080/api/plats \
     -H "Content-Type: application/json" \
     -d '{"nom":"Mofo gasy","prix":300,"id_categorie":1}'

- code = 201 created
- reponse = 
  {
    "id": 12,
    "nom": "Mofo gasy",
    "prix": 300,
    "id_categorie": 1
  }

 # c) création d'un plat invalide
curl -i -X POST http://localhost:8080/api/plats \
     -H "Content-Type: application/json" \
     -d '{"nom":"","prix":"cher"}'

- code = 422 Unprocessable Content
- reponse =
  {
    "message": "Données invalides.",
    "errors": {
        "nom": "Le nom du plat est obligatoire.",
        "prix": "Le prix doit être un nombre entier (en Ariary).",
        "id_categorie": "Choisissez une catégorie."
    }
}

# d) suppression d'un plat présent dans une commande : curl -i -X DELETE http://localhost:8080/api/plats/2
- code = 409 Conflict
- reponse = 
  {
    "message": "Ce plat figure déjà dans des commandes, il ne peut pas être supprimé.",
    "errors": {}
  }

# e) une commande qui n'existe pas : curl -i http://localhost:8080/api/commandes/999
- code = 404 not found
- reponse = 
  {
    "message": "Commande 999 introuvable.",
    "errors": {}
}

5) J'ai obtenu 201 car je fais une creation , mon action est precis
6) PHP :  return $this->erreur('Ce plat figure déjà dans des commandes, il ne peut pas être supprimé.', 409);
7) curl -i -X POST http://localhost:8080/api/commandes \
     -H "Content-Type: application/json" \
     -d '{"numero_table":6,"lignes":[{"id_commande":4,"id_plat":4,"quantite":2,"prix_unitaire":7000},{"id_commande":4,"id_plat":10,"quantite":1,"prix_unitaire":1000}]}'

## 0.4 Suivre une requête de bout en bout
| #   | Étape                                   | Fichier                   | Fonction / ligne     |
| --- | --------------------------------------- | ------------------------- | -------------------- |
| 1   | Le formulaire est soumis                | `components/PlatForm.vue` | 57                   |
| 2   | La requête HTTP est construite          | `api.js`                  | `requete()`          |
| 3   | Vite transmet `/api/...` au port 8080   | `vite.config.js`          | 11                   |
| 4   | CodeIgniter choisit le contrôleur       | `config/Routes.php`       | `'Plats::index'`     |
| 5   | Le contrôleur lit le JSON               | `Api/ApiController.php`   | 22                   |
| 6   | Les règles de validation sont vérifiées | `Api/Plats.php`           | `erreurValidation()` |
| 7   | La ligne est insérée                    | `CommandeService.php`     | 73                   |
| 8   | Le formulaire prévient l’écran parent   | `PlatForm.vue`            | `emit(…)`            |
| 9   | L’écran recharge la liste               | `views/CarteView.vue`     | `onMounted()`        |

8) C'est dans CommandeService ; creer(), pas dans le controleur puisque c'est dans un service qu'on fais le regle metier et on l'appelle juste dans le controleur

## 0.5 Repérer les notions de Vue

| Notion                 | À quoi ça sert                                                    | Votre exemple         |
| ---------------------- | ----------------------------------------------------------------- | --------------------- |
| `ref()`                | une variable dont le changement met l’écran à jour                | `PlatForm.vue /13`    |
| `computed()`           | une valeur calculée à partir d’autres, recalculée automatiquement | `Panier.vue / 11`     |
| `v-for`                | répéter un élément pour chaque élément d’une liste                | `Panier.vue / 21`     |
| `v-if` / `v-else`      | afficher un élément seulement si une condition est vraie          | `Panier.vue/18 et 20` |
| `v-model`              | lier un champ de formulaire à une variable, dans les deux sens    | `PlatForm.vue / 64`   |
| `defineProps`          | recevoir des données du composant parent                          | `PlatForm.vue / 5`    |
| `defineEmits` / `emit` | envoyer un événement au composant parent                          | `PlatForm.vue / 9`    |
| `onMounted`            | exécuter du code quand le composant apparaît                      | `Carte.vue / 40`      |

9) - C'est pour regler la quantite 
   - C'est dans PlatForm.vue
10) - Le watch sert a detecter si il y a des valeurs sur les input
    - Sans lui lorsqu'on clique sur modifier , on ne peut pas recuperer et injecter les nouvelles valeurs pour la modification
  
## 0.6 Premières modification

a) 
b) 
11) Grace a categorie en variable reactive(ref) dans views/CarteView.vue , components : PlatForm
