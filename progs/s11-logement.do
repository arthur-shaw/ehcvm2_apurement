* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$raw_menage/s11", clear

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s11q01 
* ÉTIQUETTE : 11.01. Type de logement actuel ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Choisir 1
*   2   Choisir 2
*   3   Choisir 3
*   4   Choisir 4
*   5   Choisir 5
*   6   Choisir 6
*   7   Choisir 7
*   8   Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q01 


* ----------------------------------------------------------------------------
* VARIABLE : s11q01_autre 
* ÉTIQUETTE : 11.01. Autre
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q01_autre if (s11q01==8)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q01==8)
local n_oth = r(N)
di as result "Variable -s11q01_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q01_autre if (s11q01==8)


* ----------------------------------------------------------------------------
* VARIABLE : s11q02 
* ÉTIQUETTE : 11.02. Combien de pièces le ménage occupe-t-il ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q02 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q02 


* ----------------------------------------------------------------------------
* VARIABLE : s11q03 
* ÉTIQUETTE : 11.03. Le logement dispose-t-il des équipements suivants?
* TYPE : Catégorielle: à réponses multiples, oui/non
* MODALITÉS : 
*   1   Climatiseurs/Splits faisant partie du logement
*   2   B. Chauffe-eau (pour eau chaude)
*   3   C. Ventilateurs incrustés au plafond
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q03 


* ----------------------------------------------------------------------------
* VARIABLE : s11q04 
* ÉTIQUETTE : 11.04. Quel est actuellement votre statut d'occupation ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Propriétaire avec titre ou acte de propriété
*   2   Propriétaire sans titre ou acte de propriété
*   3   Copropriétaire avec titre ou acte
*   4   Copropriétaire sans titre ni acte
*   5   Locataire
*   6   Logé par l'employeur
*   7   Logé gratuitement (parents, amis)
*   8   Autre
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q04 


* ----------------------------------------------------------------------------
* VARIABLE : s11q04_autre 
* ÉTIQUETTE : 11.04. autre. Précisez
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q04_autre if (s11q04==8)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q04==8)
local n_oth = r(N)
di as result "Variable -s11q04_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q04_autre if (s11q04==8)


* ----------------------------------------------------------------------------
* VARIABLE : s11q05 
* ÉTIQUETTE : 11.05.Quel est le montant (FCFA) payé pour un logement comme le votre dans ce village/quartier?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q05 if (s11q04!=5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q05, 5))==0 | s11q05==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant du loyer renseigné doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Le montant du loyer doit être supérieur à 0

s11q05>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q05 if (s11q04!=5)


* ----------------------------------------------------------------------------
* VARIABLE : s11q06 
* ÉTIQUETTE : 11.06. Quel est le montant mensuel du loyer? (FCFA)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q06 if (s11q04==5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q06, 5))==0 | s11q06==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant du loyer renseigné doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Le montant du loyer doit être supérieur à 0

s11q06>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q06 if (s11q04==5)


* ----------------------------------------------------------------------------
* VARIABLE : s11q07 
* ÉTIQUETTE : 11.07. Est-ce que le loyer est payé partiellement ou totalement par  un tiers non membre du ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q07 if (s11q04==5)


* ----------------------------------------------------------------------------
* VARIABLE : s11q09 
* ÉTIQUETTE : 11.09. Quel est le montant mensuel du loyer, y compris les avantages liés au logement (eau, électricité, téléphone etc.) payé par ce (s) tiers? (FCFA)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q09 if (s11q07==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q09, 5))==0 | s11q09==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant mensuel du loyer renseignée doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Le montant du loyer doit être supérieur à 0

s11q09>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q09 if (s11q07==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q18 
* ÉTIQUETTE : 11.18. Quel est le principal matériau de construction des murs extérieurs ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Ciment/Béton/Pierres
*   2   Briques cuites
*   3   Bac alu, vitres, etc
*   4   Banco amélioré/ semi-dur
*   5   Matériaux de récupération (planches, toles,…)
*   6   Pierres simples (Traditionnelles)
*   7   Paille, motte de terre
*   8   Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q18 


* ----------------------------------------------------------------------------
* VARIABLE : s11q18_autre 
* ÉTIQUETTE : 11.18.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q18_autre if (s11q18==8)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q18==8)
local n_oth = r(N)
di as result "Variable -s11q18_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q18_autre if (s11q18==8)


* ----------------------------------------------------------------------------
* VARIABLE : s11q19 
* ÉTIQUETTE : 11.19. Quel est le principal matériau du toit?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Dalle en ciment
*   2   Tuile
*   3   Tôles
*   4   Paille
*   5   Banco
*   6   Chaume
*   7   Nattes
*   8   Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q19 


* ----------------------------------------------------------------------------
* VARIABLE : s11q19_autre 
* ÉTIQUETTE : 11.19.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q19_autre if (s11q19==8)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q19==8)
local n_oth = r(N)
di as result 'Variable -s11q19_autre- a `n_oth' valeurs autre'

* identifier des opportunités de reclasser
list interview__id s11q19_autre if (s11q19==8)


* ----------------------------------------------------------------------------
* VARIABLE : s11q20 
* ÉTIQUETTE : 11.20. Quel est le principal matériau de revêtement du sol du logement?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Carreaux/Marbre
*   2   Ciment/Béton
*   3   Terre battue/Sable
*   4   Bouse d'animaux
*   5   Autre
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q20 


* ----------------------------------------------------------------------------
* VARIABLE : s11q20_autre 
* ÉTIQUETTE : 11.20.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q20_autre if (s11q20==5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q20==5)
local n_oth = r(N)
di as result "Variable -s11q20_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q20_autre if (s11q20==5)


* ----------------------------------------------------------------------------
* VARIABLE : s11q21 
* ÉTIQUETTE : 11.21. Le ménage est-il connecté à un réseau d'eau courante?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q21 


* ----------------------------------------------------------------------------
* VARIABLE : s11q22 
* ÉTIQUETTE : 11.22.   Est-ce que le service d'eau courante est compris dans le loyer?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q22 if (inrange(s11q04, 5, 8) & s11q21==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q23a 
* ÉTIQUETTE : 11.23a. Quel est le montant de la dernière facture d'eau? (En FCFA)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q23a if (s11q22==2 & inlist(s11q04, 6,7,8) | s11q21==1 & !inlist(s11q04, 6,7,8))

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q23a, 5))==0 | s11q23a==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q23a if (s11q22==2 & inlist(s11q04, 6,7,8) | s11q21==1 & !inlist(s11q04, 6,7,8))


* ----------------------------------------------------------------------------
* VARIABLE : s11q23b 
* ÉTIQUETTE : 11.23b. Périodicité de la dernière facture
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Hebdomadaire
*   2   Mensuel
*   3   Tous les 2 mois
*   4   Trimestriel
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q23b if (s11q22==1 & inlist(s11q04, 6,7,8) | s11q21==1 & !inlist(s11q04, 6,7,8))

* ----------------------------------------------------------------------------
* VARIABLE : s11q24 
* ÉTIQUETTE : 11.24. Est-ce que le ménage achète de l'eau auprès des vendeurs ou auprès d'un autre ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q24 


* ----------------------------------------------------------------------------
* VARIABLE : s11q25 
* ÉTIQUETTE : 11.25. Quel est le montant de ces dépenses au cours des 30 derniers jours? (En FCFA)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q25 if (s11q24==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q25, 5))==0 | s11q25==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant renseignée doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Le montant doit être supérieur à 0

s11q25>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q25 if (s11q24==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q26a 
* ÉTIQUETTE : 11.26a. Quelle est la principale source d'approvisionnement en eau de boisson du ménage en saison sèche?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Dans le logement
*   2   Dans la cour/Concession
*   3   Robinet du voisin
*   4   Borne fontaine/Robinet public
*   5   Puits ouvert dans la cour/Concession
*   6   Puits ouvert ailleurs
*   7   Puits couvert dans la cour/Concession
*   8   Puits couvert ailleurs
*   9   Forage dans la concession
*   10  Forage ailleurs
*   11  Source aménagé
*   12  Source non aménagée
*   13  Fleuve/Rivière/Lac/Barrage
*   14  Eau en bouteille
*   15  Eau de pluie
*   16  Vendeur ambulant
*   17  Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q26a 


* ----------------------------------------------------------------------------
* VARIABLE : s11q26a_autre 
* ÉTIQUETTE : 11.26a. Autre
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q26a_autre if (s11q26a==18)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q26a==18)
local n_oth = r(N)
di as result "Variable -s11q26a_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q26a_autre if (s11q26a==18)


* ----------------------------------------------------------------------------
* VARIABLE : s11q26b 
* ÉTIQUETTE : 11.26b. Quelle est la principale source d'approvisionnement en eau de boisson  du ménage en saison des pluies?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Dans le logement
*   2   Dans la cour/Concession
*   3   Robinet du voisin
*   4   Borne fontaine/Robinet public
*   5   Puits ouvert dans la cour/Concession
*   6   Puits ouvert ailleurs
*   7   Puits couvert dans la cour/Concession
*   8   Puits couvert ailleurs
*   9   Forage dans la concession
*   10  Forage ailleurs
*   11  Source aménagé
*   12  Source non aménagée
*   13  Fleuve/Rivière/Lac/Barrage
*   14  Eau en bouteille
*   15  Eau de pluie
*   16  Eau en sachet
*   17  Vendeur ambulant
*   18  Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q26b 


* ----------------------------------------------------------------------------
* VARIABLE : s11q26b_autre 
* ÉTIQUETTE : 11.26b. Autre
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q26b_autre if (s11q26b==18)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q26b==18)
local n_oth = r(N)
di as result "Variable -s11q26b_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q26b_autre if (s11q26b==18)


* ----------------------------------------------------------------------------
* VARIABLE : s11q33 
* ÉTIQUETTE : 11.33. Le ménage est-il connecté à un réseau électrique?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui, ménage connecté au réseau
*   2   Oui, ménage connecté chez le voisin
*   3   Connecté directement au poteau
*   4   Non, ménage non connecté
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q33 


* ----------------------------------------------------------------------------
* VARIABLE : s11q34 
* ÉTIQUETTE : 11.34.  Est-ce que le service d'électricité est compris dans le loyer?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q34 if (inrange(s11q04, 5, 8) & inlist(s11q33, 1, 2))


* ----------------------------------------------------------------------------
* VARIABLE : s11q35 
* ÉTIQUETTE : 11.35. Quel type d'abonnement le ménage dispose-t-il?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Compteur classique
*   2   Compteur avec carte prépayée
*   3   Les deux
*   4   Additionneuse/Décompteur
*   5   Sans Compteur
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q35 if (inlist(s11q33, 1, 2) | inlist(s11q34, 2, 3))


* ----------------------------------------------------------------------------
* VARIABLE : s11q36a 
* ÉTIQUETTE : 11.36a. Quel est le montant de la dernière facture d'électricité ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q36a if (s11q33==3 | !inlist(s11q04, 6,7,8) & inlist(s11q33, 1,2) | inlist(s11q04, 6,7,8) & s11q34==2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q36a, 5))==0 | s11q36a==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant renseigné doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s11q36a>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q36a if (s11q33==3 | !inlist(s11q04, 6,7,8) & inlist(s11q33, 1,2) | inlist(s11q04, 6,7,8) & s11q34==2)


* ----------------------------------------------------------------------------
* VARIABLE : s11q36b 
* ÉTIQUETTE : 11.36b. Périodicité de la dernière facture
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Hebdomadaire
*   2   Mensuel
*   3   Tous les 2 mois
*   4   Trimestriel
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q36b if (inlist(s11q34, 2,3))


* ----------------------------------------------------------------------------
* VARIABLE : s11q37 
* ÉTIQUETTE : 11.37. Quelle est la principale source d'éclairage du logement?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Electricité réseau
*   2   Electricité (générateur)
*   3   Lampe à pétrole
*   4   Lampe à pile
*   5   Paraffine/Bois/Planche
*   6   Plaque solaire
*   7   Autre
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q37 


* ----------------------------------------------------------------------------
* VARIABLE : s11q37_autre 
* ÉTIQUETTE : 11.37.autre. Préciser
* TYPE : Texte, avec masque
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q37_autre if (s11q37==7)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q37==7)
local n_oth = r(N)
di as result "Variable -s11q37_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q37_autre if (s11q37==7)


* ----------------------------------------------------------------------------
* VARIABLE : s11q48 
* ÉTIQUETTE : 11.48. Quel est le type de connexion internet utilisé par le ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Réseau téléphonique commuté (modem)
*   2   ADSL
*   3   Fibre optique (Haut débit)
*   4   Satellite
*   5   Accès Mobile (clé internet, Wi-FI, etc.)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q48 if (s11q45==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q49 
* ÉTIQUETTE : 11.49.Le ménage utilise t-il une chaine de television par cable, satelitte, TNT?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q49 


* ----------------------------------------------------------------------------
* VARIABLE : s11q50 
* ÉTIQUETTE : 11.50. Est-ce que l'abonnement à la télé par câble/satellite/TNT est compris dans le loyer?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q50 if (inrange(s11q04, 5, 8) & s11q49==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q51a 
* ÉTIQUETTE : 11.51a Quel est le montant de la facture du dernier mois? (En FCFA)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q51a if (s11q50==2 & inlist(s11q04, 6,7,8) | s11q49==1 & !inlist(s11q04, 6,7,8))

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s11q51a, 5))==0 | s11q51a==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. Le montant renseigné doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s11q51a>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Le montant semble invraisemblable. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s11q51a.InRange(500, 300000) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q51a if (s11q50==2 & inlist(s11q04, 6,7,8) | s11q49==1 & !inlist(s11q04, 6,7,8))


* ----------------------------------------------------------------------------
* VARIABLE : s11q51b 
* ÉTIQUETTE : 11.51b. Périodicité de la dernière facture
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Hebdomadaire
*   2   Mensuel
*   3   Tous les 2 mois
*   4   Trimestriel
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q51b if (s11q51a>0)


* ----------------------------------------------------------------------------
* VARIABLE : s11q52 
* ÉTIQUETTE : 11.52. Quels sont les deux principaux combustibles utilisés par le ménage pour la cuisine ?
* TYPE : Catégorielle: à réponses multiples, checkbox
* MODALITÉS : 
*   1   Bois ramassé
*   2   Bois acheté
*   3   Charbon de bois
*   4   Gaz
*   5   Electricité
*   6   Pétrole/Huile
*   7   Déchets d'animaux
*   8   Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

qui: d s11q52__*, varlist
local  = r(varlist)

foreach s11q52_var of local s11q52_vars {
    check_if_miss `s11q52_var' 
}


* ----------------------------------------------------------------------------
* VARIABLE : s11q52_autre 
* ÉTIQUETTE : 11.52. autre
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q52_autre if (s11q52__8 == 1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q52__8 == 1)
local n_oth = r(N)
di as result "Variable -s11q52_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q52_autre if (s11q52__8 == 1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q54 
* ÉTIQUETTE : 11.54. Quel type de sanitaire votre ménage utilise-t-il?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   W.C. int. avec chasse d'eau
*   2   W.C. ext. avec chasse d'eau
*   3   W.C. int. chasse d'eau manuelle
*   4   W.C. ext. chasse d'eau manuelle
*   5   Latrines VIP (dallées, ventillées)
*   6   Latrines ECOSAN (dallées, couvertes)
*   7   Latrines SANPLAT (dallées, non couvertes)
*   8   Latrines dallées simplement
*   9   Fosse rudimentaire/trou ouvert
*   10  Toilettes publiques
*   11  Aucune toilette (dans la nature)
*   12  Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q54 


* ----------------------------------------------------------------------------
* VARIABLE : s11q54_autre 
* ÉTIQUETTE : 11.54.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q54_autre if (s11q54==12)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q54==12)
local n_oth = r(N)
di as result "Variable -s11q54_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q54_autre if (s11q54==12)


* ----------------------------------------------------------------------------
* VARIABLE : s11q55 
* ÉTIQUETTE : 11.55. Le ménage partage-t-il ces sanitaires avec d'autres ménages?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q55 if (inlist(s11q54, 1,2,3,4,5,6,7,8,9,12))


* ----------------------------------------------------------------------------
* VARIABLE : s11q56 
* ÉTIQUETTE : 11.56. Combien d'autres ménages utilisent ces sanitaires?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q56 if (s11q55==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : ERREUR. La valeur renseigner ne peut être nulle. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s11q56>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Le nombre d'autres ménages utilisant ces sanitaires semble invraisemblable. Veuillez vérifier..

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s11q56 <= 30 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s11q56 if (s11q55==1)


* ----------------------------------------------------------------------------
* VARIABLE : s11q57 
* ÉTIQUETTE : 11.57. Comment les excréments sont-ils évacués principalement?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Egout
*   2   Fosse septique
*   3   Fosse étanche
*   4   Fosse simple
*   5   Compost
*   6   Rue/Cour/Caniveau/Nature
*   7   Autre
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q57 if (!mi(s11q54) & !inlist(s11q54, 10, 11))


* ----------------------------------------------------------------------------
* VARIABLE : s11q57_autre 
* ÉTIQUETTE : 11.57.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q57_autre if (s11q58==7)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q58==7)
local n_oth = r(N)
di as result "Variable -s11q57_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q57_autre if (s11q58==7)


* ----------------------------------------------------------------------------
* VARIABLE : s11q58 
* ÉTIQUETTE : 11.58. Comment le ménage se débarrasse-t-il  des excréments?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Camion vidangeur
*   2   Transfert dans un trou
*   3   Eau de pluie, cours d'eau
*   4   Vidange manuelle
*   5   Autre (à préciser)
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q58 if (!mi(s11q54) & !inlist(s11q54, 10, 11))


* ----------------------------------------------------------------------------
* VARIABLE : s11q58_autre 
* ÉTIQUETTE : 11.58.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q58_autre if (s11q58==5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q58==5)
local n_oth = r(N)
di as result "Variable -s11q58_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q58_autre if (s11q58==5)


* ----------------------------------------------------------------------------
* VARIABLE : s11q59 
* ÉTIQUETTE : 11.59. Quel est le principal mode d'évacuation des eaux usées du ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Puisard (fosse moderne)
*   2   Egout
*   3   Trou dans la parcelle
*   4   Dans la rue/nature
*   5   Autre
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q59 


* ----------------------------------------------------------------------------
* VARIABLE : s11q59_autre 
* ÉTIQUETTE : 11.59.autre. Préciser
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s11q59_autre if (s11q59==5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s11q59==5)
local n_oth = r(N)
di as result "Variable -s11q59_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s11q59_autre if (s11q59==5)
