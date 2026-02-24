000000*-----------------------------------------------------------              
000000*    NOM EXTERNE                :  XBALL                                  
000000*    CODE                       :  XB                                     
000000*    NOM DE LA BIB. PACBASE     :  FON                                    
000000*    USER                       :  BEQUATR                                
000000*    GCD FAIT LE                :  04/05/17                               
000000*    NUM DE SESSION             :  1792                                   
000000*-----------------------------------------------------------              
001010        10          'X'-AIDFIC.                                       XB40
000000*                             /IDENTIFIANT DU FICHIER               / XB40
001020         15         'X'-JAN PICTURE 9(4).                             XB40
000000*                             /ANNEE                                / XB40
001030         15         'X'-DEPDIR.                                       XB40
000000*                             /zone groupe (dept + dir)             / XB40
001040          20        'X'-CODEP PICTURE X(2).                           XB40
000000*                             /code departement                     / XB40
001050          20        'X'-CODIR PICTURE X(1).                           XB40
000000*                             /code direction                       / XB40
001060         15         'X'-CCOCOM PICTURE X(3).                          XB40
000000*                             /CODE COMMUNE MAJIC2                  / XB40
001070         15         'X'-CCOIFP PICTURE X(3).                          XB40
000000*                             /CODE commune absorbee                / XB40
001080        10          'X'-ADTSEG.                                       XB40
000000*                             /DONNEES DU SEGMENT                   / XB40
001090         15         'X'-CCOENR PICTURE X(2).                          XB40
000000*                             /CODE ENREGISTREMENT                  / XB40
001100         15         'X'-GTOVOT PICTURE X(1).                          XB40
000000*                             /indicateur de taux valides           / XB40
001110         15         'X'-XDDAY6 PICTURE X(6).                          XB40
000000*                             /DATE DU JOUR SUR 6 CARACTERES        / XB40
001120         15         'X'-PMJPO PICTURE 9(3).                           XB40
000000*                             /MONTANT MAJORATION VL TERRAIN CONSTR / XB40
001130         15         'X'-DNURO PICTURE 9(3).                           XB40
000000*                             /numero du role                       / XB40
001140         15         'X'-JDHOMO PICTURE X(6).                          XB40
000000*                             /date d'homologation du role JJMMAA   / XB40
001150         15         'X'-DNULTF PICTURE X.                             XB40
000000*                             /NUMERO LOT DE TAXATION FONCIERE      / XB40
001160         15         'X'-GCOANU PICTURE X.                             XB40
000000*                             /CODE ANNULATION / REFECTION          / XB40
001170         15         'X'-NBSROL PICTURE 9(2).                          XB40
000000*                             /nombre de serie-role                 / XB40
001180         15         'X'-DLISRO PICTURE X(7).                          XB40
000000*                             /liste des serie-role                 / XB40
001190         15         'X'-JDATAU PICTURE 9(8).                          XB40
000000*                             /DATE DE VALIDITE DES TAUX            / XB40
001200         15         'X'-JDACMP PICTURE 9(8).                          XB40
000000*                             /DATE ROLE COMPLEMENTAIRE             / XB40
001210         15         'X'-ACOGEM PICTURE X(4).                          XB40
000000*                             /Code beneficiaire de la GEMAPI       / XB40
001220         15         'X'-PBBOMP PICTURE 9(4)V9(6).                     XB40
000000*                             /taux plein ordures menageres         / XB40
001230         15         'X'-PBBOMA PICTURE 9(4)V9(6).                     XB40
000000*                             /taux reduit RA ordures menageres     / XB40
001240         15         'X'-PBBOMB PICTURE 9(4)V9(6).                     XB40
000000*                             /taux reduit RB ordures menageres     / XB40
001250         15         'X'-PBBOMC PICTURE 9(4)V9(6).                     XB40
000000*                             /taux reduit RC ordures menageres     / XB40
001260         15         'X'-PBBOMD PICTURE 9(4)V9(6).                     XB40
000000*                             /taux reduit RD ordures menageres     / XB40
001270         15         'X'-NBTAUXOM PICTURE 9(1).                        XB40
000000*                             /nombre de taux om                    / XB40
000000*                             /                           PAC:NTXOM / XB40
001280         15         'X'-JCOJA                                         XB40
001290                         OCCURS 005.                                  XB40
000000*                             /zone groupe ja (JCOINS+JCORIM)       / XB40
001300          20        'X'-JCOINS PICTURE 9(4).                          XB40
000000*                             /ANNEE INSTALLATION JA COMMUNE        / XB40
001310          20        'X'-JCORIM PICTURE 9(4).                          XB40
000000*                             /ANNEE RETOUR IMPOSITION COMMUNE      / XB40
001320         15         'X'-JGCJA                                         XB40
001330                         OCCURS 005.                                  XB40
000000*                             /zone groupe ja (JGCINS+JGCRIM)       / XB40
001340          20        'X'-JGCINS PICTURE 9(4).                          XB40
000000*                             /ANNEE INSTALLATION JA GRPT COMMUNE   / XB40
001350          20        'X'-JGCRIM PICTURE 9(4).                          XB40
000000*                             /ANNEE RETOUR IMPOSITION GRPT COMMUNE / XB40
001360         15         'X'-DLICOM PICTURE X(30).                         XB40
000000*                             /LIBELLE COMMUNE                      / XB40
001370         15         'X'-GNIDEP PICTURE X(1).                          XB40
000000*                             /TOP COMMUNE NON IMPOSABLE AU DEPARTE / XB40
001380         15         'X'-GTOECO PICTURE X(1).                          XB40
000000*                             /INDICATEUR DE BASE TAUX ECOLE        / XB40
001390         15         'X'-CTYGC PICTURE X(1).                           XB40
000000*                             /TYPE DE GROUPEMENT DE COMMUNE        / XB40
001400         15         'X'-DNUCOL PICTURE X(3).                          XB40
000000*                             /CODE COLLECTIVITE LOCALE             / XB40
001410         15         'X'-ACOSYN.                                       XB40
000000*                             /SYNDICAT BENEFICIAIRE DES OM         / XB40
001420          20        'X'-CTYSYN PICTURE X(1).                          XB40
000000*                             /TYPE DE SYNDICAT OM                  / XB40
001430          20        'X'-CCOSYN PICTURE X(3).                          XB40
000000*                             /CODE SYNDICAT OM                     / XB40
001440         15         'X'-ACOGOM PICTURE X(4).                          XB40
000000*                             /COLLECTIVITE GESTIONNAIRE DES OM     / XB40
001450         15         'X'-DVLPOM PICTURE 9(6).                          XB40
000000*                             /Valeur locative moyenne (commune)    / XB40
001460         15         'X'-PPLOM PICTURE 9V99.                           XB40
000000*                             /COEFFICIENT DE PLAFONNEMENT TEOM     / XB40
001470         15         'X'-DCMZO1 PICTURE X.                             XB40
000000*                             /INDICATEUR MAJO TC NATIONAL          / XB40
001480         15         'X'-ANUZIP.                                       XB40
000000*                             /ZONE GROUPE ZIP                      / XB40
001490          20        'X'-DNUZIP PICTURE X(3).                          XB40
000000*                             /Numero de ZIP Zone OM P              / XB40
001500          20        'X'-DNUZIA PICTURE X(3).                          XB40
000000*                             /Numero de ZIP Zone OM RA             / XB40
001510          20        'X'-DNUZIB PICTURE X(3).                          XB40
000000*                             /Numero de ZIP Zone OM RB             / XB40
001520          20        'X'-DNUZIC PICTURE X(3).                          XB40
000000*                             /Numero de ZIP Zone OM RC             / XB40
001530          20        'X'-DNUZID PICTURE X(3).                          XB40
000000*                             /Numero de ZIP Zone OM RD             / XB40
001540         15         'X'-NPOCOM PICTURE 9(7).                          XB40
000000*                             /Commune: population totale           / XB40
001550         15         'X'-PBBOME PICTURE 9(4)V9(6).                     XB40
000000*                             /taux reduit RE ordures menageres     / XB40
001560         15         'X'-FILLER PICTURE X(22).                         XB40
001570         15         'X'-DSEDOM PICTURE 9(9).                          XB40
000000*                             /SEUIL D'EXONERATION DOM              / XB40
001580         15         'X'-DSEDNB PICTURE 9(9).                          XB40
000000*                             /SEUIL D'EXONERATION DOM NON BATI     / XB40
001590         15         'X'-ACOTXA.                                       XB40
000000*                             /BENEFICIAIRE TAXE ADDITIONNELLE      / XB40
001600          20        'X'-CTYTXA PICTURE X(1).                          XB40
000000*                             /TYPE DE BENEFICIAIRE TAXE ADD        / XB40
001610          20        'X'-CCOTXA PICTURE X(3).                          XB40
000000*                             /CODE BENEFICIAIRE TAXE ADD           / XB40
001620         15         'X'-PBBOMI PICTURE 9(12)V9(6).                    XB40
000000*                             /Pseudo taux TEOMI constr. neuves     / XB40
001630         15         'X'-ACOBIM PICTURE X(4).                          XB40
000000*                             /Code beneficiaire de la TEOMI        / XB40
001640         15         'X'-GTOMGP PICTURE X(1).                          XB40
000000*                             /TOP COMMUNE APPARTENANT  GRAND PARIS / XB40
001650         15         'X'-DSIREC PICTURE X(14).                         XB40
000000*                             /NUMERO SIRET COMMUNE                 / XB40
001660         15         'X'-GTOCFU PICTURE X(1).                          XB40
000000*                             /TOP 1ERE ANNEE FUSION COMMUNE        / XB40
001670         15         'X'-FILLER PICTURE X(34).                         XB40
001680         15         'X'-DNUURC PICTURE X(2).                          XB40
000000*                             /NUM UNITE REGROUPEMENT CDIF ( UR )   / XB40
