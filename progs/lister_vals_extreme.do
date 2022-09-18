capture program drop lister_vals_extremes
program define lister_vals_extremes 
syntax varlist(max=1) [if], [by(varlist)] [autres_vars(varlist min=1)] [pct_sup(integer 99)] [pct_inf(integer 1)] [obs_min(integer 5)] [exclure(integer 9999)]

* shorten argument name to reduce typing
local varname "`varlist'"

* compute percentiles and number of observations
* ... overall
if "`by'" == "" {

    egen _pct_sup = pctile(`varname') `if', p(`pct_sup')
    egen _pct_inf = pctile(`varname') `if', p(`pct_inf')

} 
* ... by group
else if "`by'" != "" {

    bysort `by' : egen _n_obs   = count(`varname') `if'
    bysort `by' : egen _pct_sup = pctile(`varname') `if', p(`pct_sup')
    bysort `by' : egen _pct_inf = pctile(`varname') `if', p(`pct_inf')

}

* compose if expression to append to list function
* if no -if- expression, return missing
if (`"`if'"' == "") {
    local and_if ""
}
* if non-missing -if- expression, remove "if " and pre-pend "& "
else if (`"`if'"' != "") {
    local and_if = subinstr(`"`if'"', "if ", "", 1)
    local and_if `"& `and_if'"'
}

* compose conditions for identifying extreme values
local extreme_condit "((`varname' <= _pct_inf) | (`varname' >= _pct_sup & !mi(_pct_sup))) & !mi(`varname') & (varname != `exclure')"
local lower_condit "(`varname' <= _pct_inf & !mi(`varname')) & (`varname' != `exclure')"
local upper_condit "(`varname' >= _pct_sup & !mi(_pct_sup)) & !mi(`varname') & (varname != `exclure')"

* count extreme values and message about them
if "`by'" != "" {
    * remove extreme values where cell size is smaller than minimum
    drop if _n_obs < `obs_min'
}
qui: count if `extreme_condit' `and_if'
local n_obs = `r(N)'
qui: count if `lower_condit' `and_if'
local n_low_obs = `r(N)'
qui: count if `upper_condit' `and_if'
local n_hi_obs = `r(N)'
di as error "Variable -`varname'- a `n_obs' valeurs extrêmes"


* list extreme values, with slightly different list command if -by- is present in call
if "`by'" == "" {   

    * Borne inférieure
    qui: summarize _pct_inf if `lower_condit' `and_if'
    local low_val = r(mean)
    di as error "`n_low_obs' obs en dessous du `pct_inf' centile (`low_val')"
    list interview__id `autres_vars' `varname' if `lower_condit' `and_if', noobs
    di ""

    * Borne supérieure
    qui: summarize _pct_sup if `upper_condit' `and_if'
    local hi_val = r(mean)
    di as error "`n_hi_obs' au dessus du `pct_sup' centile (`hi_val')"
    list interview__id `autres_vars' `varname' if `upper_condit' `and_if', noobs
}
else if "`by'" != "" {

    * Borne inférieure
    di as error "`n_low_obs' obs en dessous du `pct_inf' centile"
    list interview__id `by' `autres_vars' _n_obs _pct_inf `varname' if `lower_condit' `and_if', sepby(`by') noobs
    di ""

    * Borne supérieure
    di as error "`n_hi_obs' au dessus du `pct_sup' centile"
    list interview__id `by' `autres_vars' _n_obs _pct_sup `varname' if `upper_condit' `and_if', sepby(`by') noobs
    di ""

}

* clean-up
capture drop _n_obs 
capture drop _pct_sup 
capture drop _pct_inf

end
