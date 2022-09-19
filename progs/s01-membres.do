log using "$proj_dir/s01.log", replace

* ============================================================================
* Préparer les données
* ============================================================================

* charger les données
use "$raw_menage/$s01", clear
merge m:1 interview__id interview__key using "$raw_menage/$s00", keepusing(s00q08) keep(1 3) nogen

* ne retenir que les observations d'intérêt
keep if inlist(s00q08, 1, 2)

* ============================================================================
* Apurer les données
* ============================================================================

* ----------------------------------------------------------------------------
* VARIABLE : s01q00a 
* ÉTIQUETTE : 1.00a. [NOM] est-il toujours un membre de ce ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   OUI
*   2   NON
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q00a if (preload_pid!=.)

* ----------------------------------------------------------------------------
* VARIABLE : s01q00b 
* ÉTIQUETTE : Why did [NOM] leave this household?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Etait visiteur
*   2   Mariage
*   3   Divorce/Séparation
*   4   Décès (COVID-19)
*   5   Décès (Autre cause)
*   6   Poursuivre les études ailleurs dans le pays
*   7   Affectation ou autre emploi ailleurs dans le pays
*   8   Perte de son emploi
*   9   Chercher du travail ailleurs  dans le pays
*   10  Migration à.cause du COVID-19
*   11  Migration dans le pays (santé, famille, etc.)
*   12  Poursuivre les études ailleurs à l'étranger
*   13  Autre migration pour l'étranger
*   14  Autres à préciser
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q00b if (s01q00a==2)

* ----------------------------------------------------------------------------
* VARIABLE : s01q00b_autre 
* ÉTIQUETTE : Autre. Précisez
* TYPE : Texte
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q00b_autre if (s01q00b==14)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Exploiter les réponses 'autre'
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* compter
qui: count if (s01q00b==14)
local n_oth = r(N)
di as result "Variable -s01q00b_autre- a `n_oth' valeurs autre"

* identifier des opportunités de reclasser
list interview__id s01q00b_autre if (s01q00b==14)

* ----------------------------------------------------------------------------
* VARIABLE : s01q00d 
* ÉTIQUETTE : 1.00d. [NOM]  est-il un nouveau membre du ménage ou une personne oubliée lors de l'enquête de 2018/19?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Nouveau membre
*   2   Oublié ( e )
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q00d if (preload_pid==. && s00q07d==1)

* ----------------------------------------------------------------------------
* VARIABLE : s01q01 
* ÉTIQUETTE : 1.01. Quel est le sexe de [NOM] 
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Masculin
*   2   Féminin
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q01 if (s01q00a!=2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. Il est peu probable que le chef de ménage et son époux (se) soient du même sexe. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Nous vérifions que le chef de ménage et son/ses conjointe(s) 
ne sont pas du même sexe. Deux cas de figures:
1. Si le membre est le chef de ménage alors il n'a aucune 
conjointe qui soit du même sexe que lui

2. Si le membre est conjointe du chef de ménage alors
le chef de ménage n'est pas du même sexe que lui



//Si le membre est le chef de ménage alors...

s01q02== 1 ?

//...il n'a aucune conjointe qui soit du même sexe que lui

membres.Count (x=>x.s01q02 ==2 & x.s01q01 ==s01q01) ==0:

//Si le membre est conjointe du chef de ménage alors...

s01q02== 2 ?

//...le chef de ménage n'est pas du même sexe que lui

membres.Count (x=>x.s01q02==1 & x.s01q01==s01q01) ==0:

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Attention: Au premier passage %rostertitle% était de sexe %preload_sex%

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    preload_sex!=null?
 s01q01==preload_sex:
 true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* ----------------------------------------------------------------------------
* VARIABLE : s01q02 
* ÉTIQUETTE : 1.02. Quel est le lien de parenté de  [NOM]  avec le chef de ménage?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Chef de ménage
*   2   Conjoint ( e )
*   3   Fils, Fille
*   4   Père, Mère
*   5   Petit fils, petite fille
*   6   Grand-parents
*   7   Frère, sœur
*   8   Neveu/Nièce
*   9   Autres Parents du CM/Conjoint
*   10  Personne non apparentée au CM/Conjoint
*   11  Domestique ou parent du domestique
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q02 if (s01q00a!=2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. Il ne peut avoir deux chefs de ménage dans un même ménage. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Nous véfifions ici que le ménage ne contient qu'un seul chef 
de ménage

//Si le membre est chef de ménage alors...

s01q02== 1 ?

//... il est le seul a avoir été déclaré comme comme chef de 
ménage dans le ménage

membres.Count(x=>x.s01q02==1)==1:

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Incohérence. Il est peu probable qu'une femme soit mariée à plus d'un homme dans le même ménage. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Nous vérifions qu'il n'y a pas de femme dans le ménage qui ait
plus d'un mari.
La vérification portera uniquement sur les femmes déclarées 
comme étant chef de ménage.


//Si le chef de ménage est une femme alors....

membres.Count(x=> x.s01q01==2 & x.s01q02==1)==1?

//... elle a soit au plus un époux

membres.Count(x=> x.s01q01==1 & x.s01q02==2)<=1:

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : Incohérence. Il est peu probable qu'une femme soit chef de ménage alors que son conjoint vit dans le ménage. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Il est moins probable qu'une femme soit chef de ménage et
que son mari soit dans le ménage.
On vérifie donc pour toute femme chef de ménage qu'elle n'a pas
conjoint dans le ménage


//Si le membre est conjoint du chef de ménage alors....

s01q01==1 & s01q02==2 ?

// on vérifie qu'il n'y a aucune femme chef de ménage

membres.Count(x=> x.s01q01==2 & x.s01q02==1)==0:

//tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 4 : Incohérence. Un autre membre a déjà été désigné comme père du chef de ménage. Ce dernier ne peut pas avoir plus d'un père. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Vérifie qu'il n'a pas plus d'un membre désigné comme père 
du CM

membres.Count(x=> x.s01q01==1 & x.s01q02==4)<=1 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 5 : Incohérence. Un autre membre a déjà été désigné comme mère du chef de ménage. Ce dernier ne peut pas avoir plus d'une mère. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Vérifie qu'il n'a pas plus d'un membre désigné comme mère 
du CM

membres.Count(x=> x.s01q01==2 & 
x.s01q02==4)<=1 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* ----------------------------------------------------------------------------
* VARIABLE : s01q03a 
* ÉTIQUETTE : 1.03a. Quelle est la date de naissance de  [NOM]  ? Jour de naissance
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q03a if (s01q00a!=2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : La valeur renseignée est incorrecte. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Jour de naissance compris entre 1 et 31
s01q03a.InRange(1,31) 
| 
//Ne sait pas le jour de naissance
s01q03a==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s01q03a if (s01q00a!=2)

* ----------------------------------------------------------------------------
* VARIABLE : s01q03b 
* ÉTIQUETTE : 1.03b. Mois de naissance
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Janvier
*   2   Février
*   3   Mars
*   4   Avril
*   5   Mai
*   6   Juin
*   7   Juillet
*   8   Août
*   9   Septembre
*   10  Octobre
*   11  Novembre
*   12  Décembre
*   9999    Ne sait pas
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q03b if (s01q00a!=2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence entre le jour et le mois de naissance. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // Nous vérifions ici que le mois de naissance renseigné
correspond bien au jour de naissance. 

Par exemple, l'on ne peut naître le 31 juin.


//Si le mois de naissance est égal à 3, 5, 7, 8, 10, 12 alors...

s01q03b.InList(1,3,5,7,8,10,12)?

// ... le jour doit être inférieur ou égal à 31 ou égal à 9999

s01q03a<=31 | s01q03a==9999:

// Si le mois de naissance est égal à 4, 6, 9, 11 alors...

s01q03b.InList(4,6,9,11)?

// ... le jour est inférieur ou égal à 30 ou égal à 9999

s01q03a<=30 | s01q03a==9999:

// Si le mois de naissance est égal à 2 alors...

s01q03b==2?

// ... le jour est inférieur ou égal à 30 ou égal à 9999

s01q03a<=29 | s01q03a==9999:

//Si le mois de naissance n'est pas connu alors...

s01q03b==9999?

//... ... le jour doit être inférieur ou égal à 31 ou égal à 9999

s01q03a<=31 | s01q03a==9999:

false 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* ----------------------------------------------------------------------------
* VARIABLE : s01q03c 
* ÉTIQUETTE : 1.03c. Année de naissance
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q03c if (s01q00a!=2)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : La valeur renseignée semble peu probable. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // année de naissance comprise entre 1922 et l'année en cours...
s01q03c.InRange(1922,s00q23a.Value.Year)

|

// ... ou "ne sait pas"
s01q03c==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : Incohérence. La date de naissance renseignée n'est pas valide. Veuillez vérifier le jour, le mois et l'année de naissance.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // Nous vérifions ici que la date de naissance (jour, mois, 
année) correspond à une date valide. 
La véfication se fera que si le jour, mois année de nassance 
sont connus.


// si le jour, mois année de nassance sont connus alors...

s01q03c!=9999 & s01q03b!=9999 & s01q03a!=9999?

// ...la combinaison année-mois-jour doit être une date valide

IsDate( (double?) s01q03c, (double?) s01q03b, (double?) s01q03a ):

// sinon, rien à vérifier
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : ERREUR: Différence d'âge entre le chef et son enfant n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET ENFANT DOIT ÊTRE 14+ ANS 
    - POUR CM mâle 14+ ANS
    - POUR CM femelle 12+ ANS
============================================================================ 

// CM == mâle 
s01q02==1 & s01q01==1 ? !membres.Any(x=>x.s01q02==3 & (AgeAnnee-x.AgeAnnee)<14) :   // si CM mâle
s01q02==3 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<14) : // si enfant du CM mâle

// CM == mâle 
s01q02==1 & s01q01==2 ? !membres.Any(x=>x.s01q02==3 & (AgeAnnee-x.AgeAnnee)<12) :   // si CM femelle
s01q02==3 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<12) : // si enfant du CM femelle

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 4 : ERREUR: Différence d'âge entre le chef et ses parents n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES PARENTS
    - POUR PÈRE 14+ ANS
    - POUR MÈRE 12+ ANS
============================================================================ 

// père 
s01q02==1 ? !membres.Any(x=>x.s01q02==4 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<14) : // si CM
s01q02==4 & s01q01==1 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<14) :   // si père

// mère 
s01q02==1 ? !membres.Any(x=>x.s01q02==4 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<12) : // si CM
s01q02==4 & s01q01==2 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<12) :   // si mère

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 5 : ERREUR: Différence d'âge entre le chef et ses grand parents n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES GRANDPARENTS
    - POUR GRAND PÈRE: 25+ ANS
    - POUR GRANDE MÈRE: 23+ ANS
============================================================================ 

// GRAND PÈRE 
s01q02==1 ? !membres.Any(x=>x.s01q02==6 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<25) : // si CM
s01q02==6 & s01q01==1 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<25) :   // si grand père

// GRANDE MÈRE 
s01q02==1 ? !membres.Any(x=>x.s01q02==6 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<23) : // si CM
s01q02==6 & s01q01==2 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<23) :   // si grande mère

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 6 : ERREUR: Différence d'âge entre le chef et ses petits enfants n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES PETITS ENFANTS
    - POUR CM MÂLE: 25+ ANS
    - POUR CM FEMELLE: 23+ ANS
============================================================================ 

// CM MÂLE 
s01q02==1 & s01q01==1 ? !membres.Any(x=>x.s01q02==5 & (AgeAnnee-x.AgeAnnee)<25) :   // si CM
s01q02==5 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<25) : // si petit enfant

// CM FEMELLE 
s01q02==1 & s01q01==2 ? !membres.Any(x=>x.s01q02==5 & (AgeAnnee-x.AgeAnnee)<23) :   // si CM
s01q02==5 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<23) : // si petit enfant

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 7 : Incohérence. %rostertitle% a %AgeAnnee% ans. Il est donc moins probable qu'il (elle) soit marié(e) à cet âge. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //On vérifie pour:
1. toute femme conjointe du chef de ménage qu'elle a au moins
12 ans
2. tout homme conjoint du chef de ménage qu'il a au moins 15 ans


// si le membre est coinjointe du chef de ménage ...

s01q02==2 & s01q01==1? 

//... alors il a au moins 15 ans

AgeAnnee>=15 | s01q03c==9999:

// si le membre est coinjoint du chef de ménage ...

s01q02==2 & s01q01==2? 

//... alors il a au moins 12 ans

AgeAnnee>=12 | s01q03c==9999:

// tout autre cas est vrai
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 8 : Incohérence. En tant que chef de ménage, il est peu probable que %rostertitle% ait moins de 15 ans. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // On s'assure ici que le chef de ménage a au moins 15 ans 


// si le membre est chef de ménage alors...

s01q02==1 ? 

// ...on vérifier que la personne est âgé d'au moins 15 ans
AgeAnnee>=15 | s01q03c==9999:

// tout autre cas est vrai
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 9 : Erreur. La date de naissance ne peut pas être postérieure à la date votre entretien avec le ménage. Veuillez corriger

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si l'annee de naissance est ègale à l'annee en cours, mois de naissance connu et jour de naissance inconu alors

s01q03c==s00q23a.Value.Year & s01q03b!=9999 & s01q03a==9999 ?

//le mois de naissance est inferieur au mois en cours ou

(s01q03b<=s00q23a.Value.Month):

//Si l'annee de naissance est ègale à l'annee en cours, jour et mois de naissance connu alors

s01q03c==s00q23a.Value.Year & s01q03b!=9999 & s01q03a!=9999 ?

//le mois de naissance est inferieur au mois en cours ou

(s01q03b<=s00q23a.Value.Month)

|

//le mois de naissance est egal au mois en cours et le jour de naissance inferieur au jour en cours

(s01q03b==s00q23a.Value.Month & s01q03a<=s00q23a.Value.Day) :

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 10 : ERREUR. La date de naissance intervient après la date de l'entretien. Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // si tous les éléments de la date de naissance sont connus...
CountValue(9999, s01q03c, s01q03b, s01q03a) == 0 ?

// ... vérifier que la date d'entretien intervient avant la date de naissance
s00q23a >= (new DateTime ((int)s01q03c, (int)s01q03b, (int)s01q03a)) :

// si seulement le jours et inconnu
(s01q03c != 9999) & (s01q03b != 9999) & (s01q03a == 9999) ?

(new DateTime (s00q23a.Value.Year, s00q23a.Value.Month, (int) 1)) >=
    (new DateTime ((int)s01q03c, (int)s01q03b, (int) 1)) :

// si le jour est mois sont inconnus
(s01q03c != 9999) & (s01q03b == 9999) & (s01q03a == 9999) ?

s00q23a.Value.Year >= s01q03c :

// sinon, impossible de comparer
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s01q03c if (s01q00a!=2)

* ----------------------------------------------------------------------------
* VARIABLE : s01q04a 
* ÉTIQUETTE : 1.04a. Quel âge avait [NOM] à son dernier anniversaire? ANS
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q04a if (s01q00a!=2 && s01q03c==9999)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. Il est peu probable que %rostertitle% ait plus de 100 ans. Veuillez vérifier

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    s01q04a.InRange(0,100) 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 2 : ERREUR: Différence d'âge entre le chef et son enfant n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET ENFANT DOIT ÊTRE 
    - POUR CM mâle 14+ ANS
    - POUR CM femelle 12+ ANS
============================================================================ 

// CM == mâle 
s01q02==1 & s01q01==1 ? !membres.Any(x=>x.s01q02==3 & (AgeAnnee-x.AgeAnnee)<14) :   // si CM mâle
s01q02==3 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<14) : // si enfant du CM mâle

// CM == mâle 
s01q02==1 & s01q01==2 ? !membres.Any(x=>x.s01q02==3 & (AgeAnnee-x.AgeAnnee)<12) :   // si CM femelle
s01q02==3 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<12) : // si enfant du CM femelle

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 3 : ERREUR: Différence d'âge entre le chef et ses parents n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES PARENTS
    - POUR PÈRE 14+ ANS
    - POUR MÈRE 12+ ANS
============================================================================ 

// père 
s01q02==1 ? !membres.Any(x=>x.s01q02==4 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<14) : // si CM
s01q02==4 & s01q01==1 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<14) :   // si père

// mère 
s01q02==1 ? !membres.Any(x=>x.s01q02==4 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<12) : // si CM
s01q02==4 & s01q01==2 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<12) :   // si mère

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 4 : ERREUR: Différence d'âge entre le chef et ses petits enfants n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES PETITS ENFANTS
    - POUR CM MÂLE: 25+ ANS
    - POUR CM FEMELLE: 23+ ANS
============================================================================ 

// CM MÂLE 
s01q02==1 & s01q01==1 ? !membres.Any(x=>x.s01q02==5 & (AgeAnnee-x.AgeAnnee)<25) :   // si CM
s01q02==5 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<25) : // si petit enfant

// CM FEMELLE 
s01q02==1 & s01q01==2 ? !membres.Any(x=>x.s01q02==5 & (AgeAnnee-x.AgeAnnee)<23) :   // si CM
s01q02==5 ? !membres.Any(x=>x.s01q02==1 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<23) : // si petit enfant

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 5 : ERREUR: Différence d'âge entre le chef et ses grand parents n'est pas vraisemblable. Veuillez corriger soit l'âge de l'un ou de l'autre.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // ============================================================================
ÉCART D'ÂGE ENTRE CM ET SES GRANDPARENTS
    - POUR GRAND PÈRE: 25+ ANS
    - POUR GRANDE MÈRE: 23+ ANS
============================================================================ 

// GRAND PÈRE 
s01q02==1 ? !membres.Any(x=>x.s01q02==6 & x.s01q01==1 & (x.AgeAnnee-AgeAnnee)<25) : // si CM
s01q02==6 & s01q01==1 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<25) :   // si grand père

// GRANDE MÈRE 
s01q02==1 ? !membres.Any(x=>x.s01q02==6 & x.s01q01==2 & (x.AgeAnnee-AgeAnnee)<23) : // si CM
s01q02==6 & s01q01==2 ? !membres.Any(x=>x.s01q02==1 & (AgeAnnee-x.AgeAnnee)<23) :   // si grande mère

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 6 : Incohérence. En tant que chef de ménage, il est peu probable que %rostertitle% ait moins de 12 ans. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // On s'assure ici que le chef de ménage a au moins 12 ans 


// si le membre est chef de ménage alors...

s01q02==1 ? 

// ...on vérifier que la personne est âgé d'au moins 12 ans
AgeAnnee>=12:

// tout autre cas est vrai
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 7 : Incohérence. %rostertitle% a %AgeAnnee% ans. Il est donc moins probable qu'il (elle) soit marié(e) à cet âge. Veuillez vérifier.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //On vérifie pour:
1. toute femme conjointe du chef de ménage qu'elle a au moins
12 ans
2. tout homme conjoint du chef de ménage qu'il a au moins 15 ans


// si le membre est coinjointe du chef de ménage ...

s01q02==2 & s01q01==1? 

//... alors il a au moins 15 ans

s01q04a>=15:

// si le membre est coinjoint du chef de ménage ...

s01q02==2 & s01q01==2? 

//... alors il a au moins 12 ans

s01q04a>=12:

// tout autre cas est vrai
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* VALIDATION 8 : Attention: Au premier passage %rostertitle% était agé de %preload_age%

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    preload_age !=null?
 s01q04a>=AgeAnnee+1 & s01q04a<=AgeAnnee+2:
true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s01q04a if (s01q00a!=2 && s01q03c==9999)

* ----------------------------------------------------------------------------
* VARIABLE : s01q04b 
* ÉTIQUETTE : 1.04b. MOIS
* TYPE : Numerique, entier
* MODALITÉS : 
*   N/A
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q04b if (s01q04a<5)

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Incohérence. Le nombre de mois ne peut pas dépasser 12. Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    // vérifier que l'âge en mois est entre 0 et 12
s01q04b.InRange(0,12) | s01q04b==9999 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs extrêmes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

lister_vals_extremes s01q04b if (s01q04a<5)


* ----------------------------------------------------------------------------
* VARIABLE : s01q11 
* ÉTIQUETTE : 1.11.  [NOM]  est-il présent au moment de l'enquête?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Présent vu
*   2   Présent non vu
*   3   Absent
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q11 

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Valider les réponses
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

* VALIDATION 1 : Erreur. %rostertitle% est le répondant. Alors la seule réponse possible pour %rostertitle% à cette question devrait donc être "Présent vu". Veuillez corriger.

    /* -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  
    Expression de SuSo à traduire en Stata:
    
    //Si le membre en cours est le répondant alors...

s01q00_0 == 1?

//la réponse doit être Présent vu

s01q11==1:

//Tout autre cas est vrai

true 
    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   */     


* ----------------------------------------------------------------------------
* VARIABLE : s01q12 
* ÉTIQUETTE : 1.12.  [NOM]  vit-il de manière continue dans ce ménage depuis au moins 6 mois?
* TYPE : Catégorielle: à réponse unique
* MODALITÉS : 
*   1   Oui
*   2   Non
* ----------------------------------------------------------------------------

* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
* Identifier des valeurs manquantes
* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

check_if_miss s01q12 


* ============================================================================
* Sauvegarder le résultat
* ============================================================================

save "$clean_menage/$s01", replace

* ============================================================================
* Sauvegarder des variables de base pour les membres
* ============================================================================

* préparer les identifiants pour chaque section individu
foreach var in s01q00_a s02q00a s03q00a s04q00a s05q00a s06q00a s07aq00a {
    capture clonevar `var' = membres__id
}

* retenir les variables clé
keep $vars_cle_membre

* sauvegarder comme sortie
save "$clean_menage/$membres_cle", replace


log close
