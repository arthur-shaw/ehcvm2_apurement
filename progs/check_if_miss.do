capture program drop check_if_miss
program define check_if_miss
syntax  varlist(max=1) [if], [show_vars(varlist)]

* to reduce typing in program, capture variable list in macro with shorter name
local var "`varlist'"

* to construct expression for counting missing, pre-pend "& " of `if'
if (`"`if'"' == "") {
    local and_if ""
}
else if (`"`if'"' != "") {
    local and_if = subinstr(`"`if'"', "if ", "", 1)
    local and_if `"& `and_if'"'
}

* determine whether the variable is string or not
local var_type : type `var'
local var_is_string = ustrregexm("`var_type'", "^str")

* construct expression for whether missing as a function of variable type
if `var_is_string' == 1 {
    local is_miss_expr `"inlist(`var', "", "##N/A##")"'
}
else if `var_is_string' == 0 {
    local is_miss_expr "mi(`var')"
}

* to facilitate follow-up, show missing cases with -interview__id- and variables from `show_vars'
capture assert !`is_miss_expr' `if'
if _rc == 0 {
    di as result "No missing values for -`var'-"
}
else if _rc != 0 {

    * count the number of missing observations
    qui: count if `is_miss_expr' `and_if' 
    local n_miss = `r(N)'

    * list observations with missings along with desired `show_vars'
    di as error "Variable -`var'- has `n_miss' missing values"
    if (`"`if'"' == "") {
        list interview__id `var' `show_vars' if `is_miss_expr'
    }
    else if (`"`if'"' != "") {
        list interview__id `var' `show_vars' `if' & `is_miss_expr' 
    }
}

end
