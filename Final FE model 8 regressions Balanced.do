import excel "C:\Users\hemal\OneDrive\A_Internship and research paper\Data\New folder\Balanced panel data.xlsx", sheet("Sheet1") firstrow clear
browse
egen Companynum = group(Company)
xtset Companynum Year

xtreg PVOL DYIELD EVOL LDEBT SIZE GROWTH, fe
xtreg PVOL DYIELD EVOL LDEBT SIZE GROWTH i.Year, fe
xtreg PVOL DYIELD EVOL LDEBT SIZE GROWTH, fe vce(robust)
xtreg PVOL DYIELD EVOL LDEBT SIZE GROWTH i.Year, fe vce(robust)

xtreg PVOL DPAYOUT EVOL LDEBT SIZE GROWTH, fe
xtreg PVOL DPAYOUT EVOL LDEBT SIZE GROWTH i.Year, fe
xtreg PVOL DPAYOUT EVOL LDEBT SIZE GROWTH, fe vce(robust)
xtreg PVOL DPAYOUT EVOL LDEBT SIZE GROWTH i.Year, fe vce(robust)

xtreg PVOL L.DYIELD EVOL LDEBT SIZE GROWTH, fe
xtreg PVOL L.DYIELD EVOL LDEBT SIZE GROWTH i.Year, fe
xtreg PVOL L.DYIELD EVOL LDEBT SIZE GROWTH, fe vce(robust)
xtreg PVOL L.DYIELD EVOL LDEBT SIZE GROWTH i.Year, fe vce(robust)

xtreg PVOL L.DPAYOUT EVOL LDEBT SIZE GROWTH, fe
xtreg PVOL L.DPAYOUT EVOL LDEBT SIZE GROWTH i.Year, fe
xtreg PVOL L.DPAYOUT EVOL LDEBT SIZE GROWTH, fe vce(robust)
xtreg PVOL L.DPAYOUT EVOL LDEBT SIZE GROWTH i.Year, fe vce(robust)