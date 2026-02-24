      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  T24C                                   
      *    MODIF FAIT LE              :  10/02/22 POUR LE D4 2022               
      *    ARTICLE COMMUNE DU TAUDIS                                            
      *                                                                         
      *    ANNEE 2022. LONGUEUR T200 + T24C = 4000                              
      *                                                                         
      *-----------------------------------------------------------              
             03 DONNEES-COMMUNE.                                                
      * LETTRE ARTICLE. 'C' POUR COMMUNE.                                       
0013          10 'X'-FILLER PIC X.                                              
0014          10 'X'-DLETAR PIC X.                                              
      * **                                                                      
      * ** DONNEES DE TAXATION                                                  
      * **                                                                      
                                                                                
      * NUMERO DE LOT                                                           
0015          10 'X'-FILLER PIC X.                                              
0016          10 'X'-DNULTF PIC X.                                              
      * NUMERO DE ROLE                                                          
0017          10 'X'-FILLER PIC X.                                              
0018          10 'X'-DNURO  PIC 9(3).                                           
      * CODE ANNULATION-RECONF / REGULARISATION. A:COM ENTIERE - I:IFP          
0021          10 'X'-FILLER PIC X.                                              
0022          10 'X'-GCOANU PIC X.                                              
      * ANCIEN NUMERO DE ROLE POUR ANNULATION-RECONF                            
0023          10 'X'-FILLER PIC X.                                              
0024          10 'X'-DACROL PIC X(3).                                           
      * CODE VALIDATION EFICT.                                                  
0027          10 'X'-FILLER PIC X.                                              
0028          10 'X'-GCOVEF PIC X.                                              
      * ORIGE VALIDATION EFICT                                                  
0029          10 'X'-FILLER PIC X.                                              
0030          10 'X'-GORVEF PIC X.                                              
      * CODE PASSAGE EFICT                                                      
0031          10 'X'-FILLER PIC X.                                              
0032          10 'X'-CCOFDL PIC X.                                              
      * VALIDATION EPCI. V:VALIDE OU ''                                         
0033          10 'X'-FILLER PIC X.                                              
0034          10 'X'-GOKCU  PIC X.                                              
      * **                                                                      
      * ** CARACTERISTIQUES DE LA COMMUNE                                       
      * **                                                                      
                                                                                
      * NBRE D'IFP-TRESO DE LA COMMUNE                                          
0035          10 'X'-FILLER PIC X.                                              
0036          10 'X'-NBIFTR PIC 9(3).                                           
      * NBRE D'IFP DE LA COMMUNE. 1: PAS D'IFP -   >1: NBRE D'IFP               
0039          10 'X'-FILLER PIC X.                                              
0040          10 'X'-NBRIFP PIC 9(3).                                           
      * TOP PREMIERE ANNEE DE FUSION DE LA COMMUNE.                             
0043          10 'X'-FILLER PIC X.                                              
0044          10 'X'-GTOCFU PIC X.                                              
      * CODE NON BATI NON DIFFUSABLE.                                           
0045          10 'X'-FILLER PIC X.                                              
0046          10 'X'-GCNDIF PIC X.                                              
      * CODE BATI NON DIFFUSABLE.                                               
0047          10 'X'-FILLER PIC X.                                              
0048          10 'X'-GCBDIF PIC X.                                              
      * DATE D'HOMOLOGATION                                                     
0049          10 'X'-FILLER PIC X.                                              
              10 'X'-JDAHO1.                                                    
0050            15 'X'-JSSHOM PIC 9(2).                                         
0052            15 'X'-JANHO1 PIC 9(2).                                         
0054            15 'X'-JMOHOM PIC 9(2).                                         
0056            15 'X'-JJRHOM PIC 9(2).                                         
      * DATE DE MISE EN RECOUVREMENT                                            
0058          10 'X'-FILLER PIC X.                                              
              10 'X'-JDAMI1.                                                    
0059            15 'X'-JSSMIR PIC X(2).                                         
0061            15 'X'-JANMIR PIC X(2).                                         
0063            15 'X'-JMOMIR PIC X(2).                                         
0065            15 'X'-JJRMIR PIC X(2).                                         
      * DATE DE MAJORATION                                                      
0067          10 'X'-FILLER PIC X.                                              
              10 'X'-JDAMJO.                                                    
0068            15 'X'-JSSMJO PIC X(2).                                         
0070            15 'X'-JANMJO PIC X(2).                                         
0072            15 'X'-JMOMJO PIC X(2).                                         
0074            15 'X'-JJRMJO PIC X(2).                                         
      * LIBELLE DE LA COMMUNE                                                   
0076          10 'X'-FILLER PIC X.                                              
0077          10 'X'-DLICOM PIC X(30).                                          
      * SIRET DE LA COMMUNE                                                     
0107          10 'X'-FILLER PIC X.                                              
0108          10 'X'-DSIREC PIC X(14).                                          
      * TOP COMMUNE NON TAXABLE AU DEPARTEMENT                                  
0122          10 'X'-FILLER PIC X.                                              
0123          10 'X'-GNIDEP PIC X.                                              
      * TOP COMMUNE APPARTENANT A LA MGP                                        
0124          10 'X'-FILLER PIC X.                                              
0125          10 'X'-GTOMGP PIC X.                                              
      * TOP COMMUNE 1ERE ANNEE APPARTENANCE TPU                                 
0126          10 'X'-FILLER PIC X.                                              
0127          10 'X'-GCEPCI PIC X.                                              
      * TOP VERSEMENT FOND IDF                                                  
0128          10 'X'-FILLER PIC X.                                              
0129          10 'X'-GTIDF  PIC X.                                              
      * CODE COMMUNE RECENSEE. R: RECENCEE - N:NON RECENSEE                     
0130          10 'X'-FILLER PIC X.                                              
0131          10 'X'-CTLORR PIC X.                                              
      * SERVICE DE GESTION DE LA TF. I:SIP - F:CDIF                             
0132          10 'X'-FILLER PIC X.                                              
0133          10 'X'-GSVREC PIC X.                                              
      * CODE CDIF OU SIP (CODE BASE MAJIC)                                      
0134          10 'X'-FILLER PIC X.                                              
0135          10 'X'-CCOBMJ PIC X(4).                                           
      * POPULATION                                                              
0139          10 'X'-FILLER PIC X.                                              
0140          10 'X'-NPOCOM PIC 9(7).                                           
      * POS APPLICABLE. P: OUI - ''                                             
0147          10 'X'-FILLER PIC X.                                              
0148          10 'X'-GMJPOS PIC X.                                              
      * TAUX POS                                                                
0149          10 'X'-FILLER PIC X.                                              
0150          10 'X'-PMJPO  PIC 9(3).                                           
      * INDIC MAJO TC. N: NATIONALE - D: SUR DELIB COMM - '': NEANT             
0153          10 'X'-FILLER PIC X.                                              
0154          10 'X'-DCMZO1 PIC XX.                                             
      * MONTANT VERSEMENT FOND IDF                                              
0156          10 'X'-FILLER PIC X.                                              
              10 'X'-MFSIDF.                                                    
0157            15 'X'-MFSID1 PIC 9(10).                                        
      * VL MOYENNE POUR ECRETEMENT TOM                                          
0167          10 'X'-FILLER PIC X.                                              
0168          10 'X'-DVLPOM PIC 9(6).                                           
      * COEFF ECRETEMENT TOM                                                    
0174          10 'X'-FILLER PIC X.                                              
0175          10 'X'-PPLOM  PIC 9V99.                                           
      * NOMBRE DE TAUX OM FDL. NON VALORISE SI IFP.                             
0178          10 'X'-FILLER PIC X.                                              
0179          10 'X'-NTXOM  PIC 9.                                              
      * NOMBRE DE TAUX COMPTES PAR EFIBA.                                       
0180          10 'X'-FILLER PIC X.                                              
0181          10 'X'-NTXOM1 PIC 9.                                              
      * SEUIL EXO DOM BATI                                                      
0182          10 'X'-FILLER PIC X.                                              
0183          10 'X'-DSEDOM PIC 9(9).                                           
      * SEUIL EXO DOM NON BATI                                                  
0192          10 'X'-FILLER PIC X.                                              
0193          10 'X'-DSEDNB PIC 9(9).                                           
      * OPTION DE COPIE DE ROLE DE LA COMMUNE                                   
0202          10 'X'-FILLER PIC X.                                              
0203          10 'X'-GROCOM PIC X.                                              
      * COEFF DE MODULATION IDF                                                 
0204          10 'X'-FILLER PIC X.                                              
0205          10 'X'-PCFIDF PIC X(3).                                           
      * AVANCEMENT DU PASSAGE DANS EFIRF. '*': EFIRF10 - '':EFIRF25             
0208          10 'X'-FILLER PIC X.                                              
0209          10 'X'-GTOCOM PIC X.                                              
      * ADRESSE EMAIL DE LA COMMUNE (PARTIE GAUCHE ET DROITE)                   
0210          10 'X'-FILLER PIC X.                                              
0211          10 'X'-VMAILG PIC X(50).                                          
0261          10 'X'-VMAILD PIC X(50).                                          
      * COEFFICIENT NEUTRALISATION COMMUNE - TASA                               
0311          10 'X'-FILLER PIC X.                                              
0312          10 'X'-CNCOM           PIC 9(3)V9(6).                             
      * COEFFICIENT NEUTRALISATION EPCI                                         
0321          10 'X'-FILLER PIC X.                                              
0322          10 'X'-CNEPCI PIC 9(3)V9(6).                                      
      * COEFFICIENT NEUTRALISATION DEPARTEMENT                                  
0331          10 'X'-FILLER PIC X.                                              
0332          10 'X'-CNDEP  PIC 9(3)V9(6).                                      
      * COEFFICIENT NEUTRALISATION TEOM                                         
0341          10 'X'-FILLER PIC X.                                              
0342          10 'X'-CNTEOM PIC 9(3)V9(6).                                      
      * COEFFICIENT NEUTRALISATION TSE - GEMAPI                                 
0351          10 'X'-FILLER PIC X.                                              
0352          10 'X'-CNTSE           PIC 9(3)V9(6).                             
      * TOP TEOMI VUE PAR EFIBA60 (AU MOINS UNE PEV COM A DE LA TEOMI)          
0361          10 'X'-FILLER PIC X.                                              
0362          10 'X'-TOP-COM-TEOMI PIC X.                                       
      * LIBRE                                                                   
0363          10 'X'-FILLER PIC X(3638).                                        
