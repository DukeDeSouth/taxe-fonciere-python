000000*-----------------------------------------------------------              
000000*    NOM EXTERNE                :  XBALL                                  
000000*    CODE                       :  XB                                     
000000*    NOM DE LA BIB. PACBASE     :  FON                                    
000000*    USER                       :  BEQUATR                                
000000*    GCD FAIT LE                :  16/01/17                               
000000*    NUM DE SESSION             :  1562                                   
000000*-----------------------------------------------------------              
000020        10          'X'-AIDFIC.                                       XB30
000000*                             /IDENTIFIANT DU FICHIER               / XB30
000030         15         'X'-JAN PICTURE 9(4).                             XB30
000000*                             /ANNEE                                / XB30
000040         15         'X'-DEPDIR.                                       XB30
000000*                             /zone groupe (dept + dir)             / XB30
000050          20        'X'-CODEP PICTURE X(2).                           XB30
000000*                             /code departement                     / XB30
000060          20        'X'-CODIR PICTURE X(1).                           XB30
000000*                             /code direction                       / XB30
000070         15         'X'-CCOCOM PICTURE X(3).                          XB30
000000*                             /CODE COMMUNE MAJIC2                  / XB30
000080         15         'X'-CCOIFP PICTURE X(3).                          XB30
000000*                             /CODE commune absorbee                / XB30
000090        10          'X'-ADTSEG.                                       XB30
000000*                             /DONNEES DU SEGMENT                   / XB30
000100         15         'X'-CCOENR PICTURE X(2).                          XB30
000000*                             /CODE ENREGISTREMENT                  / XB30
000110         15         'X'-XDDAY6 PICTURE X(6).                          XB30
000000*                             /DATE DU JOUR SUR 6 CARACTERES        / XB30
000120         15         'X'-FILLER PICTURE X(377).                        XB30
000130         15         'X'-DNUURC PICTURE X(2).                          XB30
000000*                             /NUM UNITE REGROUPEMENT CDIF ( UR )   / XB30
