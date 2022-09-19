* ============================================================================
* Paramètres
* ============================================================================

* ============================================================================
* Définir les répertoires, fichiers, et variables clé
* ============================================================================

* ----------------------------------------------------------------------------
* Répertoires
* ----------------------------------------------------------------------------

* programmes de service
global progs        "$proj_dir/progs/"

* données brutes
global raw          "$proj_dir/data/raw/"
global raw_menage   "$raw/menage/"
global raw_comm     "$raw/communautaire/"

* données de sortie
global clean        "$proj_dir/data/clean/"
global clean_menage "$clean/menage/"
global clean_comm   "$clean/communautaire/"

* ----------------------------------------------------------------------------
* Fichiers
* ----------------------------------------------------------------------------

global s00 "s00_me_`pays'_2021.dta" 
global s01 "s01_me_`pays'_2021.dta" 
global s02 "s02_me_`pays'_2021.dta" 
global s03 "s03_me_`pays'_2021.dta" 
global s04a "s04a_me_`pays'_2021.dta" 
global s04b "s04b_me_`pays'_2021.dta" 
global s04c "s04c_me_`pays'_2021.dta" 
global s05 "s05_me_`pays'_2021.dta" 
global s06 "s06_me_`pays'_2021.dta" 
global s07a_1 "s07a_1_me_`pays'_2021.dta" 
global s07a_2 "s07a_2_me_`pays'_2021.dta" 
global s07b "s07b_me_`pays'_2021.dta" 
global s08 "s08a_me_`pays'_2021.dta" 
global s09a "s09a_me_`pays'_2021.dta" 
global s09b "s09b_me_`pays'_2021.dta" 
global s09c "s09c_me_`pays'_2021.dta" 
global s09d "s09d_me_`pays'_2021.dta" 
global s09e "s09e_me_`pays'_2021.dta" 
global s09f "s09f_me_`pays'_2021.dta" 
global s10a "s10a_me_`pays'_2021.dta" 
global s10b "s10b_me_`pays'_2021.dta" 
global s11 "s11_me_`pays'_2021.dta" 
global s12 "s12_me_`pays'_2021.dta" 
global s13_1 "s13_1_me_`pays'_2021.dta" 
global s13_2 "s13_2_me_`pays'_2021.dta" 
global s14a "s14a_me_`pays'_2021.dta" 
global s14b "s14b_me_`pays'_2021.dta" 
global s15 "s15_me_`pays'_2021.dta" 
global s16a "s16a_me_`pays'_2021.dta" 
global s16b "s16b_me_`pays'_2021.dta" 
global s16c "s16c_me_`pays'_2021.dta" 
global s16d "s16d_me_`pays'_2021.dta" 
global s17 "s17_me_`pays'_2021.dta" 
global s18_1 "s18_1_me_`pays'_2021.dta" 
global s18_2 "s18_2_me_`pays'_2021.dta" 
global s18_3 "s18_3_me_`pays'_2021.dta" 
global s19 "s19_me_`pays'_2021.dta" 
global s20a "s20a_me_`pays'_2021.dta" 
global s20b_1 "s20b_1_me_`pays'_2021.dta" 
global s20b_2 "s20b_2_me_`pays'_2021.dta"
global s20b_3 "s20b_3_me_`pays'_2021.dta" 
global s20c "s20c_me_`pays'_2021.dta"


* ----------------------------------------------------------------------------
* Variables clé
* ----------------------------------------------------------------------------

global vars_cle "s00q01 s00q04 s00q08"
