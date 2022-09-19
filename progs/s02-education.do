capture log using "$proj_dir/s02.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$clean_menage/$membres_cle", keep(1 3) nogen
merge 1:1 interview__id interview__key s02q00a using "$raw_menage/$s02", keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)
local membre_du_menage "((preload_pid != . & s01q00a == 1) | (preload_pid == .)) | (s01q12 == 1 | s01q13 == 1)"
keep if ((AgeAnnee >= 3) & (`membre_du_menage'))

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s02q01 
* ÉTIQUETTE : 2.01. [NOM] peut-il lire un petit texte dans les langues suivantes?
* TYPE : Catégorielle: à réponses multiples, oui/non
* MODALITÉS : 
*   1   Français
*   2   Langue locale
*   3   Autres langues
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

qui: d s02q01__*, varlist
local s02q01_vars = r(varlist)

foreach s02q01_var of local s02q01_vars {
    check_if_miss `s02q01_var' 
}

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. %rostertitle% a déclaré en 1.39 qu'il %acces_internet%. Alors, il est moins probable qu'il ne sache pas lire en français et dans une autre langue.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membrre dit avoir accès à Internet au cyber

s01q36!=null & s01q39.Yes.Contains(2)?
 
//Il devrait savoir lire en francais ou dans une ou autre langue

s02q01.Yes.Contains(1)|s02q01.Yes.Contains(3):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Incohérence. %rostertitle% a déclaré en 1.39 qu'il %acces_internet%. Alors, il est moins probable qu'il ne sache pas lire en français et dans une autre langue.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membrre dit avoir accès à Internet au bureau

s01q36!=null & s01q39.Yes.Contains(3)?
 
//Il devrait savoir lire en francais ou dans une ou autre langue

s02q01.Yes.Contains(1)|s02q01.Yes.Contains(3):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Incohérence. %rostertitle% a déclaré en 1.39 qu'il %acces_internet%. Alors, il est moins probable qu'il ne sache pas lire en français et dans une autre langue.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membrre dit avoir accès à Internet à l'école/université

s01q36!=null & s01q39.Yes.Contains(5)?
 
//Il devrait savoir lire en francais ou dans une ou autre langue

s02q01.Yes.Contains(1)|s02q01.Yes.Contains(3):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 4 : Incohérence. %rostertitle% a déclaré en 1.39 qu'il %acces_internet%. Alors, il est moins probable qu'il ne sache pas lire en français et dans une autre langue.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membrre dit avoir accès à Internet sur son téléphone

s01q36!=null & s01q39.Yes.Contains(1)?
 
//Il devrait savoir lire en francais ou dans une ou autre langue

s02q01.Yes.Contains(1)|s02q01.Yes.Contains(3):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 5 : Incohérence. %rostertitle% a déclaré en 1.39 qu'il %acces_internet%. Alors, il est moins probable qu'il ne sache pas lire en français et dans une autre langue.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membrre dit avoir accès à Internet à domicile

s01q36!=null & s01q39.Yes.Contains(4)?
 
//Il devrait savoir lire en francais ou dans une ou autre langue

s02q01.Yes.Contains(1)|s02q01.Yes.Contains(3):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s02q02 
* ÉTIQUETTE : 2.02. [NOM] peut-il écrire un petit texte dans les langues suivantes?
* TYPE : Catégorielle: à réponses multiples, oui/non
* MODALITÉS : 
*   1   Français
*   2   Langue locale
*   3   Autres langues
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

qui: d s02q02__*, varlist 
local s02q02_vars = r(varlist)

foreach s02q02_var of local s02q02_vars {
    check_if_miss `s02q02_var' 
}

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Attention! Il s'avère moins plausible qu'une personne sache écrire en <font color="blue"> français  sans savoir lire. Veuillez corriger les informations renseignées pour la langue française

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait écrire en français...
s02q02.Missing.Length==0 & s02q02.Yes.Contains(1) ?

// ...il est probable que l'on sache également lire
s02q01.Yes.Contains(1) :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Attention! Il s'avère moins plausible qu'une personne sache écrire en langue nationale sans savoir lire. Veuillez corriger les informations renseignées pour la langue Nationale

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait écrire en langue nationale...
s02q02.Missing.Length==0 & s02q02.Yes.Contains(2) ?

// ...il est probable que l'on sache également lire
s02q01.Yes.Contains(2) :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Attention! Il s'avère moins plausible qu'une personne sache écrire en d'autres langues sans savoir lire. Veuillez corriger les informations renseignées pour les autres langues

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait écrire en d'autres langues...
s02q02.Missing.Length==0 & s02q02.Yes.Contains(3) ?

// ...il est probable que l'on sache également lire
s02q01.Yes.Contains(3) :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s02q02a 
* ÉTIQUETTE : 2.02a. [NOM]  arrive-t-il/elle à comprendre un petit texte lu dans les langues suivantes?
* TYPE : Catégorielle: à réponses multiples, oui/non
* MODALITÉS : 
*   1   Français
*   2   Langue locale
*   3   Autres langues
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

qui: d s02q02a__*, varlist 
local s02q02a_vars = r(varlist)

foreach s02q02a_var of local s02q02a_vars {
    check_if_miss `s02q02a_var' 
}

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Attention! Il s'avère moins plausible qu'une personne sache comprendre en  français  sans savoir lire et écrire en  français

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait comprendre un texte en français...
s02q02a.Missing.Length==0 & s02q02a.Yes.Contains(1) ?

// ...il est probable que l'on sache également lire
s02q01.Yes.Contains(1) & s02q02.Yes.Contains(1)   :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Il s'avère moins plausible qu'une personne sache écrire en langue nationale sans savoir comprendre un texte en langue nationale.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait écrire en langue nationale...
s02q02a.Missing.Length==0 & s02q02a.Yes.Contains(2) ?

// ...il est probable que l'on sache également lire et écrire
s02q01.Yes.Contains(2) & s02q02.Yes.Contains(2) :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Il s'avère moins plausible qu'une personne comprenne un texte en d'autres langues sans savoir lire et écrire dans ces langues. 

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'on sait écrire en d'autres langues...
s02q02a.Missing.Length==0 & s02q02a.Yes.Contains(3) ?

// ...il est probable que l'on sache également lire
s02q01.Yes.Contains(3) & s02q02.Yes.Contains(3)  :

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s02q12 
* ÉTIQUETTE : 2.12. [NOM] a-t-il fréquenté une école au cours de l'année scolaire %anneeScolaireEnCours%?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s02q12 if (s02q03==1)








* ----------------------------------------------------------------------------
* VARIABLE : s02q14 
* ÉTIQUETTE : 2.14. Quel est le niveau d'études suivi par [NOM]  au cours de l'année %anneeScolaireEnCours%?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Maternelle
*   2   Primaire
*   3   Secondaire 1  (Post Primaire) générale
*   4   Secondaire 1  (Post Primaire) technique
*   5   Secondaire 2 générale
*   6   Secondaire 2 technique
*   7   Post secondaire (préparation de diplômes de niveau BAC+2)
*   8   Supérieur
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s02q14 if (s02q12==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. %rostertitle% %lire_ecrire%. Il est donc moins probable qu'il ait un niveau secondaire.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membre a au moins le niveau secondaire

s02q14>=3?

//il sait lire et écrire en français

s02q01.Yes.Contains(1) & s02q02.Yes.Contains(1):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Incohérence. %rostertitle% a %AgeAnnee% ans. Il est donc moins probable qu'il ait suivie la maternelle en 2016/2017. Veuillez vérifier et corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si membre a suivi le niveau maternelle en 2020/2021 alors

s02q14==1?

//il a moins de 7 ans

AgeAnnee<7:

// Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Incohérence. Vue l'âge de %rostertitle% (%AgeAnnee% ans) et son âge d'entrée à l'école (2.07) qui est de %s02q07%, il est peu problable qu'%accord% ait suivi ce niveau d'étude en 2016/2017. Veuillez vérifier et corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si âge actuelle - age d'entré (2.07) est inférieur à 4

(AgeAnnee-s02q07)<=4?

//il a au plus suivi le niveau primaire

s02q14<=2:

///Si âge actuelle - age d'entré (2.07) est inférieur à 7

(AgeAnnee-s02q07)<=7?

//il a au plus suivi le niveau secondaire 1

s02q14<=4:

//Si âge actuelle - age d'entré (2.07) est inférieur à 9

(AgeAnnee-s02q07)<=9?

//il a au plus suivi le niveau secondaire 2

s02q14<=6:

//Si âge actuelle - age d'entré (2.07) est inférieur à 11

(AgeAnnee-s02q07)<=11?

//il a au plus suivi le niveau post secondaire ou supérieur

s02q14<=7:

//Toute autre cas vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     






* ----------------------------------------------------------------------------
* VARIABLE : s02q29 
* ÉTIQUETTE : 2.29. Quel est le niveau d'études le plus élevé atteint par [NOM]?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Maternelle
*   2   Primaire
*   3   Secondaire 1 (Post Primaire) Général
*   4   Secondaire 1 (Post Primaire) Technique
*   5   Secondaire 2 Général
*   6   Secondaire 2 Technique
*   7   Post-secondaire (préparation diplômes niveau BAC+2)
*   8   Supérieur
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s02q29 if (s02q12==2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. Vue l'âge de %rostertitle% (%AgeAnnee% ans) et son âge d'entrée à l'école (2.07) qui est de %s02q07%, il est peu problable qu'%accord% ait suivi ce niveau d'étude. Veuillez vérifier et corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si âge actuelle - age d'entré (2.07) est inférieur à 4

(AgeAnnee-s02q07)<=4?

//il a au plus suivi le niveau primaire

s02q29<=2:

///Si âge actuelle - age d'entré (2.07) est inférieur à 7

(AgeAnnee-s02q07)<=7?

//il a au plus suivi le niveau secondaire 1

s02q29<=4:

//Si âge actuelle - age d'entré (2.07) est inférieur à 9

(AgeAnnee-s02q07)<=9?

//il a au plus suivi le niveau secondaire 2

s02q29<=6:

//Si âge actuelle - age d'entré (2.07) est inférieur à 11

(AgeAnnee-s02q07)<=11?

//il a au plus suivi le niveau post secondaire ou supérieur

s02q29<=7:

//Toute autre cas vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Incohérence. %rostertitle% %lire_ecrire%. Il est donc moins probable qu'il ait un niveau secondaire.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membre a au moins le niveau secondaire

s02q29>=3?

//il sait lire et écrire en français

s02q01.Yes.Contains(1) & s02q02.Yes.Contains(1):

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s02", replace

log close
