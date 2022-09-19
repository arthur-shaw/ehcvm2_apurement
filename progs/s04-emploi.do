capture log using "$proj_dir/s04.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$clean_menage/$menages_cle", clear
merge 1:m interview__id interview__key using "$clean_menage/$membres_cle", keep(1 3) nogen
merge 1:1 interview__id interview__key s04q00a using "$raw_menage/$s04a", keep(1 3) nogen
merge 1:1 interview__id interview__key s04q00a using "$raw_menage/$s04b", keep(1 3) nogen
merge 1:1 interview__id interview__key s04q00a using "$raw_menage/$s04c", keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)
local membre_du_menage "((preload_pid != . & s01q00a == 1) | (preload_pid == .)) | (s01q12 == 1 | s01q13 == 1)"
keep if ((AgeAnnee >= 5) & (`membre_du_menage'))


* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s04q01 
* ÉTIQUETTE : 4.01. Au cours des 7 derniers jours, combien d'heures  [NOM]  a consacré à faire des courses au marché  pour lui-même ou son ménage sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q01 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Est il possible que la masse horaire hbdomadaire pour le marché dépasse 14?. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Il est peu plausible que le nombre d'heures hebdomadaire consacré à faire des courses au marché soit supérieur à 14
s04q01.InRange(0,14) | s04q01==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q01 

* ----------------------------------------------------------------------------
* VARIABLE : s04q02a 
* ÉTIQUETTE : 4.02a. Au cours des 7 derniers jours combien d'heures [NOM] a consacré à la cuisine et la vaisselle pour son propre ménage sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q02a 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q02a 

* ----------------------------------------------------------------------------
* VARIABLE : s04q02b 
* ÉTIQUETTE : 4.02b. Au cours des 7 derniers jours combien d'heures [NOM] a consacré à la lessive pour son propre ménage sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q02b 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q02b 


* ----------------------------------------------------------------------------
* VARIABLE : s04q02c 
* ÉTIQUETTE : 4.02c. Au cours des 7 derniers jours combien d'heures [NOM] a consacré aux travaux ménagers de la maison ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

* NB: variable manquante en GNB
capture check_if_miss s04q02c 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

* NB: variable manquante en GNB
capture lister_vals_extremes s04q02c 


* ----------------------------------------------------------------------------
* VARIABLE : s04q03 
* ÉTIQUETTE : 4.03. Au cours des 7 derniers jours, combien d'heures  [NOM]  a consacré à la garde des enfants, des personnes âgées ou malades pour son propre ménages sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q03 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur renseignée semble moins plausible. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Il est peu plausible que le nombre d'heure hebdomadaire consacré à la garde des enfants ou des personnes âgées soit supérieur à 28
s04q03.InRange(0,28) | s04q03==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q03 


* ----------------------------------------------------------------------------
* VARIABLE : s04q04 
* ÉTIQUETTE : 4.04. Au cours des 7 derniers jours, combien d'heures  [NOM]  a t-il consacré pour aller chercher de l'eau pour son propre ménage sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q04 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur renseignée semble moins plausible. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Il est peu plausible que le nombre d'heure hebdomadaire consacré pour aller chercher de l'eau soit supérieur à 14 
s04q04<=14 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q04 


* ----------------------------------------------------------------------------
* VARIABLE : s04q05 
* ÉTIQUETTE : 4.05. Au cours des 7 derniers jours, combien d'heures  [NOM]  a t-il consacré pour aller chercher du bois pour son propre ménage sans rémunération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q05 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur renseignée semble moins plausible. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Il est peu plausible que le nombre d'heure hebdomadaire consacré pour aller chercher du bois soit supérieur à 14 
s04q05<=14 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : La somme de 4.01 à 4.05 semble moins plausible. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Le temps de travail hebdomadaire ne peut être supérieur à 112

new [] {s04q01,s04q02a, s04q02b, s04q03,s04q04,s04q05}.Sum(x => x == 9999? 0 : x) <112 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q05 


* ----------------------------------------------------------------------------
* VARIABLE : s04q05a 
* ÉTIQUETTE : 4.05a. Au cours des 7 derniers jours combien de temps  [NOM] a t-il consacré à aider les enfants à reviser leurs leçons sans rénumération?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q05a 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q05a 


* ----------------------------------------------------------------------------
* VARIABLE : s04q06 
* ÉTIQUETTE : 4.06. Au cours des 7 derniers jours,  [NOM]  a-t-il travaillé au moins une heure dans un champ ou jardin lui appartenant ou [NOM] a-t-il élevé des animaux, pratiqué la pêche ou la chasse pour son propre compte?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q06 


* ----------------------------------------------------------------------------
* VARIABLE : s04q07 
* ÉTIQUETTE : 4.07. Au cours des 7 derniers jours,  [NOM]  a-t-il travaillé au moins une heure, avec rémunération (en nature ou en argent), dans un commerce, une activité de transformation, ou un service marchand pour son propre compte ou pour le compte d'un autre membre du ménage? Par exemple comme artisan, commerçant ou avocat, médecin ou autre travail indépendant?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q07 


* ----------------------------------------------------------------------------
* VARIABLE : s04q08 
* ÉTIQUETTE : 4.08. Au cours des 7 derniers jours,  [NOM]  a-t-il travaillé au moins une heure, pour une entreprise, pour l'Etat, pour un patron ou toute autre personne qui n'est pas  membre de votre ménage? (même à temps partiel ou de manière occasionnelle)
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q08 


* ----------------------------------------------------------------------------
* VARIABLE : s04q09 
* ÉTIQUETTE : 4.09. Au cours des 7 derniers jours,  [NOM]  a-t-il travaillé au moins une heure comme apprenti ou stagiaire avec rénumération (en nature ou en argent)?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q09 


* ----------------------------------------------------------------------------
* VARIABLE : s04q11 
* ÉTIQUETTE : 4.11. Même si   [NOM]  n'a pas travaillé au cours des 7 derniers jours, possède-t-il/elle un emploi qu'il/elle aurait dû exercer au cours de ces 7 derniers jours?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q11 if (s04q10 == 0)


* ----------------------------------------------------------------------------
* VARIABLE : s04q13 
* ÉTIQUETTE : 4.13. [NOM] a déclaré n’avoir exercé aucune activité au cours des 7 derniers jours, [NOM] a t-il/elle néanmoins travaillé dans un champ, jardin, pour un autre membre du ménage sans rémunération?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q13 if (s04q11==2)


* ----------------------------------------------------------------------------
* VARIABLE : s04q14 
* ÉTIQUETTE : 4.14. [NOM] a déclaré n’avoir exercé aucune activité au cours des  7 derniers jours, [NOM] a t-il/elle néanmoins travaillé dans un commerce, activité de transformation, activité de service pour un autre membre du ménage sans rémunération ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q14 if (s04q13==2)


* ----------------------------------------------------------------------------
* VARIABLE : s04q15 
* ÉTIQUETTE : 4.15.[NOM] a-t-il cherché un emploi rémunéré au cours des 30 derniers jours?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q15 if (s04q13==1 |s04q14==1)


* ----------------------------------------------------------------------------
* VARIABLE : s04q17 
* ÉTIQUETTE : 4.17. [NOM] a-t-il cherché un emploi rémunéré au cours des 30 derniers jours?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q17 if (s04q14==2)


* ----------------------------------------------------------------------------
* Condition pour 4B
* ----------------------------------------------------------------------------

#delim;
local condit_4b "
(
(s04q06 == 1 | s04q07 == 1 | s04q08 == 1 | s04q09 == 1)

|

!mi(s04q12)

|

!mi(s04q15)

|

(!mi(s04q28a) | !mi(s04q28b))
)

&

($membre_du_menage)
";
#delim cr

* ----------------------------------------------------------------------------
* VARIABLE : s04q30a 
* ÉTIQUETTE : 4.30a. Quelle est  l'activité de l'entreprise dans laquelle   [NOM]  a exercé son emploi ou quels produits (services) fabrique (fournit) t-elle?
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q30a if (`condit_4b')

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Veuillez être plus précis dans la description, avec un texte d'au moins 10 caractères

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q30a.Length>10 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s04q30b 
* ÉTIQUETTE : 4.30b. CODE DE SECTION
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Agriculture, sylviculture et pêche
*   2   Activités extractives
*   3   Activités de fabrication
*   4   Production et distribution d’électricité, de gaz, de vapeur et climatisation
*   5   Distribution d’eau; réseau d’assainissement; gestion des déchets et activités de remise en état
*   6   Construction
*   7   Commerce de gros et de détail, réparations de véhicules automobiles et de motocycles
*   8   Transport et entreposage
*   9   Activités d’hébergement et de restauration
*   10  Information et communication
*   11  Activités financières et d’assurances
*   12  Activités immobilières
*   13  Activités professionnelles, scientifiques et techniques
*   14  Activités de services administratifs et d’appui
*   15  Administration publique et défense; sécurité sociale obligatoire
*   16  Éducation
*   17  Santé et et activités d’action sociale
*   18  Arts, spectacles et loisirs
*   19  Autres activités de services
*   20  Activités des ménages privés employant du personnel domestique; activités non différenciées de production de biens et de services des ménages privés pour usage propre
*   21  Activités des organisations et organismes extra-territoriaux
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q30b if (`condit_4b')


* ----------------------------------------------------------------------------
* VARIABLE : s04q30c 
* ÉTIQUETTE : 4.30c CODE DE BRANCHE D'ACTIVITÉ
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Culture et production animale, chasse et activités de services connexes
*   2   Sylviculture et exploitation forestière
*   3   Pêche, aquaculture
*   5   Extraction de charbon et de lignite
*   6   Extraction de pétrole brut et de gaz naturel
*   7   Extraction de minerais métalliques
*   8   Autres activités extractives
*   9   Activités annexes de l’extraction
*   10  Fabrication de produits alimentaires
*   11  Fabrication de boissons
*   12  Fabrication de produits à base de tabac
*   13  Fabrication de textiles
*   14  Fabrication d’articles d’habillement
*   15  Fabrication de cuir et d’articles de cuir
*   16  Production de bois et d’articles en bois et en liège (sauf fabrication de meubles); fabrication d’articles de vannerie et de sparterie
*   17  Fabrication de papier et d’articles en papier
*   18  Imprimerie et reproduction de supports enregistrés
*   19  Cokéfaction et fabrication de produits pétroliers raffinés
*   20  Fabrication de produits chimiques
*   21  Fabrication de préparations pharmaceutiques, de produits chimiques à usage médicinal et de produits d’herboristerie
*   22  Fabrication d’articles en caoutchouc et en matières plastiques
*   23  Fabrication d’autres produits minéraux non métalliques
*   24  Fabrication de produits métallurgiques de base
*   25  Fabrication d’ouvrages en métaux (sauf machines et matériel)
*   26  Fabrication d’ordinateurs, d’articles électroniques et optiques
*   27  Fabrication de matériels électriques
*   28  Fabrication de machines et de matériel, n.c.a.
*   29  Construction de véhicules automobiles, de remorques et semi-remorques
*   30  Fabrication d’autres matériels de transport
*   31  Fabrication de meubles en bois et de matelas
*   32  Autres activités de fabrication
*   33  Réparation et installation de machines et de matériel
*   35  Production et distribution d’électricité, de gaz, de vapeur et climatisation
*   36  Collecte et traitement des eaux, distribution d’eau
*   37  Réseau d’assainissement
*   38  Collecte des déchets, activités de traitement et d’évacuation; récupération des matières
*   39  Activités de remise en état et autres services de traitement des déchets
*   41  Construction de bâtiments
*   42  Génie civil
*   43  Activités de construction spécialisées
*   45  Commerce de gros et de détail, réparation de véhicules automobiles et de motocycles
*   46  Commerce de gros à l’exception des véhicules automobiles et des motocycles
*   47  Commerce de détail à l’exception des véhicules automobiles et des motocycles
*   49  Transports terrestres, transport par conduites
*   50  Transports par eau
*   51  Transports aériens
*   52  Magasinage et activités annexes des transports
*   53  Activités de poste et de courrier
*   55  Hébergement
*   56  Activités de services de restauration et de consommation de boissons
*   58  Activités d’édition
*   59  Activités de production de films cinématographiques et vidéo, de programmes de télévision, d’enregistrements sonores et d’édition musicale
*   60  Activités de programmation et de diffusion par radio, télévision, internet
*   61  Télécommunications
*   62  Programmation informatique; conseils et activités connexes
*   63  Activités de services d’information
*   64  Activités de services financiers, à l’exception des assurances et des caisses de retraite
*   65  Activités d’assurances, réassurance et de caisses de retraite, à l’exception de la sécurité sociale obligatoire
*   66  Activités auxiliaires des services financiers et des assurances
*   68  Activités immobilières
*   69  Activités juridiques et comptables
*   70  Activités de bureaux principaux; activités de conseils en matière de gestion
*   71  Activités d’architecture et d’ingénierie; activités d’essais et d’analyses techniques
*   72  Recherche scientifique et développement
*   73  Publicité et études de marché
*   74  Autres activités professionnelles, scientifiques et techniques
*   75  Activités de services vétérinaires
*   77  Activités de location
*   78  Activités relatives à l’emploi
*   79  Activités des agences de voyages, voyagistes, services de réservation et activités connexes
*   80  Activités d’enquêtes et de sécurité
*   81  Activités des services concernant les bâtiments, architecture paysagère
*   82  Activités d’appui administratif, de secrétariat, et autres activités d’appui aux entreprises
*   84  Administration publique et défense; sécurité sociale obligatoire
*   85  Éducation
*   86  Activités relatives à la santé
*   87  Activités de soins de santé dispensés en établissement pour malades mentaux, persones agées
*   88  Activités d’action sociale sans hébergement
*   90  Activités créatives, arts et spectacles
*   91  Activités des bibliothèques, archives, musées et autres activités culturelles
*   92  Activités de jeux de hasard et de pari
*   93  Activités sportives et de loisirs et activités récréatives
*   94  Activités des organisations associatives
*   95  Activités de réparation d’ordinateurs et d’articles personnels et ménagers
*   96  Autres activités de services personnels
*   97  Activités des ménages privés employant du personnel domestique
*   98  Activités non différenciées de production de biens et de services des ménages privés pour usage propre
*   99  Activités des organisations et organismes extra-territoriaux
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q30c if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q30d 
* ÉTIQUETTE : 4.30d CODE D'ACTIVITÉ
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   111 Culture de mil, sorgho, maïs
*   112 Culture de riz
*   113 Culture de céréales et autres cultures n.c.a.
*   114 Culture de tubercules (igname, taro, manioc, banane-plantain, etc)
*   115 Culture d'arachide
*   116 Culture des autres oléagineux et legumineuses (niébé, haricot, autres graines oléagineuses, etc.)
*   117 Culture de légumes; horticulture ; pépinières
*   118 Culture de coton
*   119 Autres cultures temporaires
*   121 Culture de cacao, café, thé
*   122 Culture d'agrumes
*   123 Culture de mangue
*   124 Culture d'autres fruits tropicaux
*   125 Culture de palmier à huile
*   126 Culture de l'anacarde
*   127 Culture d'autres fruits oléagineux
*   128 Culture de plantes pour boisson ou épices
*   129 Autres cultures permanentes
*   141 Elevage de bovins
*   142 Elevage de caprins
*   143 Elevage d'ovins
*   144 Elevage de volaille
*   145 Elevage de cheveaux et autres équidés
*   146 Elevage de chameaux et autres camelidés
*   147 Elevage d'autres types d'animaux
*   148 Production de produits d'origine animale et activités annexes à l'élevage (activités d'appui)
*   149 Chasse, piégeage, repeuplement en gibier et activités annexes (capture d'animaux pour alimentation, fourrure, peau ou pour recherche, production de pelleteries, de peaux de reptiles, etc.)
*   210 Sylviculture et autres activités d'exploitation forestière (exploitation d'arbre sur pied, exploitation de taillis, de bois à pate et de chauffage, exploitation de pépinière)
*   220 Exploitation forestière (production de rondins, exloitation et production de bois de chauffage, production de charbon de bois, copeaux)
*   230 Cueillette (récolte de produits poussant à l'état sauvage: fruits à coque, gomme, etc.)
*   240 Activités annexes à la sylviculture et à l'exploitation forestière (inventaires forestiers, services de conseils en matière d'exploitation forestière, évaluation du bois, lutte et protection contre les incendies de forets)
*   310 Pêche maritime (pêche commerciale en haute mer et le long des côtes, ramassage crustacés et de mollusques, etc.)
*   320 Pêche continentale (pêche commerciale en eaux intérieures, ramassage de crustacés et mollusque en eaux douce, etc.)
*   330 Aquaculture: élevage et récolte d'espéce aquatique
*   510 Extraction de charbon et de lignite (extraction et exploitation de houille, charbon brun); extraction de tourbe
*   610 Extraction de pétrole brut et de gaz naturel
*   620 Activités annexes à l'extraction de pétrole brut et de gaz naturel (activités de prospection, forage et reforage dirigés, services de drainage et de pompage, etc.)
*   710 Extraction de minerais de fer
*   720 Extraction de minerais d'uranium
*   730 Extraction de minerais d'or
*   740 Extraction de minerais de métaux non ferreux n.c.a. (argent, platine, bauxite, cuivre, plomb, zinc, étain, manganèse, chrome, nickel, cobalt, molybdène, tantale, vanadium, etc.)
*   810 Extraction de pierres, de sables et d'argiles
*   820 Extraction d'engrais naturels et de minéraux pour l'industrie chimique
*   830 Activités extractives diverses
*   900 Activités annexes à l’extraction
*   1010    Abattage, transformation et conservation des viandes  (fabrication de conserves de viande)
*   1020    Transformation et conservation des poissons, crustacés et mollusques (préparation et conservation de poissons; exemple: conserves de sardines)
*   1030    Transformation et conservation de fruits et légumes (exemple: confitures, conserves de légumes, etc.)
*   1040    Fabrication de corps gras (huiles et graisses végétales et animales (arachides, coton, etc.), margarine, beurre de karité, beurre, etc.)
*   1050    Fabrication de produits laitiers (yaourt, lait caillé, etc.) et de glaces
*   1060    Travail des grains  (mouture de farines; mouture, nettoyage et polissage du riz; fabrication de mélanges de farines ou de pâtes préparés à partir de ces produits; mouture du maïs et des légumes))
*   1070    Fabrication de produits alimentaires à base de céréales n.c.a. (activités de boulangers et patissiers)
*   1080    Fabrication de produits alimentaires n.c.a.
*   1110    Fabrication de jus de fruits (locaux et industriels) et eau minérale
*   1120    Fabrication de sodas et autres boissons non-alcolisées
*   1130    Fabrication de bières et boissons à base de malte
*   1140    Fabrication de vins, spiritueux et autres boissons alcolisées
*   1210    Fabrication du tabac
*   1220    Fabrication de produits à base du tabac
*   1310    Filature, tissage et ennoblissement textile
*   1320    Fabrication d'étoffes et d'articles de bonneterie (pull-over, cardigans, chandails, gilets et articles similaires, chaussettes, collants)
*   1330    Fabrication d'autres articles textiles
*   1400    Fabrication d'articles d'habillement sauf chaussures (pret à porter et confection sur mesure; par exemple les tailleurs, couturiers font cette activité)
*   1510    Travail du cuir ; fabrication d'articles de voyage (sacs à main en cuir, sac de voyage, etc.)
*   1520    Fabrication de chaussures (exclusion: chaussures en matière plastique)
*   1610    Sciage et rabotage du bois (différent de travail de menuiserie)
*   1620    Fabrication d'articles en bois (bois d'oeuvre, contreplaqué, placage, emballage en bois, etc. sauf fabrication de meubles)
*   1630    Fabrication d'article en liège, vannerie et sparterie (objets tréssés ou confectionnés avec des fibres dures, en particulier issues de la noix de coco, du sisal (agave), du jute et de la ronce)
*   1700    Fabrication de papier, de carton et d'articles en papier ou en carton
*   1810    Édition (conceptions de produits d'imprimerie comme les esquisses, les maquettes, les documents électroniques,)
*   1820    Imprimerie (activités d'imprimerie de produits tels que journeaux, livres, revues périodiques, formulaires commerciaux, cartes de voeux et autres articles)
*   1830    Reproduction d'enregistrements (reproduction  de disques de gramophone, disques compacts et de bandes de musiques et autres enregistrements de sons à partir d'un original, reproduction de logiciels, etc.))
*   1910    Raffinage pétrolier
*   1920    Cokéfaction ; traitement de combustibles nucléaires
*   2010    Fabrication de produits chimiques de base (fabrication de gaz inorganiques industriels ou médicaux liquefiés ou comprimés, fabrication d'éléments chimiques, fabrication d'acides inorganiques)
*   2020    Fabrication d'engrais et de produits azotés
*   2110    Fabrication de produits pharmaceutiques
*   2120    Fabrication de savons et détergents, de parfums, de produits pour la toilette et de produits d'entretien
*   2130    Fabrication de peintures, vernis et produits similaires, d'encres d'imprimerie et de mastics
*   2140    Fabrication de pesticides et d'autres produits agrochimiques
*   2150    Fabrication d'autres produits chimiques, n.c.a
*   2160    Fabrication de fibres synthétiques (polyamides, polyesters, polyuréthannes, etc.) ou artificielles (viscose, acétate de cellulose, etc.)
*   2210    Fabrication de produits en caoutchouc (pneumatiques, bandes transporteuses, éponges, produits moulés, chaussures, tuyaux, manchons de cylindres, adhésifs, imperméabilisants, dos ou envers de tapis en latex, produits en mousse)
*   2220    Fabrication de produits en matières plastiques sauf chaussures (sacs, films, sachets, bidons, récipients et bouteilles souples (sauces, shampoing, crèmes …))
*   2310    Fabrication de verre et d'articles en verre sous toutes les formes
*   2320    Fabrication de produits céramiques (vaisselle en céramique, statuettes et autres objest d'ornement en cérémique, pots, bocaux et articles similaires, mobilier en céramique)
*   2330    Fabrication de ciment, chaux, plâtre (pas d'articles en ciment, plâtre)
*   2340    Fabrication d'ouvrages en béton, en ciment et en plâtre (articles précoulés en béton, ciment ou pierre artificielle utilisés en contruction comme les carreaux, dalles, briques, panneaux, placoplâtre, tuyaux, colonnes, etc.)
*   2350    Taillage, façonnage et finissage de la pierre (Cette branche exclut la production de pierre de taille et les activités de sculpteurs)
*   2360    Fabrication d'autres produits minéraux non métalliques n.c.a. (exemple: mica tourbe, graphite, etc.)
*   2410    Sidérurgie et première transformation de l'acier
*   2420    Métallurgie et première transformation des métaux précieux et des métaux non ferreux
*   2430    Fonderie (fabrication de produits semi-finis et de divers produits obtenus par coulage de métal)
*   2510    Construction et menuiserie métalliques (portes, fenêtres, lits, etc.) ; fabrication de citernes, réservoirs et générateurs de vapeur
*   2520    Fabrication d'armes et de munitions
*   2530    Fabrication de coutellerie (cueillère, couteau, fourchette, etc.)
*   2540    Fabrication d'outils à main et de quincaillerie générale (Tôle, fer à béton, clous, vis, boulons, écrous, etc.)
*   2550    Forgeage, emboutissage, estampage et profilage du métal; métallurgie des poudres
*   2560    Traitement et revêtement des métaux; façonnage
*   2610    Fabrication de machines de bureau et de matériel informatique (ordinateurs, imprimantes, autres matériels périphériques)
*   2620    Fabrication d'équipements et appareils de radio, télévision et communication (téléphone portable, etc.)
*   2630    Fabrication d'instruments médicaux, de précision, d'optique et d'horlogerie
*   2700    Fabrication de machines et de matériels électriques (moteurs, génératrices et transformateurs électriques, batteries, accumulateurs, cables et dispositifs de cablage, appareils ménagers)
*   2810    Fabrication de machines et de matériel de bureau, à l'exception des ordinateurs et du matériel périphérique
*   2820    Fabrication de fours et de bruleurs
*   2830    Fabrication d'autres machines d'usage général (moteurs, turbines, matériel hydraulique, pompes, compresseurs, articles de robinetterie, matériel de levage et de manutation)
*   2840    Fabrication de machines agricoles et forestières (tracteurs, motoculteurs, tondeuses, machines agricoles pour la préparation du sol, la plantation de culture et distribution de l'engrais, machines pour la récolte et le battage)
*   2850    Fabrication de machines pour les mines, les carrières et la construction (appareils de levage et de transport à action continue pour travaux souterrains, machines et appareils à traiter les minéraux, etc.)
*   2860    Fabrication de machines pour le traitement alimentaire, des boissons (fabrication de sécheuses agricoles, écrémeuse, fabrication de presses et pressoirs, etc., machines pour la boulangerie, patisserie, biscuterie)
*   2870    Fabrication de machines pour le tabac
*   2880    Fabrication de machines pour les industries du textile, de l'habillement et des cuirs
*   2890    Fabrication d'autres machines d'usage spécifiques (machines de fabrication d'usage spécfiques non classés ailleurs)
*   2900    Construction de véhicules automobiles
*   3010    Construction et réparations  navales, aéronautiques et ferroviaires
*   3020    Fabrication de motocylces et véhicules pour invalides
*   3030    Fabrication de bicycles et autre appareils non motorisés (tricycles, etc.)
*   3040    Fabrication d'autres équipements de transport (véhicules militaires de combat, etc.)
*   3110    Fabrication de meubles en bois (fauteuils, lits, tables, chaises, armoires, etc.)
*   3120    Fabrication de portes et fenêtres en bois
*   3130    Fabrication de matelas
*   3210    Fabrication de bijouterie et d’articles similaires
*   3220    Fabrication d'instuments de musique, jeux, jouets, articles de sport
*   3230    Autres activités de fabrication, n.c.a.
*   3310    Réparation d’ouvrages en métaux, de machines et matériel
*   3320    Installation de machines et de matériel pour l’industrie
*   3510    Production et distribution d'électricité
*   3520    Production de gaz ; distribution par conduite de combustibles gazeux
*   3530    Production et distribution de vapeur et climatisation
*   3600    Collecte et traitement des eaux, distribution d’eau
*   3700    Réseau d’assainissement
*   3810    Collecte des déchets
*   3820    Traitement et évacuation des déchets
*   3830    Récupération des matières
*   3900    Activités de remise en état et autres services de traitement des déchets (assainissement, voirie et gestion des déchets)
*   4100    Construction de bâtiments
*   4210    Construction de routes et de voies ferrées
*   4220    Projets d’installation d’équipements collectifs (ponts, etc.)
*   4230    Autres projets de génie civil
*   4310    Démolition et préparation des sites
*   4320    Travaux d'installation d'électricité (câblage et accessoires électriques, câblage pour télécommunications, câblage pour réseau informatique et télévision, y compris les fibres optiques, etc)
*   4330    Travaux d'installation de matériel de plomberie, chauffage et climatisation
*   4340    Autres travaux d'installation (installations d'ascenseurs, escaliers mécaniques, portes automatiques et à tambour, conducteurs électriques, systémes de nettoyage par aspiration, installation de machines industrielles, etc.)
*   4350    Travaux de finition
*   4360    Location de matériel de construction avec opérateur
*   4510    Commerce de véhicules automobiles
*   4520    Entretien et réparation de véhicules automobiles
*   4530    Commerce de pièces détachées et d'accessoires automobiles
*   4550    Commerce de motocycles
*   4540    Réparation et entretien de motocycles
*   4560    Commerce de bicycles et autres moyen de locomotion
*   4570    Réparation de bicycles et autres moyen de locomotion
*   4610    Activités d'intermédiaires du commerce de gros (activités de commissionnaires, courtiers en marchandiseset tous grossistes agissant au nom et pour le compte d'autrui)
*   4620    Commerce de gros de produits agricoles bruts, d'animaux vivants, de produits alimentaires, boissons et tabacs
*   4630    Commerce de gros d'articles de ménage (textiles, habillement, chaussures, autres articles de ménage)
*   4640    Commerces de gros d'ordinateurs, de matériel périphérique et de logiciels d'ordinateurs
*   4650    Commerce de gros de machines, équipement et forunitures agricoles
*   4660    Commerce de gros de machines, d'équipements et fournitures industriels
*   4670    Commerce de gros d'autres machines et équipements
*   4680    Autres commerces de gros
*   4711    Commerce de détail général (alimentation, boutique, épicerie, …)
*   4712    Commerce de détail de tabacs
*   4721    Commerce de détail de céréales
*   4722    Commerce de détail de tubercules, banane plantain
*   4723    Commerce de détail de fruits et légumes
*   4724    Commerce de détail de produits d'élevage frais (viande, poissons, oeufs)
*   4725    Commerce de détail d’autres produits alimentaires
*   4730    Commerce de détail de carburants automobiles
*   4741    Commerce de détail d’ordinateurs, d’unités périphériques, de logiciels et de matériel de télécommunications
*   4742    Commerce de détail de matériel audio et vidéo en magasins spécialisés
*   4751    Commerce de détail de tissus
*   4752    Commerce de détail de vêtements, chaussures neufs (sauf articles de friperie)
*   4753    Commerce de détail de vêtements et chaussures d'occasion (friperie, etc.)
*   4754    Commerce de détail de quincaillerie, peinture et verrerie
*   4755    Commerce de détail d’appareils électroménagers, de meubles de maison
*   4760    Commerce de détail de livres, journaux et articles de papeterie
*   4770    Commerce de détail d’autres produits (y compris activités d’intermédiaire du commerce de détail)
*   4910    Transports ferroviaires
*   4920    Transports routiers de passagers
*   4930    Transports routiers de marchandises
*   4940    Transports par conduites (transport de gaz, liquides, eau, boues et autres produits par conduites, exploitation de stations de pompage)
*   5010    Transports maritimes et côtiers (bateaux d'excursion, de croisière, de tourisme, bacs, bateaux-taxi, etc.)
*   5020    Transports par voies navigables intérieurs (transports sur les cours d'eau, les canaux, lacs, autres voies d'eau intérieures)
*   5100    Transports aériens
*   5210    Manutention et entreposage (chargement et déchargement de marchandises ou des bagages des voyageurs quelque soit le modèle de transport utilisé)
*   5220    Exploitation d'infrastructures de transport
*   5230    Activités d'organisation des transports
*   5310    Activités de poste (levée, tri, acheminement, et distribution nationale ou internationale de lettres et colis, ramassage de lettres/courrier et colis, distribution et livraison de courrier et de colis)
*   5320    Activités de courrier (Levée, tri, acheminement, et distribution du courrier, de colis et de paquets, Services de livraison à domicile)
*   5500    Hôtels, auberges, et autres moyens d'hébergement de courte durée
*   5610    Restaurants, maquis et autres
*   5620    Activités de restauration en kiosque
*   5630    Débits de boisson
*   5800    Édition de livres, d'annuaires et de fichiers d'adresses, de journaux, revues professionnelles et périodiques
*   5910    Activités de production de films cinématographiques et vidéo, et de programmes de télévision
*   5920    Activités d’enregistrement du son et d’édition musicale
*   6010    Radiodiffusion
*   6020    Activités de production et de diffusion de programmes de télévision
*   6030    Activités de production et de diffusion de contenu sur internet
*   6110    Activités de télécommunications par câble
*   6120    Activités de télécommunications sans fil
*   6130    Activités de télécommunications par satellite
*   6140    Autres activités de télécommunications
*   6210    Conseil informatique et développements logiciels
*   6220    Maintenance de matériels informatiques et d'équipements de bureau
*   6230    Autres activités informatiques
*   6310    Traitement de données, hébergement et activités connexes
*   6320    Portails d’entrée sur le Web
*   6330    Activités d’agence de presse
*   6340    Autres activités de services d’information, n.c.a.
*   6410    Intermédiation monétaire (activité de banque centrale et autres services d'intermédiation)
*   6420    Activités de société de portefeuille
*   6430    Fonds fiduciaires, fonds et entités financières analogues (Activités de fonds d'investissement)
*   6440    Services de transferts d'argent
*   6500    Activités d'assurances, réassurance et de caisses de retraite, (sauf sécurité sociale)
*   6610    Activités d'auxiliaires financiers (exploitation et supervision de marchés financiers autrement par des organismes publics tels que contrats d'échange de produits, contrats d'échanges de produits à terme, ect., activités de courtage)
*   6620    Activités d'auxiliaires d'assurance  (activités d'évaluation des déclarations de sinistres, réglement des déclarations de sisnistres, activités des agents d'assurance et des courtiers, services d'actuaires, etc.)
*   6810    Activités immobilières sur biens propres (services de logement, services de locations d'autres biens immobiliers)
*   6820    Activités des agences immobilières
*   6910    Activités de cabinets d'avocats
*   6920    Activités juridiques (huissiers, notaires, etc.)
*   6930    Activités comptables et d’audit, conseil fiscal
*   7010    Activités de bureaux principaux
*   7020    Activités de conseils en matière de gestion
*   7100    Activités d'architecture, d'ingénierie et autres activités techniques
*   7210    Recherche et développement expérimental en sciences physiques et naturelles et en ingénierie
*   7220    Recherche et développement expérimental en sciences sociales et humaines
*   7310    Agences de publicité
*   7320    Bureaux d'études de marché
*   7410    Activités de conception de modèles
*   7420    Activités photographiques
*   7490    Autres activités scientifiques et techniques, n.c.a.
*   7500    Activités vétérinaires
*   7710    Location de matériels de transport
*   7720    Location de machines et équipements n.c.a.
*   7730    Location d'articles personnels et domestiques n.c.a.
*   7810    Activités des agences de placement
*   7820    Activités des agences d’emploi temporaire
*   7890    Autres activités de fourniture de personnel
*   7900    Activités des agences de voyages, voyagistes, services de réservation et activités connexes
*   8010    Activités de services de sécurité privés
*   8020    Activités des services de systèmes de sécurité
*   8030    Activités d’enquête (détectives, etc)
*   8110    Activités d’appui aux installations intégrées
*   8120    Nettoyage général des bâtiments
*   8130    Autres activités de nettoyage de bâtiments et de nettoyage industriel
*   8140    Activités des services d’entretien des espaces verts
*   8210    Activités des services intégrés d’appui administratif
*   8220    Photocopie, scanner, préparation de documents et autres activités spécialisées d’appui aux bureaux
*   8230    Activités des centres d’appel
*   8240    Organisation de congrès et de foires commerciales
*   8250    Activités des agences de recouvrement et de crédit
*   8260    Activités de conditionnement
*   8290    Autres activités de services aux entreprises, n.c.a.
*   8410    Activités d'administration générale, économique et sociale
*   8420    Activités de prérogative publique (Affaires étrangères, activités de défense, activités de maintien de l'ordre et de la sécurité publics)
*   8430    Sécurité sociale obligatoire (activité de sécurité sociale obligatoire)
*   8510    Activités d’enseignement préprimaire et primaire
*   8521    Activités d’enseignement secondaire général
*   8522    Activités d’enseignement secondaire technique et professionnel
*   8530    Activités d’enseignement supérieur
*   8541    Activités d’enseignement lié aux sports et aux loisirs
*   8542    Activités d’enseignement à caractère culturel
*   8549    Autres activités d’enseignement, n.c.a.
*   8550    Activités d’appui pédagogique
*   8610    Activités hospitalières
*   8620    Activités de pratique médicale et dentaire
*   8690    Autres activités relatives à la santé
*   8710    Installations de soins de santé en établissement hospitalier
*   8720    Activités de soins de santé pour retardés mentaux, malades mentaux et toxicomanes
*   8730    Activités de soins de santé en établissement hospitalier pour les personnes âgées et les handicapés
*   8790    Autres activités de soins de santé en établissement hospitalier
*   8800    Activités d’action sociale sans hébergement pour les personnes âgées et les handicapés (par exemple, directement chez le client)
*   9000    Activités créatives, arts et spectacles
*   9110    Activités des bibliothèques et archives
*   9120    Activités des musées et exploitation de sites et monuments historiques
*   9130    Activités des jardins botaniques et zoologiques et des réserves naturelles
*   9200    Activités de jeux de hasard et de pari
*   9310    Exploitation d’installations sportives, Activités des clubs sportifs, et autres activités sportives
*   9320    Activités des parcs d’attraction et à thèmes, Autres activités récréatives et de loisirs, n.c.a.
*   9410    Activités d’organisations associatives économiques, patronales et professionnelles
*   9420    Activités des syndicats de travailleurs
*   9490    Activités d’autres organisations associatives (réligieuses, politiques, etc.)
*   9511    Réparation d’ordinateurs et de matériel périphérique
*   9512    Réparation de matériel de communication
*   9521    Réparation de biens de consommation : matériel électronique
*   9522    Réparation d’appareils ménagers et de matériel pour la maison et le jardin
*   9523    Réparation de chaussures et d’articles de cuir
*   9524    Réparation de mobilier et de meubles de maison
*   9529    Réparation d’autres articles personnels et ménagers
*   9611    Lavage et repassage de linge
*   9612    Lavage et nettoyage à sec de textiles
*   9620    Coiffure et autres soins esthétiques
*   9630    Activités de pompes funèbres et activités connexes
*   9690    Autres activités de services personnels, n.c.a.
*   9700    Activités des ménages en tant qu'employeurs de personnel domestique
*   9800    Activités non différenciées de production de biens et de services des ménages privés pour usage propre
*   9910    Activités des ambassades ou consulats
*   9920    Activités des organismes internationnaux
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q30d if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q31 
* ÉTIQUETTE : 4.31. Quel est le principal employeur de  [NOM]  dans cet emploi?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Etat/Collectivités locales
*   2   Entreprise publique/ parapublique
*   3   Entreprise Privée
*   4   Entreprise associative
*   5   Ménage comme employeur de personnel domestique
*   6   Organisme international /Ambassade
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q31 if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q32 
* ÉTIQUETTE : 4.32. Combien de mois  [NOM]  a-t-il exercé cet emploi au cours des 12 derniers mois (y compris les congés payés)?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q32 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur incorrecte. L'année ne compte que 12 mois. Veuillez coriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q32<=12 | s04q32==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q32 if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q33 
* ÉTIQUETTE : 4.33.  [NOM]  bénéficie t-il de congés payés?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q33 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur de coherence! Si c'est le privé ou l'Etat/programme qui finance l'assurance maladie alors le bénéficiaire a droit à une prise en charge particulière.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    
//Si le privé ou l'Etat/programme qui finance l'assurance maladie
s04q31.InList(1,2)?
//alors le bénéficiaire a droit à une prise en charge particulière
s04q33==1:
//Tout autre cas est vrai
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s04q34 
* ÉTIQUETTE : 4.34. De combien de jours de congé annuel  [NOM]  a t-il joui au cours des 12 dernièrs mois?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q34 if (s04q33==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Il est moins plausible d'avoir plus de 60 jours (3 mois) de congé dans l'année. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q34.InRange(1,60) | s04q34==9999  
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Le nombre de jours de congés ne peut dépasser celui du travail. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // Le nombre de jours de congés doit être inférieur...
(s04q34 <
//...au nombre de jours de travail.
(s04q32*30))

| 

// ou ne sait pas
s04q34==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q34 if (s04q33==1)


* ----------------------------------------------------------------------------
* VARIABLE : s04q36 
* ÉTIQUETTE : 4.36. Combien de jours par mois  [NOM]  consacre-t-il  habituellement à cet emploi ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q36 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur incorrecte. Le mois moyen ne compte que 30 jours. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q36.InRange(1,30) | s04q36==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q36 if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q37 
* ÉTIQUETTE : 4.37. Combien d'heures par jour  [NOM]  consacre-t-il  habituellement à cet emploi ?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q37 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Valeur renseignée semble être moins plausible. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q37<=16 | s04q37==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q37 if (`condit_4b') 


* ----------------------------------------------------------------------------
* VARIABLE : s04q39 
* ÉTIQUETTE : 4.39. Quel est la catégorie socioprofessionnelle de  [NOM]  dans cet emploi ?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Cadre supérieur
*   2   Cadre moyen/agent de maîtrise
*   3   Ouvrier ou employé qualifié
*   4   Ouvrier ou employé non qualifié
*   5   Manœuvre, aide ménagère
*   6   Stagiaire ou Apprenti rénuméré
*   7   Stagiaire ou Apprenti non rénuméré
*   8   Travailleur Familial contribuant pour une entreprise familial
*   9   Travailleur pour compte propre
*   10  Patron
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q39 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur de cohérence entre 4.31 et  4.39

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si Aide familiale, travaille pour son propre compte ou Patron à 4.38
s04q39.InList(8,9,10)?
//alors son employeur à 4.30 devra être Entreprise privée
s04q31==3:
// dans tous les autres cas c'est vrai 
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : ERREUR: La catégorie socio-professionnelle--%s04q39%--n'est pas en phase avec les réponses aux questions 4.06, 4.07, 4.08, 4.09, 4.13, et 4.14. Veuillez confirmer les réponses à ces questions et à la présente question, et le cas échéant corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si travailleur dans une entreprise familiale...
s04q39 == 8 ?

// confirmer que les réponses précédentes sont conformes avec ce statut socio-professional
(CountValue(2, s04q06, s04q07, s04q08, s04q09) == 4) & (s04q13==1 | s04q14==1) :

// dans tout les autres cas, OK
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s04q43 
* ÉTIQUETTE : 4.43. Quel a été le salaire de  [NOM]  pour cet emploi (pour la période de temps considérée)?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q43 if (s04q39<7)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s04q43, 5))==0 | s04q43==9999)

//Ou égal au code de "Ne Sait Pas" qu'est 9999

|

s04q43==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q43 if (s04q39<7)

* ----------------------------------------------------------------------------
* VARIABLE : s04q43_unite 
* ÉTIQUETTE : 4.43. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   SEMAINE
*   2   MOIS
*   3   TRIMESTRE
*   4   AN
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q43_unite if (s04q43>0 & s04q43!=9999)


* ----------------------------------------------------------------------------
* VARIABLE : s04q45 
* ÉTIQUETTE : 4.45. A combien évaluez-vous les primes (uniquement ceux qui ne sont pas inclus dans le salaire)?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q45 if (s04q44==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5 ou égal à 9999 ou 0 

((mod(s04q45, 5))==0 | s04q45==9999) | s04q45== 9999 | s04q45==0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : INCOHERENCE: Vous avez indiqué tantôt que le répondant bénéficie d'une prime. Or, ici, vous indiquez une prime de 0 FCFA.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q45 > 0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q45 if (s04q44==1)


* ----------------------------------------------------------------------------
* VARIABLE : s04q45_unite 
* ÉTIQUETTE : 4.45. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   SEMAINE
*   2   MOIS
*   3   TRIMESTRE
*   4   AN
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q45_unite if (s04q45>0 & s04q45!=9999)


* ----------------------------------------------------------------------------
* VARIABLE : s04q47 
* ÉTIQUETTE : 4.47. A combien évaluez-vous ces avantages ( uniquement ceux qui ne sont pas inclus dans le salaire)?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q47 if (s04q46==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5 ou égal à 9999 ou 0 

((mod(s04q47, 5))==0 | s04q47==9999) | s04q47== 9999 | s04q47==0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : INCOHERENCE: Vous avez indiqué tantôt que le répondant bénéficie d'avantages. Or, ici, vous indiquez que la valeur est de 0 FCFA.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s04q47 > 0 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q47 if (s04q46==1)


* ----------------------------------------------------------------------------
* VARIABLE : s04q47_unite 
* ÉTIQUETTE : 4.47. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   SEMAINE
*   2   MOIS
*   3   TRIMESTRE
*   4   AN
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q47_unite if (s04q47>0 & s04q47!=9999)


* ----------------------------------------------------------------------------
* VARIABLE : s04q49 
* ÉTIQUETTE : 4.49. A combien évaluez-vous cette nourriture?
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q49 if (s04q48==1)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Le montant renseigné ne s’apparente pas à un montant en FCFA car n’est pas un multiple de 5. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //L’on vérifie que le montant renseigné est un multiple de 5

((mod(s04q49, 5))==0 | s04q49==9999)

//Ou égal au code de "Ne Sait Pas" qu'est 9999

|

s04q49==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s04q49 if (s04q48==1)


* ----------------------------------------------------------------------------
* VARIABLE : s04q49_unite 
* ÉTIQUETTE : 4.49. Unité
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   SEMAINE
*   2   MOIS
*   3   TRIMESTRE
*   4   AN
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q49_unite if (s04q49>0 & s04q49!=9999)


* ----------------------------------------------------------------------------
* VARIABLE : s04q50 
* ÉTIQUETTE : 4.50. En plus de l'emploi principal qui vient d'être décrit,  [NOM]  a-t-il exercé un emploi secondaire au cours des 12 derniers mois?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s04q50 if (`condit_4b') 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. %rostertitle% a déclaré en 4.28 ne pas avoir d'activité secondaire. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membre a une activité secondaire en 4.28 alors

s04q28b<6?

//la réponse en 4.50 est OUI

s04q50==1:

//Tout autre cas est vrai
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Erreur. %rostertitle% a déclaré en 4.28 avoir une activité secondaire. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le m'embre n'a pas une activité secondaire 4.28 alors

s04q28b==6?

//La réponse en 4.50 est NON alors

s04q50==2:

//Tout autre cas est vrai
true
 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

local s4_id_vars "interview__key interview__id grappe id_menage vague s04q00a s04q00b"

* section 4a
preserve

    keep `s4_id_vars' s04q00_0 - s04q28b
    save "$clean_menage/$s04a", replace

restore

* section 4b
preserve

    keep `s4_id_vars' s04q29a - s04q50b
    save "$clean_menage/$s04b", replace

restore

* section 4c
preserve

    keep `s4_id_vars' s04q51a - s04q50b s04q64_controle__*
    save "$clean_menage/$s04b", replace

restore

log close
