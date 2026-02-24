      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  T24G                                   
      *    MODIFIE  LE                :  10/02/22                               
      *    ARTICLE EPCI OU SYNDICAT OM OU GROUPEMENT TSE DU TAUDIS              
      *                                                                         
      *    ANNEE 2022. LONGUEUR T200 + T24G = 4000                              
      *                                                                         
      *-----------------------------------------------------------              
             03 DONNEES-EPCI-OM-GRPT.                                           
      * LETTRE ARTICLE. 'E' POUR EPCI,                                          
      *                 'O' POUR SYND OM,                                       
      *                 'G' POUR GROUPEMENT TSE                                 
0013           10 'X'-FILLER PIC X.                                             
0014           10 'X'-DLETAR PIC X.                                             
      * LIBELLE                                                                 
0015           10 'X'-FILLER PIC X.                                             
0016           10 'X'-DLIGC  PIC X(65).                                         
      * OPTION DE COPIE DE ROLE                                                 
0081           10 'X'-FILLER PIC X.                                             
0082           10 'X'-GROGC  PIC X.                                             
      * SIREN                                                                   
0083           10 'X'-FILLER PIC X.                                             
0084           10 'X'-DNUSRN PIC X(9).                                          
      * SIRET                                                                   
0093           10 'X'-FILLER PIC X.                                             
0094           10 'X'-DSIREG PIC X(14).                                         
      * TOP INTEGRATION FUSION OU RATTACHEMENT DE EPCI BATI (O-N)               
0108           10 'X'-FILLER PIC X.                                             
0109           10 'X'-GTOGRB PIC X.                                             
      * TOP INTEGRATION FUSION OU RATTACHEMENT DE EPCI NON BATI (O-N)           
0110           10 'X'-FILLER PIC X.                                             
0111           10 'X'-GTOGRN PIC X.                                             
      * TAUX DE L'EPCI BATI (TAUX 1)                                            
0112           10 'X'-FILLER PIC X.                                             
0113           10 'X'-PTBGRB PIC 9(4)V9(6).                                     
      * TAUX DE L'EPCI NON BATI (TAUX 1)                                        
0123           10 'X'-FILLER PIC X.                                             
0124           10 'X'-PTNGRN PIC 9(4)V9(6).                                     
      * TAUX DE L'EPCI BATI (TAUX 2)                                            
0134           10 'X'-FILLER PIC X.                                             
0135           10 'X'-PTBGRB2 PIC 9(4)V9(6).                                    
      * TAUX DE L'EPCI NON BATI (TAUX 2)                                        
0145           10 'X'-FILLER PIC X.                                             
0146           10 'X'-PTNGRN2 PIC 9(4)V9(6).                                    
      * EPCI DE TYPE EPT (O OU BLANC)                                           
0156           10 'X'-FILLER PIC X.                                             
0157           10 'X'-GTOEPT PIC X.                                             
      * EPCI DE TYPE MGP (O OU BLANC)                                           
0158           10 'X'-FILLER PIC X.                                             
0159           10 'X'-GTOMGP PIC X.                                             
      * TOP EPCI ISSU DE FUSION                                                 
0160           10 'X'-FILLER PIC X.                                             
0161           10 'X'-GTOFUS PIC X.                                             
      * ANNEE DE CREATION DE EPCI                                               
0162           10 'X'-FILLER PIC X.                                             
0163           10 'X'-JANCRE PIC X(4).                                          
      * ADRESSE EMAIL (PARTIE GAUCHE ET DROITE)                                 
0167           10 'X'-FILLER PIC X.                                             
0168           10 'X'-VMAILG PIC X(50).                                         
0218           10 'X'-VMAILD PIC X(50).                                         
      * LIBRE                                                                   
0268           10 'X'-FILLER PIC X(3733).                                       
