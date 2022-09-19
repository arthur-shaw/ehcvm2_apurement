log using "$proj_dir/s00.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$brute/$s00", clear

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)


* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : grappe 
* ÉTIQUETTE : grappe
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss grappe 


* ----------------------------------------------------------------------------
* VARIABLE : id_menage 
* ÉTIQUETTE : Identifiant du ménage
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss id_menage 


* ----------------------------------------------------------------------------
* VARIABLE : vague 
* ÉTIQUETTE : Vague
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss vague 



* ----------------------------------------------------------------------------
* VARIABLE : grappe, id_menage, vague
* OBJECTIF: identifier des doublons
* ----------------------------------------------------------------------------

capture isid grappe id_menage vague
if _rc != 0 {

    di as error "ERROR: Il y a des doublons"
    duplicates grappe id_menage vague
    duplicates list grappe id_menage vague, sepby(grappe id_menage vague)

}

* ----------------------------------------------------------------------------
* VARIABLE : s00q00 
* ÉTIQUETTE : 0.00. Pays
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Benin
*   2   Burkina Faso
*   3   Côte d'Ivoire
*   4   Guinée Bissau
*   5   Mali
*   6   Niger
*   7   Sénégal
*   8   Togo
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q00 


* ----------------------------------------------------------------------------
* VARIABLE : s00q01 
* ÉTIQUETTE : 0.01. Région
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Région1
*   2   Région2
*   3   Région3
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q01 


* ----------------------------------------------------------------------------
* VARIABLE : s00q02 
* ÉTIQUETTE : 0.02. Département
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Département1
*   2   Département2
*   3   Département3
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q02 


* ----------------------------------------------------------------------------
* VARIABLE : s00q03 
* ÉTIQUETTE : 0.03. Commune
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Commune1
*   2   Commune2
*   3   Commune3
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q03 


* ----------------------------------------------------------------------------
* VARIABLE : s00q04 
* ÉTIQUETTE : 0.04. Milieu de résidence
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Urbain
*   2   Rural
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q04 


* ----------------------------------------------------------------------------
* VARIABLE : s00q05 
* ÉTIQUETTE : 0.05. Village/Quartier
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q05 


* ----------------------------------------------------------------------------
* VARIABLE : s00q06 
* ÉTIQUETTE : 0.06. Nº de la Zone de dénombrement (ZD)
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q06 


* ----------------------------------------------------------------------------
* VARIABLE : s00q07 
* ÉTIQUETTE : 0.07. Numéro du ménage dans la ZD
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07 


* ----------------------------------------------------------------------------
* VARIABLE : s00q07a 
* ÉTIQUETTE : 0.07a. Type de ménage
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Ménage résident
*   2   Ménage dans un camp de déplacés internes ou de réfugiés
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07a 


* ----------------------------------------------------------------------------
* VARIABLE : s00q07b 
* ÉTIQUETTE : 0.07b. Votre ménage habite-t-il cette localité depuis moins de 5 ans ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07b if (s00q07a==1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q07d 
* ÉTIQUETTE : 0.07d. Le ménage a t-il été interviewé lors de l'enquête ménage en 2018/2019
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07d if (s00q07a==1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q07e 
* ÉTIQUETTE : 0.07e. Le ménage occupait-il le même logement lors de l’enquête de 2018/19
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07e if (s00q07d==1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q07f1 
* ÉTIQUETTE : 0.07F1.Numéro de Grappe en 2018/2019
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07f1 if (s00q07e==1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q07f2 
* ÉTIQUETTE : 0.07F2. Numéro du ménage en 2018/2019
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q07f2 if (s00q07e==1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q22 
* ÉTIQUETTE : 0.22. Nombre de visites nécessaires pour administrer le questionnaire
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q22 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Attention le nombre de visites (%self%) est élevé, Vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s00q22.InRange(1,10) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s00q22 


* ----------------------------------------------------------------------------
* VARIABLE : visite1 
* ÉTIQUETTE : ENQUETEUR: VEUILLEZ COCHEZ LA PREMIERE VISITE<font>
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   1ère visite
*   2   2ième visite
*   3   3ième visite
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss visite1 if (s00q22>=1)


* ----------------------------------------------------------------------------
* VARIABLE : s00q23a 
* ÉTIQUETTE : 0.23a. Date de début de visite
* TYPE : Date, horodatage
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q23a if (visite1==1)


* ----------------------------------------------------------------------------
* VARIABLE : visite2 
* ÉTIQUETTE : ENQUETEUR: VEUILLEZ COCHEZ LA DEUXIEME VISITE<font>
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   1ère visite
*   2   2ième visite
*   3   3ième visite
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss visite2 if (visite1==1 & & !mi(s00q23b))


* ----------------------------------------------------------------------------
* VARIABLE : s00q24a 
* ÉTIQUETTE : 0.24a. Date de début de visite
* TYPE : Date, horodatage
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q24a if (visite2==2)


* ----------------------------------------------------------------------------
* VARIABLE : visite3 
* ÉTIQUETTE : ENQUETEUR: VEUILLEZ COCHEZ LA TROISIEME VISITE<font>
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   1ère visite
*   2   2ième visite
*   3   3ième visite
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss visite3 if (!mi(s00q24b))


* ----------------------------------------------------------------------------
* VARIABLE : s00q25a 
* ÉTIQUETTE : 0.25a. Date de début de visite
* TYPE : Date, horodatage
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q25a if (visite3==3)


* ----------------------------------------------------------------------------
* VARIABLE : s00q08 
* ÉTIQUETTE : 0.08. Résultat de l'interview
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Rempli, ménage sélectionné
*   2   Rempli, ménage de remplacement
*   3   Non rempli
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q08 


* ----------------------------------------------------------------------------
* VARIABLE : s00q09 
* ÉTIQUETTE : 0.09. Motif
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Abandon
*   2   Refus
*   3   Logement Vacant
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q09 if (s00q08==3)








* ----------------------------------------------------------------------------
* VARIABLE : s00q27 
* ÉTIQUETTE : 0.27. Résultat du questionnaire
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Complet
*   2   Partiel
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s00q27 








* ----------------------------------------------------------------------------
* VARIABLE : observation 
* ÉTIQUETTE : Enquêteur: Veuillez enregistrer vos observations éventuelles
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss observation 

* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s00", replace
log close
