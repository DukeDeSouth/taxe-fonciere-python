000000*-----------------------------------------------------------              
000000*    NOM EXTERNE                :  XBALL                                  
000000*    CODE                       :  XB                                     
000000*    NOM DE LA BIB. PACBASE     :  FON                                    
000000*    USER                       :  BEVIOLE                                
000000*    GCD FAIT LE                :  23/04/19                               
000000*    NUM DE SESSION             :  3280                                   
000000*-----------------------------------------------------------              
001940        10          'X'-AIDFIC.                                       XB45
000000*                             /IDENTIFIANT DU FICHIER               / XB45
001950         15         'X'-JAN PICTURE 9(4).                             XB45
000000*                             /ANNEE                                / XB45
001960         15         'X'-DEPDIR.                                       XB45
000000*                             /zone groupe (dept + dir)             / XB45
001970          20        'X'-CODEP PICTURE X(2).                           XB45
000000*                             /code departement                     / XB45
001980          20        'X'-CODIR PICTURE X(1).                           XB45
000000*                             /code direction                       / XB45
001990         15         'X'-CCOCOM PICTURE X(3).                          XB45
000000*                             /CODE COMMUNE MAJIC2                  / XB45
002000         15         'X'-CCOIFP PICTURE X(3).                          XB45
000000*                             /CODE commune absorbee                / XB45
002010        10          'X'-ADTSEG.                                       XB45
000000*                             /DONNEES DU SEGMENT                   / XB45
002020         15         'X'-CCOENR PICTURE X(2).                          XB45
000000*                             /CODE ENREGISTREMENT                  / XB45
002030         15         'X'-LIGBENEFOM PICTURE 9(2).                      XB45
000000*                             /code collectivite beneficiaire om    / XB45
000000*                             /                           PAC:CCOBOM/ XB45
002040         15         'X'-TPBASY.                                       XB45
000000*                             /table repartition produits syndicats / XB45
002050          20        'X'-PBASY1 PICTURE 9(3)V9(2)                      XB45
002060                         OCCURS 010.                                  XB45
000000*                             /elt repartition produits syndicat    / XB45
002070         15         'X'-TPNBSY.                                       XB45
000000*                             /table repartition produits syndicats / XB45
002080          20        'X'-PNBPSY PICTURE 9(3)V9(2)                      XB45
002090                         OCCURS 010.                                  XB45
000000*                             /elt repartition produits syndicat    / XB45
002100         15         'X'-TPOMSY.                                       XB45
000000*                             /table repartition produits syndicats / XB45
002110          20        'X'-POMSY1 PICTURE 9(3)V9(2)                      XB45
002120                         OCCURS 010.                                  XB45
000000*                             /elt repartition produits syndicat    / XB45
002130         15         'X'-TAUCOM-B PICTURE 9(4)V9(6).                   XB45
000000*                             /TAUX BATI COMMUNAL                   / XB45
000000*                             /                           PAC:PTBCOM/ XB45
002140         15         'X'-TAUSYNDSFP-B PICTURE 9(4)V9(6).               XB45
000000*                             /taux bati syndicat                   / XB45
000000*                             /                           PAC:PTBSYN/ XB45
002150         15         'X'-TAUCUDFPVN-B PICTURE 9(4)V9(6).               XB45
000000*                             /taux bati groupement de commune      / XB45
000000*                             /                           PAC:PTBCU / XB45
002160         15         'X'-TAUTSE-B PICTURE 9(4)V9(6).                   XB45
000000*                             /taux bati taxe speciale d'equipement / XB45
000000*                             /                           PAC:PTBTSE/ XB45
002170         15         'X'-PNBTXA PICTURE 9(4)V9(6).                     XB45
000000*                             /taux de taxe additionnellle          / XB45
002180         15         'X'-TAUCOM-NB PICTURE 9(4)V9(6).                  XB45
000000*                             /TAUX NB COMMUNE                      / XB45
000000*                             /                           PAC:PNBCOM/ XB45
002190         15         'X'-TAUSYNDSFP-NB PICTURE 9(4)V9(6).              XB45
000000*                             /TAUX NB SYNDICAT                     / XB45
000000*                             /                           PAC:PNBSYN/ XB45
002200         15         'X'-TAUCUDFPVN-NB PICTURE 9(4)V9(6).              XB45
000000*                             /TAUX NB COMMUNAUTE URBAINE           / XB45
000000*                             /                           PAC:PNBCU / XB45
002210         15         'X'-TAUTSE-NB PICTURE 9(4)V9(6).                  XB45
000000*                             /TAUX NB TSE sauf ILE DE FRANCE       / XB45
000000*                             /                           PAC:PNBTSE/ XB45
002220         15         'X'-PNBCAA PICTURE 9(4)V9(6).                     XB45
000000*                             /TAUX NB C.A.A.A.                     / XB45
002230         15         'X'-CCOEXC PICTURE X(2).                          XB45
000000*                             /code exclusion                       / XB45
002240         15         'X'-GIMOMI PICTURE X(1).                          XB45
000000*                             /Indicateur de taxation TEOMI         / XB45
002250         15         'X'-CCOBIM PICTURE 9(2).                          XB45
000000*                             /Code collectivite beneficiaire TEOMI / XB45
002260         15         'X'-PTBGEM PICTURE 9(4)V9(6).                     XB45
000000*                             /TAUX BATI GEMAPI                     / XB45
002270         15         'X'-PNBGEM PICTURE 9(4)V9(6).                     XB45
000000*                             /TAUX NON BATI GEMAPI                 / XB45
002280         15         'X'-FILLER PICTURE X(50).                         XB45
002290         15         'X'-ACOETS PICTURE X(4)                           XB45
002300                         OCCURS 002.                                  XB45
000000*                             /CODE ORGANISME BENEFICIAIRE TSE      / XB45
002310         15         'X'-DNUTSE PICTURE 9(2)                           XB45
002320                         OCCURS 002.                                  XB45
000000*                             /Num{ro de poste TSE nouvelle         / XB45
002330         15         'X'-TOTOFR PICTURE X.                             XB45
000000*                             /TOP FRAIS REDUIT OM                  / XB45
002340         15         'X'-FILLER PICTURE X(20).                         XB45
002350         15         'X'-CCDDIR.                                       XB45
000000*                             /CODE DIRECTION                       / XB45
002360          20        'X'-CO2DEP PICTURE X(2).                          XB45
000000*                             /CODE DEPARTEMENT                     / XB45
002370          20        'X'-CCODIR PICTURE X(1).                          XB45
000000*                             /CODE DIRECTION                       / XB45
002380         15         'X'-PTBTGP PICTURE 9(4)V9(6).                     XB45
000000*                             /TAUX TSE GP MA GA bati               / XB45
002390         15         'X'-PNBTGP PICTURE 9(4)V9(6).                     XB45
000000*                             /TAUX TSE GRAND PARIS NON-BATI        / XB45
002400         15         'X'-DNUURC PICTURE X(2).                          XB45
000000*                             /NUM UNITE REGROUPEMENT CDIF ( UR )   / XB45
