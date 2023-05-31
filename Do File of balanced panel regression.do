import excel "C:\Users\hemal\OneDrive\A_Internship and research paper\Data\New folder\Balanced panel data.xlsx", sheet("Sheet1") firstrow clear
browse
tabulate Industry, generate(I)
egen Companynum = group(Company)
browse
xtset Companynum Year
xtsum PVOL DYIELD  DPAYOUT EVOL LDEBT SIZE GROWTH
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, re
estimates store random
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, fe
estimates store fixed
hausman fixed random
tabulate Year, generate(Y)
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH i.Year, fe
testparm i.Year
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, re
xttest0
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, fe
xtcsd, pesaran abs
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, fe
xttest3
xtunitroot ht PVOL
xtunitroot ht DYIELD
xtunitroot ht DPAYOUT
xtunitroot ht EVOL
xtunitroot ht LDEBT
xtunitroot ht SIZE
xtunitroot ht GROWTH
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, re vce(robust)
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH I1 I2 I3 I4 I5 I6 I7, fe vce(robust)
xtreg PVOL DYIELD LDEBT SIZE, re
xtreg PVOL DYIELD LDEBT, fe
xtreg PVOL DYIELD DPAYOUT EVOL LDEBT SIZE GROWTH, fe