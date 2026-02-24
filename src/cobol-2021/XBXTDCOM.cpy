      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  XBALL                                  
      *    CODE                       :  XB                                     
      *-----------------------------------------------------------              
001010        10          'X'-AIDFIC.                                       
      *                             /IDENTIFIANT DU FICHIER               
001020         15         'X'-JAN PICTURE 9(4).                             
      *                             /ANNEE                                
001030         15         'X'-DEPDIR.                                       
      *                             /zone groupe (dept + dir)             
001040          20        'X'-CODEP PICTURE X(2).                           
      *                             /code departement                     
001050          20        'X'-CODIR PICTURE X(1).                           
      *                             /code direction                       
001060         15         'X'-CCOCOM PICTURE X(3).                          
      *                             /CODE COMMUNE MAJIC2                  
001070         15         'X'-CCOIFP PICTURE X(3).                          
      *                             /CODE commune absorbee                
001080        10          'X'-ADTSEG.                                       
      *                             /DONNEES DU SEGMENT                   
001090         15         'X'-CCOENR PICTURE X(2).                          
      *                             /CODE ENREGISTREMENT                  
001100         15         'X'-GTOVOT PICTURE X(1).                          
      *                             /indicateur de taux valides           
001110         15         'X'-XDDAY6 PICTURE X(6).                          
      *                             /DATE DU JOUR SUR 6 CARACTERES        
001120         15         'X'-PMJPO PICTURE 9(3).                           
      *                             /MONTANT MAJORATION VL TERRAIN CONSTR 
001130         15         'X'-DNURO PICTURE 9(3).                           
      *                             /numero du role                       
001140         15         'X'-JDHOMO PICTURE X(6).                          
      *                             /date d'homologation du role JJMMAA   
001150         15         'X'-DNULTF PICTURE X.                             
      *                             /NUMERO LOT DE TAXATION FONCIERE      
001160         15         'X'-GCOANU PICTURE X.                             
      *                             /CODE ANNULATION / REFECTION          
001170         15         'X'-NBSROL PICTURE 9(2).                          
      *                             /nombre de serie-role                 
001180         15         'X'-DLISRO PICTURE X(7).                          
      *                             /liste des serie-role                 
001190         15         'X'-JDATAU PICTURE 9(8).                          
      *                             /DATE DE VALIDITE DES TAUX            
001200         15         'X'-JDACMP PICTURE 9(8).                          
      *                             /DATE ROLE COMPLEMENTAIRE             
001210         15         'X'-ACOGEM PICTURE X(4).                          
      *                             /Code beneficiaire de la GEMAPI       
001220         15         'X'-PBBOMP PICTURE 9(4)V9(6).                     
      *                             /taux plein ordures menageres         
001230         15         'X'-PBBOMA PICTURE 9(4)V9(6).                     
      *                             /taux reduit RA ordures menageres     
001240         15         'X'-PBBOMB PICTURE 9(4)V9(6).                     
      *                             /taux reduit RB ordures menageres     
001250         15         'X'-PBBOMC PICTURE 9(4)V9(6).                     
      *                             /taux reduit RC ordures menageres     
001260         15         'X'-PBBOMD PICTURE 9(4)V9(6).                     
      *                             /taux reduit RD ordures menageres     
001270         15         'X'-NBTAUXOM PICTURE 9(1).                        
      *                             /nombre de taux om                    
      *                             /                           PAC:NTXOM 
001280         15         'X'-JCOJA                                         
001290                         OCCURS 005.                                  
      *                             /zone groupe ja (JCOINS+JCORIM)       
001300          20        'X'-JCOINS PICTURE 9(4).                          
      *                             /ANNEE INSTALLATION JA COMMUNE        
001310          20        'X'-JCORIM PICTURE 9(4).                          
      *                             /ANNEE RETOUR IMPOSITION COMMUNE      
001320         15         'X'-JGCJA                                         
001330                         OCCURS 005.                                  
      *                             /zone groupe ja (JGCINS+JGCRIM)       
001340          20        'X'-JGCINS PICTURE 9(4).                          
      *                             /ANNEE INSTALLATION JA GRPT COMMUNE   
001350          20        'X'-JGCRIM PICTURE 9(4).                          
      *                             /ANNEE RETOUR IMPOSITION GRPT COMMUNE 
001360         15         'X'-DLICOM PICTURE X(30).                         
      *                             /LIBELLE COMMUNE                      
001370         15         'X'-GNIDEP PICTURE X(1).                          
      *                             /TOP COMMUNE NON IMPOSABLE AU DEPARTE 
001380         15         'X'-GTOECO PICTURE X(1).                          
      *                             /INDICATEUR DE BASE TAUX ECOLE        
001390         15         'X'-CTYGC PICTURE X(1).                           
      *                             /TYPE DE GROUPEMENT DE COMMUNE        
001400         15         'X'-DNUCOL PICTURE X(3).                          
      *                             /CODE COLLECTIVITE LOCALE             
001410         15         'X'-ACOSYN.                                       
      *                             /SYNDICAT BENEFICIAIRE DES OM         
001420          20        'X'-CTYSYN PICTURE X(1).                          
      *                             /TYPE DE SYNDICAT OM                  
001430          20        'X'-CCOSYN PICTURE X(3).                          
      *                             /CODE SYNDICAT OM                     
001440         15         'X'-ACOGOM PICTURE X(4).                          
      *                             /COLLECTIVITE GESTIONNAIRE DES OM     
001450         15         'X'-DVLPOM PICTURE 9(6).                          
      *                             /Valeur locative moyenne (commune)    
001460         15         'X'-PPLOM PICTURE 9V99.                           
      *                             /COEFFICIENT DE PLAFONNEMENT TEOM     
001470         15         'X'-DCMZO1 PICTURE X.                             
      *                             /INDICATEUR MAJO TC NATIONAL          
001480         15         'X'-ANUZIP.                                       
      *                             /ZONE GROUPE ZIP                      
001490          20        'X'-DNUZIP PICTURE X(3).                          
      *                             /Numero de ZIP Zone OM P              
001500          20        'X'-DNUZIA PICTURE X(3).                          
      *                             /Numero de ZIP Zone OM RA             
001510          20        'X'-DNUZIB PICTURE X(3).                          
      *                             /Numero de ZIP Zone OM RB             
001520          20        'X'-DNUZIC PICTURE X(3).                          
      *                             /Numero de ZIP Zone OM RC             
001530          20        'X'-DNUZID PICTURE X(3).                          
      *                             /Numero de ZIP Zone OM RD             
001540         15         'X'-NPOCOM PICTURE 9(7).                          
      *                             /Commune: population totale           
001550         15         'X'-PBBOME PICTURE 9(4)V9(6).                     
      *                             /taux reduit RE ordures menageres     
001560         15         'X'-FILLER PICTURE X(22).                         
001570         15         'X'-DSEDOM PICTURE 9(9).                          
      *                             /SEUIL D'EXONERATION DOM              
001580         15         'X'-DSEDNB PICTURE 9(9).                          
      *                             /SEUIL D'EXONERATION DOM NON BATI     
001590         15         'X'-ACOTXA.                                       
      *                             /BENEFICIAIRE TAXE ADDITIONNELLE      
001600          20        'X'-CTYTXA PICTURE X(1).                          
      *                             /TYPE DE BENEFICIAIRE TAXE ADD        
001610          20        'X'-CCOTXA PICTURE X(3).                          
      *                             /CODE BENEFICIAIRE TAXE ADD           
001620         15         'X'-PBBOMI PICTURE 9(12)V9(6).                    
      *                             /Pseudo taux TEOMI constr. neuves     
001630         15         'X'-ACOBIM PICTURE X(4).                          
      *                             /Code beneficiaire de la TEOMI        
001640         15         'X'-GTOMGP PICTURE X(1).                          
      *                             /TOP COMMUNE APPARTENANT  GRAND PARIS 
001650         15         'X'-DSIREC PICTURE X(14).                         
      *                             /NUMERO SIRET COMMUNE                 
001660         15         'X'-GTOCFU PICTURE X(1).                          
      *                             /TOP 1ERE ANNEE FUSION COMMUNE        
001670         15         'X'-FILLER PICTURE X(34).                         
001680         15         'X'-DNUURC PICTURE X(2).                          
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )   
