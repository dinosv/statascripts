/*
Script para la verficación de ruts con la forma 
nnnnnnnnv, para la variable run_cdgv.
El script sólo funciona si el run tiene un valor entre 1000000 y 99999999
*/

tostring run_cdgv, replace // necesario si la lista no tiene ruts con K
gen dgv = substr(run_cdgv,-1,1) // dgv dígito verificador 
gen d1 = substr(run_cdgv,-2,1)
gen d2 = substr(run_cdgv,-3,1)
gen d3 = substr(run_cdgv,-4,1)
gen d4 = substr(run_cdgv,-5,1)
gen d5 = substr(run_cdgv,-6,1)
gen d6 = substr(run_cdgv,-7,1)
gen d7 = substr(run_cdgv,-8,1)
gen d8 = substr(run_cdgv,-9,1)

destring d*, replace    // transformando las variables string "d", 
                        // a dígito numérico.

gen S = d1*2 + d2*3 + d3*4 + d4*5 + d5*6 + d6*7 + d7*2 + d8*3
replace S = d1*2 + d2*3 + d3*4 + d4*5 + d5*6 + d6*7 + d7*2 if d8 == .

gen Ri = mod(S,11)

gen Rf = 11 - Ri

gen cal_verif_dg = Rf if Rf < 10
replace cal_verif_dg = 0 if Rf == 11
tostring cal_verif_dg, replace
replace cal_verif_dg = "K" if Rf == 10
assert dgv == cal_verif_dg

