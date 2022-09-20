log using "$proj_dir/s09.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09a",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s09aq03 
* ÉTIQUETTE : 9A.03. Quel est le montant total de cette dépense en alimentation?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09aq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09aq03, 5))==0 | s09aq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09aq03, by(s09aq01) 


* ----------------------------------------------------------------------------
* VARIABLE : s09aq04 
* ÉTIQUETTE : 9A.04. Quel est le montant total de cette dépense en boissons?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09aq04 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09aq04, 5))==0 | s09aq04==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09aq04 


* ----------------------------------------------------------------------------
* VARIABLE : s09aq05 
* ÉTIQUETTE : 9A.05. Quel est le montant total de cette dépense en habits, chaussures et bijoux?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09aq05 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09aq05, 5))==0 | s09aq05==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09aq05 


* ----------------------------------------------------------------------------
* VARIABLE : s09aq06 
* ÉTIQUETTE : 9A.06. Quel est le montant total de cette dépense en location de salles, de chaises, et autres locations?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09aq06 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09aq06, 5))==0 | s09aq06==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09aq06 


* ----------------------------------------------------------------------------
* VARIABLE : s09aq07 
* ÉTIQUETTE : 9A.07. Quel est le montant total des autres dépenses non alimentaires ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09aq07 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09aq07, 5))==0 | s09aq07==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La somme de toutes les dépenses (9A.03+9A.04+9A.05+9A.06+9A.06) doit être supérieur à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La somme de toutes les dépenses doit être supérieur à 0

s09aq03+s09aq04+s09aq05+s09aq06+s09aq07>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09aq07 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09a", replace


* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09b",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)


* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s09Bq03 
* ÉTIQUETTE : 9B.03. Quel est le montant dépensé au cours des 7 derniers jours pour l'achat de [NOM]?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09bq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09Bq03, 5))==0 | s09Bq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La dépense renseignée doit être supérieure à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépense doit être supérieur à 0

s09Bq03>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09bq03, by(s09bq01) 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09b", replace


* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09c",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s09Cq03 
* ÉTIQUETTE : 9D.03. Quel est le montant dépensé au cours des 30 derniers jours? pour l'achat de [NOM]?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09cq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09Cq03, 5))==0 | s09Cq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La dépenses renseignée doit être supérieure à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s09Cq03>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09cq03, by(s09cq01) 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09c", replace


* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09d",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s09Dq03 
* ÉTIQUETTE : 9D.03. Quel est le montant dépensé au cours des 3 derniers mois pour l'achat de [NOM]?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09dq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09Dq03, 5))==0 | s09Dq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La dépenses renseignée doit être supérieure à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s09Dq03>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09dq03, by(s09dq01) 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09d", replace


* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09e",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s09Eq03 
* ÉTIQUETTE : 9E.03. Quel est le montant dépensé au cours des 6 derniers mois pour l'achat de [NOM]?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09eq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09Eq03, 5))==0 | s09Eq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La dépenses renseignée doit être supérieure à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s09Eq03>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09eq03, by(s09eq01) 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09e", replace


* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$raw_menage/$s09f",  keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)


* ----------------------------------------------------------------------------
* VARIABLE : s09Fq03 
* ÉTIQUETTE : 9F.03. Quel est le montant dépensé au cours des 12 derniers mois pour l'achat de [NOM]?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s09fq03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s09Fq03, 5))==0 | s09Fq03==9999) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. La dépenses renseignée doit être supérieure à 0.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //La dépenses doit être supérieur à 0

s09Fq03>0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s09fq03, by(s09fq01) 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s09f", replace

log close
