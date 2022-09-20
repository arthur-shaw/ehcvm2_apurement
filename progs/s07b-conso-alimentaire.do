log using "$proj_dir/s07b.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s07b", keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s07bq02_autre 
* ÉTIQUETTE : 7B.02a.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

#delim;
local condition_autre "
inlist(s07bq01,11,18, 19) |

inlist(s07bq01,39, 171) |

(s07bq01 == 50) |

(s07bq01 == 70) |

(s07bq01 == 59) |

inlist(s07bq01,75, 87) |

inlist(s07bq01,106,107) |

inlist(s07bq01,111, 129) |

inlist(s07bq01,149,152, 154) |

(s07bq01 == 159)
";
#delim cr

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq02_autre if (`condition_autre')

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (`condition_autre')
local n_oth = r(N)
di as result "Variable -s07bq02_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s07bq02_autre if (`condition_autre')


* ----------------------------------------------------------------------------
* VARIABLE : s07bq03a 
* ÉTIQUETTE : 7B.03a. Quelle est la quantité totale du [NOM] consommé par le ménage au cours des 7 derniers jours?
* TYPE : Numerique, réel
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq03a 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. Le ménage a consommé le bien au cours des 7 derniers jours, la quantité ne peut donc pas être égale à 0. Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq03a>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : ERREUR. Quantité impossible. Veuillez corriger ou déclarer avec une autre unité

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq03a.InRange(0, 100) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : ATTENTION. Quantité improbable. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq03a.InRange(0, 10) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s07bq03a, by(s07bq01 s07bq03b s07bq03c)


* ----------------------------------------------------------------------------
* VARIABLE : s07bq03b 
* ÉTIQUETTE : 7B.03b. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   100 Kg
*   101 Litre
*   102 Alvéole / Plateau
*   103 Avec os au Kg
*   104 Avec os au tas
*   105 bassine
*   106 Bidon
*   107 boîte
*   109 bol
*   111 Boule
*   112 Bouquet
*   113 Bouteille
*   114 Caisse
*   115 calebasse
*   116 Canari
*   118 Carton
*   119 casier
*   120 Cuillère
*   121 fagot
*   124 Gousse
*   125 Louche
*   126 Morceau
*   128 panier
*   129 Paquet
*   131 Pot
*   132 Régime
*   133 sac
*   135 Sac (100 Kg)
*   136 Sac (25 Kg)
*   138 Sac (50 Kg)
*   139 Sachet
*   140 Sans os au Kg
*   141 Sans os au tas
*   142 seau
*   143 Tas
*   147 unité
*   148 Verre
*   561 barquette
*   578 tranche
*   autres valeurs propre au pays
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq03b 


* ----------------------------------------------------------------------------
* VARIABLE : s07bq03c 
* ÉTIQUETTE : 7B.03c. Taille
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   0   Taille unique
*   1   Petit
*   2   Moyen
*   3   Grand
*   4   Quart
*   5   Demi
*   6   Entier
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq03c 


* ----------------------------------------------------------------------------
* VARIABLE : s07bq04 
* ÉTIQUETTE : 7B.04. Parmi cette quantité consommée, quelle est celle qui provient de la production propre du ménage (agriculture, élevage, pêche, aquaculture, chasse, cueillette?
* TYPE : Numerique, réel
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

#delim;
local aucune_production "
(
s07bq01 != 3 &
s07bq01 != 4 &
s07bq01 != 20
)

&

(
s07bq01 != 54 &
s07bq01 != 55
)

&

s07bq01 != 91

&

(
s07bq01 != 129 &
s07bq01 != 130 &
s07bq01 != 132
)

&

(
s07bq01 != 139 &
s07bq01 != 140
)

&

(
s07bq01 != 149 &
s07bq01 != 150 &
s07bq01 != 151 &
s07bq01 != 152 &
s07bq01 != 155 &
s07bq01 != 156 &
s07bq01 != 157 &
s07bq01 != 159
)
";
#delim cr

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq04 if (`aucune_production')

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. L'autoconsommation doit être inférieure ou égale à la consommation totale. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq04 <= s07bq03a 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s07bq04 if (`aucune_production')


* ----------------------------------------------------------------------------
* VARIABLE : s07bq05 
* ÉTIQUETTE : 7B.05. Parmi cette quantité consommée, quelle est celle qui provient d'autres sources (cadeau, prélèvement de son propre commerce, troc, etc.)?
* TYPE : Numerique, réel
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq05 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. La somme de l'autoconsommation et des dons doit être inférieure ou égale à la consommation totale. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    ( s07bq05 + (s07bq04??0) ) <= s07bq03a 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s07bq05 


* ----------------------------------------------------------------------------
* VARIABLE : s07bq06 
* ÉTIQUETTE : 7B.06. Quelle est la dernière fois que le [NOM] a été acheté dans le ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Hier
*   2   7 dernier jours
*   3   30 derniers jours
*   4   Plus de 30 jours
*   5   Jamais
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq06 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. Le ménage à consommé le bien au cours de 7 derniers jours alors la quantité auto consommée ou la quantité provenant de d'autre sources ou celle achetée devrait être supérieure à 0. Veuillez vérifier et corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le ménage a consommé le bien au cours de la période alors 

s07bq03a >0?

//La quantité auto consommée ou la quantité provenant de d'autre
sources ou celle achetée devrait être supérieure à 0

((s07bq04 !=null & s07bq04>0) | s07bq05 >0 | s07bq06!=5) :

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s07bq07a 
* ÉTIQUETTE : 7B.07a. Quelle est la quantité du [NOM] acheté la dernière fois?
* TYPE : Numerique, réel
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq07a if (inlist(s07bq06, 1,2,3))

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. Le ménage a acheté le bien au cours des 7 derniers jours, la quantité ne peut donc pas être égale à 0. Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq07a>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s07bq07a if (inlist(s07bq06, 1,2,3)), by(s07bq01 s07bq07b s07bq07c)


* ----------------------------------------------------------------------------
* VARIABLE : s07bq07b 
* ÉTIQUETTE : 7B.07b. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   100 Kg
*   101 Litre
*   102 Alvéole / Plateau
*   103 Avec os au Kg
*   104 Avec os au tas
*   105 bassine
*   106 Bidon
*   107 boîte
*   109 bol
*   111 Boule
*   112 Bouquet
*   113 Bouteille
*   114 Caisse
*   115 calebasse
*   116 Canari
*   118 Carton
*   119 casier
*   120 Cuillère
*   121 fagot
*   124 Gousse
*   125 Louche
*   126 Morceau
*   128 panier
*   129 Paquet
*   131 Pot
*   132 Régime
*   133 sac
*   135 Sac (100 Kg)
*   136 Sac (25 Kg)
*   138 Sac (50 Kg)
*   139 Sachet
*   140 Sans os au Kg
*   141 Sans os au tas
*   142 seau
*   143 Tas
*   147 unité
*   148 Verre
*   561 barquette
*   578 tranche
*   autres valeurs propre au pays
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq07b if (inlist(s07bq06, 1,2,3))


* ----------------------------------------------------------------------------
* VARIABLE : s07bq07c 
* ÉTIQUETTE : 7B.07c. Taille
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   0   Taille unique
*   1   Petit
*   2   Moyen
*   3   Grand
*   4   Quart
*   5   Demi
*   6   Entier
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq07c if (inlist(s07bq06, 1,2,3))

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : ATTENTION. La consommation et l'achat ont eu lieu dans la même période, mais les unités sont différentes. Veuillez confirmer.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si l'achat a été effectué dans les 7 derniers jours...
s07bq06.InList(1, 2) ? 

// confirmer que l'unté-taille d'achat et de consommation est la même
(s07bq03b == s07bq07b) & (s07bq03c == s07bq07c) :

// sinon
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s07bq08 
* ÉTIQUETTE : 7B.08. Quelle est la valeur du [NOM] acheté la dernière fois?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s07bq08 if (inlist(s07bq06, 1,2,3))

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. Le ménage a acheté le bien au cours des 7 derniers jours, la valeur ne peut donc pas être égale à 0. Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s07bq08>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5
((mod(s07bq08, 5))==0 | s07bq08==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s07bq08 if (inlist(s07bq06, 1,2,3)), by(s07bq01 s07bq07b s07bq07c)


* ----------------------------------------------------------------------------
* OBJECTIF: contrôler le prix unitaire
* ----------------------------------------------------------------------------

gen prix_unitaire = s07bq08 / s07bq07a

lister_vals_extremes prix_unitaire if (inlist(s07bq06, 1,2,3)), by(s07bq01 s07bq07b s07bq07c)

* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s07b", replace

log close
