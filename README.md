# Installation

- Télécharger dans le dossier sur votre machine où vous voulez héberger ce projet
- Mettre les données brutes dans le répertoire approprié de `/data/raw/`
- Fournir les paramètres dans les macros suivants de `lancer_tout.do`
    - `proj_dir`. L'adresse du projet
    - `pays`. L'identifiant de 3 lettres du pays. Ces caractères figurent inclus dans le nom de chaque fichier d'entrée.

# Utilisation

Deux modes d'emploi:

1. Lancer de bout en bout
2. Lancer par section

## 1. Lancer de bout en bout

Lancer le programme `lancer_tout.do` afin d'exécuter tous les programmes d'apurement du début à la fin.

## 2. Lancer par section

- Mettre en commentaire les programmes à ne pas lancer. Par exemple:
```
/*-----------------------------------------------------------------------------
01 - Apurer les données
-----------------------------------------------------------------------------*/

* section 1: composition du ménage
do "$progs/s01-membres.do"

* section 2: éducation
* do "$progs/s02-education.do"
```
- Lancer les programmes dans l'ordre suivant:
    - Lancer les lignes suivantes du script `lancer_tout.do`
```
/*=============================================================================
Paramètres
=============================================================================*/

global proj_dir ""
local pays ""

* ============================================================================
* Définir les répertoires et fichiers
* ============================================================================

do "$proj_dir/progs/parametrage.do"

/*=============================================================================
Charger les fonctions de service
=============================================================================*/

include "$progs/check_if_miss.do"
include "$progs/lister_vals_extreme.do"
```
    - Lancer le programme de la section cible

