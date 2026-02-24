000000*-----------------------------------------------------------              
000000*    NOM EXTERNE                :  XBALL                                  
000000*    CODE                       :  XB                                     
000000*    NOM DE LA BIB. PACBASE     :  FON                                    
000000*    USER                       :  BEVIOLE                                
000000*    GCD FAIT LE                :  23/04/19                               
000000*    NUM DE SESSION             :  3280                                   
000000*-----------------------------------------------------------              
000150        10          'X'-AIDFIC.                                       XB35
000000*                             /IDENTIFIANT DU FICHIER               / XB35
000160         15         'X'-JAN PICTURE 9(4).                             XB35
000000*                             /ANNEE                                / XB35
000170         15         'X'-DEPDIR.                                       XB35
000000*                             /zone groupe (dept + dir)             / XB35
000180          20        'X'-CODEP PICTURE X(2).                           XB35
000000*                             /code departement                     / XB35
000190          20        'X'-CODIR PICTURE X(1).                           XB35
000000*                             /code direction                       / XB35
000200         15         'X'-CCOCOM PICTURE X(3).                          XB35
000000*                             /CODE COMMUNE MAJIC2                  / XB35
000210         15         'X'-CCOIFP PICTURE X(3).                          XB35
000000*                             /CODE commune absorbee                / XB35
000220        10          'X'-ADTSEG.                                       XB35
000000*                             /DONNEES DU SEGMENT                   / XB35
000230         15         'X'-CCOENR PICTURE X(2).                          XB35
000000*                             /CODE ENREGISTREMENT                  / XB35
000240         15         'X'-XDDAY6 PICTURE X(6).                          XB35
000000*                             /DATE DU JOUR SUR 6 CARACTERES        / XB35
000250         15         'X'-TAUDEP-B PICTURE 9(4)V9(6).                   XB35
000000*                             /taux bati departement                / XB35
000000*                             /                           PAC:PTBDEP/ XB35
000260         15         'X'-TAUREG-B PICTURE 9(4)V9(6).                   XB35
000000*                             /taux bati region                     / XB35
000000*                             /                           PAC:PTBREG/ XB35
000270         15         'X'-PTBTAS PICTURE 9(4)V9(6).                     XB35
000000*                             /taux bati TASA                       / XB35
000280         15         'X'-TAUDEP-NB PICTURE 9(4)V9(6).                  XB35
000000*                             /TAUX NB DEPARTEMENT                  / XB35
000000*                             /                           PAC:PNBDEP/ XB35
000290         15         'X'-TAUREG-NB PICTURE 9(4)V9(6).                  XB35
000000*                             /TAUX NB REGION et TSE IDF            / XB35
000000*                             /                           PAC:PNBREG/ XB35
000300         15         'X'-TAUCHAGR-NB PICTURE 9(4)V9(6).                XB35
000000*                             /TAUX NB CHAMBRE AGRICULTURE          / XB35
000000*                             /                           PAC:PNBAGR/ XB35
000310         15         'X'-TAUBAP405-NB PICTURE 9(2)V9(2).               XB35
000000*                             /TAUX BAPSA NON AGRICOLE (4,05)       / XB35
000000*                             /                           PAC:PNBBAP/ XB35
000320         15         'X'-TAUSMAGR-NB PICTURE 9(4)V9(6).                XB35
000000*                             /taux chambre agriculture communal    / XB35
000000*                             /                           PAC:PNBAGN/ XB35
000330         15         'X'-JDEJA                                         XB35
000340                         OCCURS 005.                                  XB35
000000*                             /zone groupe ja (JDEINS+JDERIM)       / XB35
000350          20        'X'-JDEINS PICTURE 9(4).                          XB35
000000*                             /ANNEE INSTALLATION JA DEPARTEMENT    / XB35
000360          20        'X'-JDERIM PICTURE 9(4).                          XB35
000000*                             /ANNEE RETOUR IMPOSITION DEPARTEMENT  / XB35
000370         15         'X'-FILLER PICTURE X(9).                          XB35
000380         15         'X'-ACOETS PICTURE X(4)                           XB35
000390                         OCCURS 005.                                  XB35
000000*                             /CODE ORGANISME BENEFICIAIRE TSE      / XB35
000400         15         'X'-NBTSE PICTURE 9(2).                           XB35
000000*                             /NOMBRE DE TSE SUR LA DSF             / XB35
000410         15         'X'-PTBDRB PICTURE 9(4)V9(6).                     XB35
000000*                             /taux bati dept rebase                / XB35
000420         15         'X'-DSITAS PICTURE X(14).                         XB35
000000*                             /NUMERO SIRET REG BENEFICIAIRE TASA   / XB35
000430         15         'X'-GROTAS PICTURE X(1).                          XB35
000000*                             /OPTION COPIE ROLE TASA               / XB35
000440         15         'X'-DSIRED.                                       XB35
000000*                             /NUMERO SIRET DIRECTION               / XB35
000450          20        'X'-DSRNDR PICTURE X(9).                          XB35
000000*                             /SIREN Direction                      / XB35
000460          20        'X'-FILLER PICTURE X(5).                          XB35
000470         15         'X'-DSICA.                                        XB35
000000*                             /NUMERO SIRET Ch Agr                  / XB35
000480          20        'X'-DSRNCA PICTURE X(9).                          XB35
000000*                             /SIREN Ch Agr                         / XB35
000490          20        'X'-FILLER PICTURE X(5).                          XB35
000500         15         'X'-DSIRMP.                                       XB35
000000*                             /SIRET METROPOLE GRAND PARIS          / XB35
000510          20        'X'-DSRNMP PICTURE X(9).                          XB35
000000*                             /SIREN METROPOLE GRAND PARIS          / XB35
000520          20        'X'-FILLER PICTURE X(5).                          XB35
000530         15         'X'-FILLER PICTURE X(165).                        XB35
000540         15         'X'-DNUURC PICTURE X(2).                          XB35
000000*                             /NUM UNITE REGROUPEMENT CDIF ( UR )   / XB35
