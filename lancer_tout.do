/*=============================================================================
Paramètres
=============================================================================*/

global proj_dir ""
local pays ""

* ============================================================================
* Définir les répertoires et fichiers
* ============================================================================

include "$proj_dir/progs/parametrage.do"

/*=============================================================================
Charger les fonctions de service
=============================================================================*/

include "$progs/check_if_miss.do"
include "$progs/lister_vals_extreme.do"

/*=============================================================================
Exécuter les programmes d'apurement
=============================================================================*/

/*-----------------------------------------------------------------------------
00 - Stabiliser les entretiens et les résultats d'entretien
-----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
01 - Apurer les données
-----------------------------------------------------------------------------*/

* section 0
do "$progs/s00-identifiants-resultat.do"

* section 1: composition du ménage
do "$progs/s01-membres.do"

* section 2: éducation
do "$progs/s02-education.do"

* [TODO: insérer d'autres programmes, au besoin]

* section 4: emploi
do "$progs/s04-emploi.do"

* section 7b: consommation alimentaire
do "$progs/s07b-conso-alimentaire.do"

* section 9: consommation non-alimentaire
do "$progs/s09-conso-non-alim.do"

* section 11: logement
do "$progs/s11-logement.do"
