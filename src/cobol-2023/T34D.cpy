      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  T34D                                   
      *    MODIFIE  LE                :  05/01/23 POUR LE D4 2023               
      *   ARTICLE DIRECTION DU TAUDIS                                           
      *                                                                         
      *    ANNEE 2023. LONGUEUR T300 + T34D = 4000                              
      *                                                                         
      *-----------------------------------------------------------              
             03 DONNEES-DIRECTION.                                              
      * LETTRE ARTICLE. 'D' POUR DIRECTION                                      
0013           10 'X'-FILLER PIC X.                                             
0014           10 'X'-DLETAR PIC X.                                             
      * LIBELLE DIRECTION                                                       
0015           10 'X'-FILLER PIC X.                                             
0016           10 'X'-DLIDIR PIC X(30).                                         
      * DATE CREATION DU TAUDIS                                                 
0046           10 'X'-FILLER PIC X.                                             
0047           10 'X'-JDACRE PIC X(8).                                          
      * SIRET DEPARTEMENT                                                       
0055           10 'X'-FILLER PIC X.                                             
0056           10 'X'-DSIRED PIC X(14).                                         
      * NOMBRE DE COMMUNES SUR LA DIRECTION                                     
0070           10 'X'-FILLER PIC X.                                             
0071           10 'X'-NBCOM1 PIC 9(3).                                          
      * ANNEE D'IMPOSITION (AAAA)                                               
0074           10 'X'-FILLER PIC X.                                             
0075           10 'X'-JANROL PIC 9(4).                                          
      * ANNEE DE MER (AA)                                                       
0079           10 'X'-FILLER PIC X.                                             
0080           10 'X'-JANMIR PIC X(2).                                          
      * DATE CREATION / MODIFICATION DU BASEROLE (JJMMAAAA)                     
0082           10 'X'-FILLER PIC X.                                             
0083           10 'X'-JBAROL PIC X(10).                                         
      * DATE D'HOMOLOGATION                                                     
0093           10 'X'-FILLER PIC X.                                             
               10 'X'-JDAHO1.                                                   
0094             15 'X'-JSSHOM PIC 9(2).                                        
0096             15 'X'-JANHO1 PIC 9(2).                                        
0098             15 'X'-JMOHOM PIC 9(2).                                        
0100             15 'X'-JJRHOM PIC 9(2).                                        
      * DATE DE MER DU DERNIER ROLE                                             
0102           10 'X'-FILLER PIC X.                                             
0103           10 'X'-JDAMI1 PIC 9(8).                                          
      * DATE DE MAJORATION DU DERNIER ROLE                                      
0111           10 'X'-FILLER PIC X.                                             
0112           10 'X'-JDAMJO PIC 9(8).                                          
      * DERNIER NUMERO DE LOT TRAITE                                            
0120           10 'X'-FILLER PIC X.                                             
0121           10 'X'-DDRLTF PIC 9.                                             
      * DERNIER NUMERO DE ROLE                                                  
0122           10 'X'-FILLER PIC X.                                             
0123           10 'X'-DDRROL PIC 9(3).                                          
      * TYPE DE ROLE. RG, RD, RR.                                               
0126           10 'X'-FILLER PIC X.                                             
0127           10 'X'-CTYROL PIC XX.                                            
      * DERNIER LOT + NUM ROLE GENERAL INITIAL                                  
0129           10 'X'-FILLER PIC X.                                             
               10 'X'-DHMRG.                                                    
0130             15 'X'-DDRHMG PIC 9.                                           
0131             15 'X'-DDRROG PIC 9(3).                                        
      * DERNIER LOT + NUM ROLE GENERAL DIFFERE                                  
0134           10 'X'-FILLER PIC X.                                             
               10 'X'-DHMRD.                                                    
0135             15 'X'-DDRHMD PIC 9.                                           
0136             15 'X'-DDRROD PIC 9(3).                                        
      * DERNIER LOT + NUM ROLE GENERAL RECONFECTIONNE                           
0139           10 'X'-FILLER PIC X.                                             
               10 'X'-DHMRR.                                                    
0140             15 'X'-DDRHMR PIC 9.                                           
0141             15 'X'-DDRROR PIC 9(3).                                        
      * CODE VALIDATION EFICT. 'V' = VALID, '' = NON                            
0144           10 'X'-FILLER PIC X.                                             
0145           10 'X'-GCOVEF PIC X.                                             
      * ORIGINE VALIDATION EFICT. 'C' = CLIST, '' = BATCH                       
0146           10 'X'-FILLER PIC X.                                             
0147           10 'X'-GORVEF PIC X.                                             
      * CODE VALIDATION FDL. '1' = VALID, '' = NON                              
0148           10 'X'-FILLER PIC X.                                             
0149           10 'X'-GCOFDL PIC X.                                             
      * CODE PASSAGE FDL. 1, 2, 3,...                                           
0150           10 'X'-FILLER PIC X.                                             
0151           10 'X'-CCOFDL PIC X.                                             
      * TOUTES COMMUNES TAXEES. '*' OU BLANC                                    
0152           10 'X'-FILLER PIC X.                                             
0153           10 'X'-GTACOM PIC X.                                             
      * TOUTES COMMUNES PARIS TAXEES. '*' OU BLANC                              
0154           10 'X'-FILLER PIC X.                                             
0155           10 'X'-GTACO2 PIC X.                                             
      * CODE CONTENTIEUX (IS) OU TAXATION. C = CONTENTIEUX, T = TAXATION        
0156           10 'X'-FILLER PIC X.                                             
0157           10 'X'-GTOCTX PIC X.                                             
      * TOP ROLE PRIMITIF. '*' = RMP, BLANC = RS OU RP                          
0158           10 'X'-FILLER PIC X.                                             
0159           10 'X'-GTOROP PIC X.                                             
      * TOP DGE. G = DGE, P = CP                                                
0160           10 'X'-FILLER PIC X.                                             
0161           10 'X'-GPCTFX PIC X.                                             
      * TOP TAXATION DGE SEULE                                                  
0162           10 'X'-FILLER PIC X.                                             
0163           10 'X'-GTODGS PIC X.                                             
      * OPTION COPIE DE ROLE DEPARTEMENT                                        
0164           10 'X'-FILLER PIC X.                                             
0165           10 'X'-GRODEP PIC X.                                             
      * OPTION COPIE DE ROLE REGION BENEF DE LA TASA                            
0166           10 'X'-FILLER PIC X.                                             
0167           10 'X'-GROTAS PIC X.                                             
      * TAUX BATI DEPARTEMENT ON GARDE POUR LES IS                              
0168           10 'X'-FILLER PIC X.                                             
0169           10 'X'-PTBDEP PIC 9(4)V9(6).                                     
      * TAUX BATI TASA                                                          
0179           10 'X'-FILLER PIC X.                                             
0180           10 'X'-PTBTAS PIC 9(4)V9(6).                                     
      * TAUX NON BATI CHAMBRE AGRICULTURE                                       
0190           10 'X'-FILLER PIC X.                                             
0191           10 'X'-PNBAGR PIC 9(4)V9(6).                                     
      * TAUX NON BATI CHAMBRE CONSULAIRE SAINT-MARTIN (971)                     
0201           10 'X'-FILLER PIC X.                                             
0202           10 'X'-PNBAGN PIC 9(4)V9(6).                                     
      * SIRET DE LA CHAMBRE D'AGRICULTURE                                       
0212           10 'X'-FILLER PIC X.                                             
0213           10 'X'-SIRET-CHAGR PIC X(14).                                    
      * PRODUIT ATTENDU CH AGRIC TOTAL                                          
0227           10 'X'-FILLER PIC X.                                             
0228           10 'X'-TPNAGR PIC 9(10).                                         
      * PRODUIT ATTENDU CH AGRIC (PRORATA DIRECTION PARISIENNES)                
0238           10 'X'-FILLER PIC X.                                             
0239           10 'X'-MPNAGR PIC 9(10).                                         
      * CODE ETABLISSEMENTS TSE (5 ETAB MAX)                                    
               10 'X'-ADTTSE OCCURS 5.                                          
0249             15 'X'-FILLER PIC X.                                           
0250             15 'X'-ACOETS PIC X(4).                                        
      * PRODUIT ATTENDU BATI TSE TOTAL                                          
0254             15 'X'-FILLER PIC X.                                           
0255             15 'X'-TPBTSE PIC 9(10).                                       
      * PRODUIT ATTENDU BATI TSE (PRORATA DIRECTION PARISIENNES)                
0265             15 'X'-FILLER PIC X.                                           
0266             15 'X'-MPBTSE PIC 9(10).                                       
      * PRODUIT ATTENDU BATI TSE DONNE PAR FDL                                  
0276             15 'X'-FILLER PIC X.                                           
0277             15 'X'-MPBTSX PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI TSE TOTAL                                      
0287             15 'X'-FILLER PIC X.                                           
0288             15 'X'-TPNTSE PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI TSE (PRORATA DIR PARISIENNES)                  
0298             15 'X'-FILLER PIC X.                                           
0299             15 'X'-MPNTSE PIC 9(10).                                       
      * NOMBRE DE TSE SUR LA DIRECTION                                          
0549           10 'X'-FILLER PIC X.                                             
0550           10 'X'-NBTSE  PIC 9(2).                                          
      * SIRET DE LA REGION BENEF DE LA TASA                                     
0552           10 'X'-FILLER PIC X.                                             
0553           10 'X'-DSITAS PIC X(14).                                         
      * PRODUIT ATTENDU TASA TOTAL                                              
0567           10 'X'-FILLER PIC X.                                             
0568           10 'X'-TPBTAS PIC 9(10).                                         
      * PRODUIT ATTENDU TASA (PRORATA DIRECTION PARISIENNES)                    
0578           10 'X'-FILLER PIC X.                                             
0579           10 'X'-MPBTAS PIC 9(10).                                         
      * PRODUIT ATTENDU TASA DONNE PAR FDL                                      
0589           10 'X'-FILLER PIC X.                                             
0590           10 'X'-MPBTAX PIC 9(10).                                         
      * NUMERO DE FACTURE BORNE INFERIEURE                                      
0600           10 'X'-FILLER PIC X.                                             
0601           10 'X'-VBOINF PIC 9(7).                                          
      * NUMERO DE FACTURE BORNE SUPERIEURE                                      
0608           10 'X'-FILLER PIC X.                                             
0609           10 'X'-VBOSUP PIC 9(7).                                          
      * DERNIER NUMERO DE FACTURE ATTRIBUE                                      
0616           10 'X'-FILLER PIC X.                                             
0617           10 'X'-DDRAVI PIC 9(7).                                          
      * NOMBRE ARTICLES DU ROLE SANS ADRESSE D'ENVOI                            
0624           10 'X'-FILLER PIC X.                                             
0625           10 'X'-NARSAE PIC 9(6).                                          
      * NOMBRE ARTICLES DU ROLE SANS IUI                                        
0631           10 'X'-FILLER PIC X.                                             
0632           10 'X'-NARSIU PIC 9(6).                                          
      * COMPTEURS HCNT ET BOND                                                  
0638           10 'X'-FILLER PIC X.                                             
               10 'X'-ANACNT.                                                   
0639             15 'X'-NBHCNT PIC 9(7) OCCURS 16.                              
               10 'X'-ANBOND.                                                   
0751             15 'X'-NABOND PIC 9(7) OCCURS 16.                              
      * ADRESSE EMAIL DU DEPARTEMENT (PARTIE GAUCHE ET DROITE)                  
0863           10 'X'-FILLER PIC X.                                             
0864           10 'X'-VMAILG PIC X(50).                                         
0914           10 'X'-VMAILD PIC X(50).                                         
      * ADRESSE EMAIL DE LA REGION BENEF DE LA TASA (GAUCHE ET DROITE)          
0964           10 'X'-FILLER PIC X.                                             
0965           10 'X'-VMGTAS PIC X(50).                                         
1015           10 'X'-VMDTAS PIC X(50).                                         
      * NUMERO SIREN DE LA METROPOLE DU GRAND PARIS                             
1065           10 'X'-FILLER PIC X.                                             
1066           10 'X'-SIREN-MGP PIC X(9).                                       
      * LIBELLE DU CHEF LIEU DE LA DIRECTION                                    
1075           10 'X'-FILLER PIC X.                                             
1076           10 'X'-LIBEL-CHEF-LIEU PIC X(30).                                
      *                                                                         
1106           10 'X'-FILLER PIC X(2895).                                       
