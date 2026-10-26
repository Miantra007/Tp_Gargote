<?php

namespace App\Models;

use CodeIgniter\Model;

class PlatDuJourModel extends Model
{
    protected $table = 'plat_du_jour';
    protected $primaryKey = 'id';
    protected $returnType = 'array';

    protected $allowedFields = ['date_jour','id_plat'];

    function getPlatDuJour()
    {
        $this->select('')

    }

        public function listerAvecCategorie(?int $idCategorie = null, ?int $disponible = null): array
    {
        $this->select('plat.*, categorie.libelle AS categorie')
            ->join('categorie', 'categorie.id = plat.id_categorie')
            ->orderBy('categorie.libelle')
            ->orderBy('plat.nom');

        if ($idCategorie !== null) {
            $this->where('plat.id_categorie', $idCategorie, );
        }

        if ($disponible !== null) {
            $this->where('plat.disponible', $disponible === 1);
        }

        return $this->findAll();
    }

}
