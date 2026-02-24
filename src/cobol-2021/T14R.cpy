      *-----------------------------------------------------------              
      *    ARTICLE IFP TRESORERIE DU TAUDIS                                     
      *                                                                         
      *    ANNEE 2021. LONGUEUR T100 + T14R = 4000                              
      *                                                                         
      *-----------------------------------------------------------              
             03 DONNEES-IFP-TRESO.                                              
      * LETTRE ARTICLE. 'I' POUR IFP-TRESO                                      
0013           10 'X'-FILLER PIC X.                                             
0014           10 'X'-DLETAR PIC X.                                             
      * NUMERO DE LOT                                                           
0015           10 'X'-FILLER PIC X.                                             
0016           10 'X'-DNULTF PIC X.                                             
      * NUMERO DE ROLE                                                          
0017           10 'X'-FILLER PIC X.                                             
0018           10 'X'-DNURO  PIC 9(3).                                          
      * TOP ROLE REGULE                                                         
0021           10 'X'-FILLER PIC X.                                             
0022           10 'X'-GCOANU PIC X.                                             
      * ANCIEN NUMERO DE ROLE                                                   
0023           10 'X'-FILLER PIC X.                                             
0024           10 'X'-DACROL PIC X(3).                                          
      * DIRECTION DE RECOUVREMENT (960 SI DGE)                                  
0027           10 'X'-FILLER PIC X.                                             
0028           10 'X'-CCPDIR PIC X(3).                                          
      * TRESORERIE DE RECOUVREMENT (030 SI DGE)                                 
0031           10 'X'-FILLER PIC X.                                             
0032           10 'X'-CSPER  PIC XXX.                                           
      * TOP INDIQUANT EXISTENCE IFP TRESO EN N-1                                
0035           10 'X'-FILLER PIC X.                                             
0036           10 'X'-TOP-IFPTRESO-ANC PIC X.                                   
                                                                                
0037           10 'X'-FILLER PIC XX.                                            
                                                                                
      ********************************************                              
      *                                          *                              
      *  TAUX D'IMPOSITION                       *                              
      *                                          *                              
      ********************************************                              
               10 'X'-TAUX.                                                     
      * TAUX COMMUNAL BATI                                                      
0039             15 'X'-FILLER PIC X.                                           
0040             15 'X'-PTBCOM PIC 9(4)V9(6).                                   
      * TAUX SYNDICATS COMMUNAUX BATI                                           
0050             15 'X'-FILLER PIC X.                                           
0051             15 'X'-PTBSYN PIC 9(4)V9(6).                                   
      * TAUX EPCI BATI                                                          
0061             15 'X'-FILLER PIC X.                                           
0062             15 'X'-PTBCU  PIC 9(4)V9(6).                                   
      * TAUX DEPARTEMENTAL BATI                                                 
0072             15 'X'-FILLER PIC X.                                           
0073             15 'X'-PTBDEP PIC 9(4)V9(6).                                   
                 15 'X'-PTBTSE OCCURS 2.                                        
      * TAUX TSE BATIS  (DE 0 A 2 TAUX)                                         
0083               20 'X'-FILLER PIC X.                                         
0084               20 'X'-PTBTSN PIC 9(4)V9(6).                                 
      * TAUX TASA BATI                                                          
0105             15 'X'-FILLER PIC X.                                           
0106             15 'X'-PTBTAS PIC 9(4)V9(6).                                   
      * TAUX GEMAPI BATI                                                        
0116             15 'X'-FILLER PIC X.                                           
0117             15 'X'-PTBGEM PIC 9(4)V9(6).                                   
      * TAUX AMALGAME TSE1 + TSE 2 + TASA BATI                                  
0127             15 'X'-FILLER PIC X.                                           
0128             15 'X'-PTBTST PIC 9(4)V9(6).                                   
      * TAUX COMMUNAL NON BATI                                                  
0138             15 'X'-FILLER PIC X.                                           
0139             15 'X'-PNBCOM PIC 9(4)V9(6).                                   
      * TAUX SYNDICATS COMMUNAUX NON BATI                                       
0149             15 'X'-FILLER PIC X.                                           
0150             15 'X'-PNBSYN PIC 9(4)V9(6).                                   
      * TAUX EPCI NON BATI                                                      
0160             15 'X'-FILLER PIC X.                                           
0161             15 'X'-PNBCU  PIC 9(4)V9(6).                                   
      * TAUX TAXE ADDITIONNELLE NON BATI                                        
0171             15 'X'-FILLER PIC X.                                           
0172             15 'X'-PNBTXA PIC 9(4)V9(6).                                   
                 15 'X'-PNBTSE OCCURS 2.                                        
      * TAUX TSE NON BATIS  (DE 0 A 2 TAUX)                                     
0182               20 'X'-FILLER PIC X.                                         
0183               20 'X'-PNBTSN PIC 9(4)V9(6).                                 
      * TAUX GEMAPI NON BATI                                                    
0204             15 'X'-FILLER PIC X.                                           
0205             15 'X'-PNBGEM PIC 9(4)V9(6).                                   
      * TAUX CHAMBRE AGRICULTURE NON BATI                                       
0215             15 'X'-FILLER PIC X.                                           
0216             15 'X'-PNBAGR PIC 9(4)V9(6).                                   
      * TAUX CAAA NON BATI                                                      
0226             15 'X'-FILLER PIC X.                                           
0227             15 'X'-PNBCAA PIC 9(4)V9(6).                                   
      * TAUX AMALGAME TSE1 + TSE 2 NON BATI                                     
0237             15 'X'-FILLER PIC X.                                           
0238             15 'X'-PNBTST PIC 9(4)V9(6).                                   
      * TAUX CHAMBRE AGRICULTURE SAINT MARTIN (971127)                          
0248             15 'X'-FILLER PIC X.                                           
0249             15 'X'-PNBAGN PIC 9(4)V9(6).                                   
      * TAUX PLEIN DES OM                                                       
0259             15 'X'-FILLER PIC X.                                           
0260             15 'X'-PBBOMP PIC 9(4)V9(6).                                   
      * TAUX REDUIT A DES OM                                                    
0270             15 'X'-FILLER PIC X.                                           
0271             15 'X'-PBBOMA PIC 9(4)V9(6).                                   
      * TAUX REDUIT B DES OM                                                    
0281             15 'X'-FILLER PIC X.                                           
0282             15 'X'-PBBOMB PIC 9(4)V9(6).                                   
      * TAUX REDUIT C DES OM                                                    
0292             15 'X'-FILLER PIC X.                                           
0293             15 'X'-PBBOMC PIC 9(4)V9(6).                                   
      * TAUX REDUIT D DES OM                                                    
0303             15 'X'-FILLER PIC X.                                           
0304             15 'X'-PBBOMD PIC 9(4)V9(6).                                   
      * TAUX REDUIT E DES OM                                                    
0314             15 'X'-FILLER PIC X.                                           
0315             15 'X'-PBBOME PIC 9(4)V9(6).                                   
      * NOMBRE DE TAUX OM DANS CETTE IFP TRESO                                  
0325             15 'X'-FILLER PIC X.                                           
0326             15 'X'-NTXOM  PIC 9.                                           
                                                                                
      ********************************************                              
      *                                          *                              
      *  EPCI                                    *                              
      *                                          *                              
      ********************************************                              
      * CODE EPCI AUQUEL LA COMMUNE EST RATTACHE                                
               10 'X'-EPCI.                                                     
0327             15 'X'-FILLER PIC X.                                           
                 15 'X'-ACOGC.                                                  
0328               20 'X'-CTYGC1 PIC X.                                         
0329               20 'X'-CCOIC PIC 9(3).                                       
      * REGIME FISCAL EPCI. FPA OU FPU                                          
0332             15 'X'-FILLER PIC X.                                           
0333             15 'X'-RFEPCI PIC X(3).                                        
      * TOP FUSION OU RATTACHEMENT EPCI BATI.F:FUSION-R:RATTACH-'':NA           
0336             15 'X'-FILLER PIC X.                                           
0337             15 'X'-GTOCOB PIC X.                                           
      * TOP FUSION OU RATTACHEMENT EPCI NBAT.F:FUSION-R:RATTACH-'':NA           
0338             15 'X'-FILLER PIC X.                                           
0339             15 'X'-GTOCON PIC X.                                           
                                                                                
      ********************************************                              
      *                                          *                              
      *  BASES D'IMPOSITION                      *                              
      *                                          *                              
      ********************************************                              
               10 'X'-BASES.                                                    
      * BASE BATIE COMMUNE                                                      
0340             15 'X'-FILLER PIC X.                                           
0341             15 'X'-TBBCO  PIC 9(15).                                       
      * BASE BATIE SYNDICAT                                                     
0356             15 'X'-FILLER PIC X.                                           
0357             15 'X'-TBBSY  PIC 9(15).                                       
      * BASE BATIE EPCI                                                         
0372             15 'X'-FILLER PIC X.                                           
0373             15 'X'-TBBCU1 PIC 9(15).                                       
      * BASE BATIE DEPARTEMENT                                                  
0388             15 'X'-FILLER PIC X.                                           
0389             15 'X'-TBBDE  PIC 9(15).                                       
                 15 'X'-TBBTS OCCURS 2.                                         
      * BASES BATIES TSE 1 ET TSE 2                                             
0404               20 'X'-FILLER PIC X.                                         
0405               20 'X'-TBBTSN PIC 9(15).                                     
      * BASE BATIE TASA                                                         
0436             15 'X'-FILLER PIC X.                                           
0437             15 'X'-TBBTAS PIC 9(15).                                       
      * BASE BATIE GEMAPI                                                       
0452             15 'X'-FILLER PIC X.                                           
0453             15 'X'-TBBGEM PIC 9(15).                                       
      * BASE NON BATIE COMMUNE                                                  
0468             15 'X'-FILLER PIC X.                                           
0469             15 'X'-TBNCO  PIC 9(15).                                       
      * BASE NON BATIE SYNDICAT                                                 
0484             15 'X'-FILLER PIC X.                                           
0485             15 'X'-TBNSY  PIC 9(15).                                       
      * BASE NON BATIE EPCI                                                     
0500             15 'X'-FILLER PIC X.                                           
0501             15 'X'-TBNCU1 PIC 9(15).                                       
      * BASE NON BATIE TAXE ADDITIONNELLE                                       
0516             15 'X'-FILLER PIC X.                                           
0517             15 'X'-TBNDE  PIC 9(15).                                       
                 15 'X'-TBNTS OCCURS 2.                                         
      * BASES NON BATIES TSE 1 ET TSE 2                                         
0532               20 'X'-FILLER PIC X.                                         
0533               20 'X'-TBNTSN PIC 9(15).                                     
      * BASE NON BATIE GEMAPI                                                   
0564             15 'X'-FILLER PIC X.                                           
0565             15 'X'-TBNGEM PIC 9(15).                                       
      * BASE NON BATIE CHAMBRE D'AGRICULTURE                                    
0580             15 'X'-FILLER PIC X.                                           
0581             15 'X'-TBNC1  PIC 9(15).                                       
      * BASE NON BATIE CAAA                                                     
0596             15 'X'-FILLER PIC X.                                           
0597             15 'X'-TBNCAA PIC 9(15).                                       
      * BASE OM TAUX PLEIN                                                      
0612             15 'X'-FILLER PIC X.                                           
0613             15 'X'-TBBOM1 PIC 9(15).                                       
      * BASE OM TAUX REDUIT A                                                   
0628             15 'X'-FILLER PIC X.                                           
0629             15 'X'-TBBOMA PIC 9(15).                                       
      * BASE OM TAUX REDUIT B                                                   
0644             15 'X'-FILLER PIC X.                                           
0645             15 'X'-TBBOMB PIC 9(15).                                       
      * BASE OM TAUX REDUIT C                                                   
0660             15 'X'-FILLER PIC X.                                           
0661             15 'X'-TBBOMC PIC 9(15).                                       
      * BASE OM TAUX REDUIT D                                                   
0676             15 'X'-FILLER PIC X.                                           
0677             15 'X'-TBBOMD PIC 9(15).                                       
      * BASE OM TAUX REDUIT E                                                   
0692             15 'X'-FILLER PIC X.                                           
0693             15 'X'-TBBOME PIC 9(15).                                       
      * BASE TOTALE OM                                                          
0708             15 'X'-FILLER PIC X.                                           
0709             15 'X'-TBBOM2 PIC 9(15).                                       
                                                                                
      ********************************************                              
      *                                          *                              
      *  COTISATIONS                             *                              
      *                                          *                              
      ********************************************                              
               10 'X'-COTISATIONS.                                              
      * COTISATION BATIE COMMUNE                                                
0724             15 'X'-FILLER PIC X.                                           
0725             15 'X'-MCBCO3 PIC 9(10).                                       
      * COTISATION BATIE SYNDICAT                                               
0735             15 'X'-FILLER PIC X.                                           
0736             15 'X'-MCBSY3 PIC 9(10).                                       
      * COTISATION BATIE EPCI                                                   
0746             15 'X'-FILLER PIC X.                                           
0747             15 'X'-MCBCU3 PIC 9(10).                                       
      * COTISATION BATIE DEPARTEMENT                                            
0757             15 'X'-FILLER PIC X.                                           
0758             15 'X'-MCBDE3 PIC 9(10).                                       
                 15 'X'-MCBTS OCCURS 2.                                         
      * COTISATIONS BATIES TSE 1 ET TSE 2                                       
0768               20 'X'-FILLER PIC X.                                         
0769               20 'X'-MCBTSN PIC 9(10).                                     
      * COTISATION BATIE TASA                                                   
0790             15 'X'-FILLER PIC X.                                           
0791             15 'X'-MCBTA3 PIC 9(10).                                       
      * COTISATION BATIE AMALGAMEE TSE 1 + TSE 2 + TASA                         
0801             15 'X'-FILLER PIC X.                                           
0802             15 'X'-MCBTSA PIC 9(10).                                       
      * COTISATION BATIE GEMAPI                                                 
0812             15 'X'-FILLER PIC X.                                           
0813             15 'X'-MCBGE3 PIC 9(10).                                       
      * COTISATION BATIE AU PROFIT DE L'ETAT (POUR IS)                          
0823             15 'X'-FILLER PIC X.                                           
0824             15 'X'-MCBETA PIC 9(10).                                       
      * COTISATION NON BATIE COMMUNE                                            
0834             15 'X'-FILLER PIC X.                                           
0835             15 'X'-MCNCO3 PIC 9(10).                                       
      * COTISATION NON BATIE SYNDICAT                                           
0845             15 'X'-FILLER PIC X.                                           
0846             15 'X'-MCNSY3 PIC 9(10).                                       
      * COTISATION NON BATIE EPCI                                               
0856             15 'X'-FILLER PIC X.                                           
0857             15 'X'-MCNCU3 PIC 9(10).                                       
      * COTISATION NON BATIE TAXE ADDITIONNELLE                                 
0867             15 'X'-FILLER PIC X.                                           
0868             15 'X'-MCNDE3 PIC 9(10).                                       
                 15 'X'-MCNTS OCCURS 2.                                         
      * COTISATIONS NON BATIES TSE 1 ET TSE 2                                   
0878               20 'X'-FILLER PIC X.                                         
0879               20 'X'-MCNTSN PIC 9(10).                                     
      * COTISATION NON BATIE AMALGAMEE TSE 1 + TSE 2                            
0900             15 'X'-FILLER PIC X.                                           
0901             15 'X'-MCNTSA PIC 9(10).                                       
      * COTISATION NON BATIE GEMAPI                                             
0911             15 'X'-FILLER PIC X.                                           
0912             15 'X'-MCNGE3 PIC 9(10).                                       
      * COTISATION NON BATIE CHAMBRE D'AGRICULTURE                              
0922             15 'X'-FILLER PIC X.                                           
0923             15 'X'-MCNC1  PIC 9(10).                                       
      * COTISATION NON BATIE CAAA DROITS PROPORTIONNELS                         
0933             15 'X'-FILLER PIC X.                                           
0934             15 'X'-MCNAP1 PIC 9(10).                                       
      * COTISATION NON BATIE CAAA DROITS FIXES                                  
0944             15 'X'-FILLER PIC X.                                           
0945             15 'X'-MCNAF2 PIC 9(10).                                       
      * COTISATION NON BATIE AU PROFIT DE L'ETAT (POUR IS)                      
0955             15 'X'-FILLER PIC X.                                           
0956             15 'X'-MCNETA PIC 9(10).                                       
      * COTISATION NON BATIE TERRAIN A BATIR COMMUNE (POUR IS)                  
0966             15 'X'-FILLER PIC X.                                           
0967             15 'X'-MCTCO1 PIC 9(10).                                       
      * COTISATION NON BATIE TERRAIN A BATIR SYNDICAT (POUR IS)                 
0977             15 'X'-FILLER PIC X.                                           
0978             15 'X'-MCTSY1 PIC 9(10).                                       
      * COTISATION NON BATIE TERRAIN A BATIR EPCI (POUR IS)                     
0988             15 'X'-FILLER PIC X.                                           
0989             15 'X'-MCTCU1 PIC 9(10).                                       
      * COTISATION NON BATIE TERRAIN A BATIR TAXE ADDIT. (POUR IS)              
0999             15 'X'-FILLER PIC X.                                           
1000             15 'X'-MCTDE1 PIC 9(10).                                       
      * COTISATION OM TAUX PLEIN                                                
1010             15 'X'-FILLER PIC X.                                           
1011             15 'X'-MC1OMP PIC 9(10).                                       
      * COTISATION OM TAUX REDUIT A                                             
1021             15 'X'-FILLER PIC X.                                           
1022             15 'X'-MC1OMA PIC 9(10).                                       
      * COTISATION OM TAUX REDUIT B                                             
1032             15 'X'-FILLER PIC X.                                           
1033             15 'X'-MC1OMB PIC 9(10).                                       
      * COTISATION OM TAUX REDUIT C                                             
1043             15 'X'-FILLER PIC X.                                           
1044             15 'X'-MC1OMC PIC 9(10).                                       
      * COTISATION OM TAUX REDUIT D                                             
1054             15 'X'-FILLER PIC X.                                           
1055             15 'X'-MC1OMD PIC 9(10).                                       
      * COTISATION OM TAUX REDUIT E                                             
1065             15 'X'-FILLER PIC X.                                           
1066             15 'X'-MC1OME PIC 9(10).                                       
      * COTISATION OM TEOMI                                                     
1076             15 'X'-FILLER PIC X.                                           
1077             15 'X'-MC1OMI PIC 9(10).                                       
      * COTISATION TOTALE OM                                                    
1087             15 'X'-FILLER PIC X.                                           
1088             15 'X'-MCTOM1 PIC 9(10).                                       
                 15 'X'-TCTOM  REDEFINES 'X'-MCTOM1 PIC 9(10).                  
                                                                                
      ********************************************                              
      *                                          *                              
      *  PRODUITS ATTENDUS                       *                              
      *                                          *                              
      ********************************************                              
               10 'X'-PRODUITS-ATTENDUS.                                        
      * PRODUIT ATTENDU BATI COMMUNE                                            
1098             15 'X'-FILLER PIC X.                                           
1099             15 'X'-MPBCOM PIC 9(10).                                       
                 15 'X'-APBSYN.                                                 
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 1                                
1109               20 'X'-FILLER PIC X.                                         
1110               20 'X'-MPBSYA PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 2                                
1120               20 'X'-FILLER PIC X.                                         
1121               20 'X'-MPBSYB PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 3                                
1131               20 'X'-FILLER PIC X.                                         
1132               20 'X'-MPBSYC PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 4                                
1142               20 'X'-FILLER PIC X.                                         
1143               20 'X'-MPBSYD PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 5                                
1153               20 'X'-FILLER PIC X.                                         
1154               20 'X'-MPBSYE PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 6                                
1164               20 'X'-FILLER PIC X.                                         
1165               20 'X'-MPBSYF PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 7                                
1175               20 'X'-FILLER PIC X.                                         
1176               20 'X'-MPBSYG PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 8                                
1186               20 'X'-FILLER PIC X.                                         
1187               20 'X'-MPBSYH PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 9                                
1197               20 'X'-FILLER PIC X.                                         
1198               20 'X'-MPBSYI PIC 9(10).                                     
      * PRODUIT ATTENDU BATI SYNDICAT COMMUNAL 10                               
1208               20 'X'-FILLER PIC X.                                         
1209               20 'X'-MPBSYJ PIC 9(10).                                     
                 15 'X'-APBTAB REDEFINES 'X'-APBSYN.                            
                   20 'X'-APBPOS OCCURS 10.                                     
                     25 'X'-FILLER PIC X.                                       
                     25 'X'-MPBSYN PIC 9(10).                                   
      * PRODUIT ATTENDU BATI EPCI                                               
1219             15 'X'-FILLER PIC X.                                           
1220             15 'X'-MPBCU  PIC 9(10).                                       
      * PRODUIT ATTENDU BATI DEPARTEMENT                                        
1230             15 'X'-FILLER PIC X.                                           
1231             15 'X'-MPBDEP PIC 9(10).                                       
                 15 'X'-MPBTSE OCCURS 2.                                        
      * PRODUIT ATTENDU BATI TSE 1 ET TSE 2                                     
1241               20 'X'-FILLER PIC X.                                         
1242               20 'X'-MPBTSN PIC 9(10).                                     
      * PRODUIT ATTENDU BATI TASA                                               
1263             15 'X'-FILLER PIC X.                                           
1264             15 'X'-MPBTAS PIC 9(10).                                       
      * PRODUIT ATTENDU BATI GEMAPI                                             
1274             15 'X'-FILLER PIC X.                                           
1275             15 'X'-MPBGEM PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI COMMUNE                                        
1285             15 'X'-FILLER PIC X.                                           
1286             15 'X'-MPNCOM PIC 9(10).                                       
                 15 'X'-APNSYN.                                                 
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 1                            
1296               20 'X'-FILLER PIC X.                                         
1297               20 'X'-MPNSYA PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 2                            
1307               20 'X'-FILLER PIC X.                                         
1308               20 'X'-MPNSYB PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 3                            
1318               20 'X'-FILLER PIC X.                                         
1319               20 'X'-MPNSYC PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 4                            
1329               20 'X'-FILLER PIC X.                                         
1330               20 'X'-MPNSYD PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 5                            
1340               20 'X'-FILLER PIC X.                                         
1341               20 'X'-MPNSYE PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 6                            
1351               20 'X'-FILLER PIC X.                                         
1352               20 'X'-MPNSYF PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 7                            
1362               20 'X'-FILLER PIC X.                                         
1363               20 'X'-MPNSYG PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 8                            
1373               20 'X'-FILLER PIC X.                                         
1374               20 'X'-MPNSYH PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 9                            
1384               20 'X'-FILLER PIC X.                                         
1385               20 'X'-MPNSYI PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI SYNDICAT COMMUNAL 10                           
1395               20 'X'-FILLER PIC X.                                         
1396               20 'X'-MPNSYJ PIC 9(10).                                     
                 15 'X'-APNTAB REDEFINES 'X'-APNSYN.                            
                   20 'X'-APNPOS OCCURS 10.                                     
                     25 'X'-FILLER PIC X.                                       
                     25 'X'-MPNSYN PIC 9(10).                                   
      * PRODUIT ATTENDU NON BATI EPCI                                           
1406             15 'X'-FILLER PIC X.                                           
1407             15 'X'-MPNCU  PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI TAXE ADDITIONNELLE                             
1417             15 'X'-FILLER PIC X.                                           
1418             15 'X'-MPNDEP PIC 9(10).                                       
                 15 'X'-MPNTSE OCCURS 2.                                        
      * PRODUIT ATTENDU NON BATI TSE 1 ET TSE 2                                 
1428               20 'X'-FILLER PIC X.                                         
1429               20 'X'-MPNTSN PIC 9(10).                                     
      * PRODUIT ATTENDU NON BATI GEMAPI                                         
1450             15 'X'-FILLER PIC X.                                           
1451             15 'X'-MPNGEM PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI CHAMBRE D'AGRICULTURE                          
1461             15 'X'-FILLER PIC X.                                           
1462             15 'X'-MPNCAR PIC 9(10).                                       
      * PRODUIT ATTENDU NON BATI CAAA                                           
1472             15 'X'-FILLER PIC X.                                           
1473             15 'X'-MPNAAP PIC 9(10).                                       
      * PRODUIT ATTENDU OM COMMUNE                                              
1483             15 'X'-FILLER PIC X.                                           
1484             15 'X'-MPOCOM PIC 9(10).                                       
      * PRODUIT ATTENDU OM SYNDICAT OM                                          
1494             15 'X'-FILLER PIC X.                                           
1495             15 'X'-MPOSY  PIC 9(10).                                       
      * PRODUIT ATTENDU OM EPCI                                                 
1505             15 'X'-FILLER PIC X.                                           
1506             15 'X'-MPOCU  PIC 9(10).                                       
                                                                                
      ********************************************                              
      *                                          *                              
      *  DELIBERATIONS OM                        *                              
      *                                          *                              
      ********************************************                              
               10 'X'-DELIBERATIONS-OM.                                         
      * CODE BENEFICIAIRE DES OM   22: COM   23: EPCI   34: SYND OM             
1516             15 'X'-FILLER PIC X.                                           
1517             15 'X'-CCOBOM PIC 9(2).                                        
      * CODE COLLECTIVITE BENEFICIAIRE DES OM                                   
1519             15 'X'-FILLER PIC X.                                           
                 15 'X'-ACOSYN.                                                 
1520               20 'X'-CTYSYN PIC X.                                         
1521               20 'X'-CCOSYN PIC X(3).                                      
      * CODE COLLECTIVITE GESTIONNAIRE DES OM                                   
1524             15 'X'-FILLER PIC X.                                           
1525             15 'X'-ACOGOM PIC X(4).                                        
      * CODE BENEFICIAIRE DE LA TEOMI  22: COM   23: EPCI   34: SYND OM         
1529             15 'X'-FILLER PIC X.                                           
1530             15 'X'-CCOBIM PIC 9(2).                                        
      * CODE COLLECTIVITE BENEFICIAIRE DE LE TEOMI                              
1532             15 'X'-FILLER PIC X.                                           
1533             15 'X'-ACOBIM PIC X(4).                                        
      * INDICATEUR DE LA TAXATION A LA TEOMI  ('O'/'N'/' ')                     
1537             15 'X'-FILLER PIC X.                                           
1538             15 'X'-GIMOMI PIC X.                                           
      * INDICATEUR DE TAXATION TEOM ET TEOMI                                    
      * AVEC FRAIS REDUITS ('O'/'N'/' ')                                        
1539             15 'X'-FILLER PIC X.                                           
1540             15 'X'-TOTOFR PIC X.                                           
                                                                                
      ********************************************                              
      *                                          *                              
      *  DELIBERATIONS TSE                       *                              
      *                                          *                              
      ********************************************                              
               10 'X'-DELIBERATIONS-TSE.                                        
                 15 'X'-ACOET OCCURS 2.                                         
      * CODE ETABLISSEMENT TSE 1 ET TSE 2                                       
1541               20 'X'-FILLER PIC X.                                         
1542               20 'X'-ACOETS PIC X(4).                                      
      * POSTE TSE DANS LA TABLE DE L'ENREGISTREMENT DIRECTION                   
1546               20 'X'-FILLER PIC X.                                         
1547               20 'X'-DNUTSE PIC 9(2).                                      
                                                                                
      ********************************************                              
      *                                          *                              
      *  DELIBERATIONS TAXE ADDIT ET GEMAPI      *                              
      *                                          *                              
      ********************************************                              
               10 'X'-DELIBERATIONS-AUTRES.                                     
      * BENEFICIAIRE DE LA TAXE ADDITIONNELLE                                   
1557             15 'X'-FILLER PIC X.                                           
1558             15 'X'-ACOTXA PIC X(4).                                        
      * BENEFICIAIRE DE LA GEMAPI                                               
1562             15 'X'-FILLER PIC X.                                           
1563             15 'X'-ACOGEM PIC X(4).                                        
                                                                                
      ********************************************                              
      *                                          *                              
      *  MONTANTS ET DEGREVEMENTS                *                              
      *                                          *                              
      ********************************************                              
               10 'X'-MONTANTS-DEGVT.                                           
      * MONTANT DES AMENDES (NON MIS EN PLACE. DONC NUL)                        
1567             15 'X'-FILLER PIC X.                                           
1568             15 'X'-MCTAMD PIC 9(10).                                       
      * MONTANT DU ROLE                                                         
1578             15 'X'-FILLER PIC X.                                           
1579             15 'X'-MMTROL PIC 9(10).                                       
      * COTISATIONS INFERIEURES A 12 þ                                          
1589             15 'X'-FILLER PIC X.                                           
1590             15 'X'-MCT80  PIC 9(10).                                       
      * MONTANT DU ROLE ANNULE                                                  
1600             15 'X'-FILLER PIC X.                                           
1601             15 'X'-MROANU PIC 9(10).                                       
      * NOMBRE DE REPRISE DEGREVEMENT HABITATION PRINCIPALE                     
1611             15 'X'-FILLER PIC X.                                           
1612             15 'X'-NDGRPV PIC 9(6).                                        
      * CODE EXCLUSION                                                          
1618             15 'X'-FILLER PIC X.                                           
1619             15 'X'-CCOEXC PIC X(2).                                        
      * BASES EXONEREES ECF                                                     
1621             15 'X'-FILLER PIC X.                                           
1622             15 'X'-MEXECF PIC 9(12).                                       
      * NOMBRE DE DEGREVEMENT HABITATION PRICIPALE                              
1634             15 'X'-FILLER PIC X.                                           
1635             15 'X'-NDGPV  PIC 9(5).                                        
      * MONTANT DU DEGREVEMENT HABITATION PRICIPALE                             
1640             15 'X'-FILLER PIC X.                                           
1641             15 'X'-MCTPV  PIC 9(10).                                       
      * MONTANT DU DEGREVEMENT NON RECOUVRE ANNULE (???)                        
1651             15 'X'-FILLER PIC X.                                           
1652             15 'X'-MDGANU PIC 9(10).                                       
                                                                                
      ********************************************                              
      *                                          *                              
      *  SYNDICATS COMMUNAUX                     *                              
      *                                          *                              
      ********************************************                              
      * SIREN ET LIBELLE DES SYNDICATS COMMUNAUX                                
               10 'X'-LISTSY OCCURS 10.                                         
1662             15 'X'-FILLER PIC X.                                           
1663             15 'X'-SIREN-SYN PIC X(9).                                     
1672             15 'X'-FILLER PIC X.                                           
1673             15 'X'-DLISYN PIC X(20).                                       
      * CLEFS DE REPARTITION DES SYND COMMUNAUX                                 
               10 'X'-CLEF-REPART-SYN.                                          
      * CLEFS DE REPARTITION DES SYND COMMUNAUX BATIS                           
                 15 'X'-ACFSYN-B.                                               
      *         REPART SYND COMMUNAL 1                                          
1972               20 'X'-FILLER PIC X.                                         
1973               20 'X'-PCFSYA-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 2                                          
1978               20 'X'-FILLER PIC X.                                         
1979               20 'X'-PCFSYB-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 3                                          
1984               20 'X'-FILLER PIC X.                                         
1985               20 'X'-PCFSYC-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 4                                          
1990               20 'X'-FILLER PIC X.                                         
1991               20 'X'-PCFSYD-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 5                                          
1996               20 'X'-FILLER PIC X.                                         
1997               20 'X'-PCFSYE-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 6                                          
2002               20 'X'-FILLER PIC X.                                         
2003               20 'X'-PCFSYF-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 7                                          
2008               20 'X'-FILLER PIC X.                                         
2009               20 'X'-PCFSYG-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 8                                          
2014               20 'X'-FILLER PIC X.                                         
2015               20 'X'-PCFSYH-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 9                                          
2020               20 'X'-FILLER PIC X.                                         
2021               20 'X'-PCFSYI-B PIC 9(3)V9(2).                               
      *         REPART SYND COMMUNAL 10                                         
2026               20 'X'-FILLER PIC X.                                         
2027               20 'X'-PCFSYJ-B PIC 9(3)V9(2).                               
                 15 'X'-ACFTAB-B REDEFINES 'X'-ACFSYN-B.                        
                   20 'X'-ACFPOS-B OCCURS 10.                                   
                     25 'X'-FILLER PIC X.                                       
                     25 'X'-PCFSYN-B PIC 9(3)V9(2).                             
      * CLEF DE REPARTITION DES SYND COMMUNAUX NON BATIS                        
                 15 'X'-ACFSYN-NB.                                              
      *         REPART SYND COMMUNAL 1                                          
2032               20 'X'-FILLER PIC X.                                         
2033               20 'X'-PCFSYA-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 2                                          
2038               20 'X'-FILLER PIC X.                                         
2039               20 'X'-PCFSYB-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 3                                          
2044               20 'X'-FILLER PIC X.                                         
2045               20 'X'-PCFSYC-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 4                                          
2050               20 'X'-FILLER PIC X.                                         
2051               20 'X'-PCFSYD-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 5                                          
2056               20 'X'-FILLER PIC X.                                         
2057               20 'X'-PCFSYE-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 6                                          
2062               20 'X'-FILLER PIC X.                                         
2063               20 'X'-PCFSYF-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 7                                          
2068               20 'X'-FILLER PIC X.                                         
2069               20 'X'-PCFSYG-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 8                                          
2074               20 'X'-FILLER PIC X.                                         
2075               20 'X'-PCFSYH-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 9                                          
2080               20 'X'-FILLER PIC X.                                         
2081               20 'X'-PCFSYI-NB PIC 9(3)V9(2).                              
      *         REPART SYND COMMUNAL 10                                         
2086               20 'X'-FILLER PIC X.                                         
2087               20 'X'-PCFSYJ-NB PIC 9(3)V9(2).                              
                 15 'X'-ACFTAB-NB REDEFINES 'X'-ACFSYN-NB.                      
                   20 'X'-ACFPOS-NB OCCURS 10.                                  
                     25 'X'-FILLER PIC X.                                       
                     25 'X'-PCFSYN-NB PIC 9(3)V9(2).                            
                                                                                
      ********************************************                              
      *                                          *                              
      *  COMPTAGES                               *                              
      *                                          *                              
      ********************************************                              
               10 'X'-COMPTAGES.                                                
                 15 'X'-NBCOTI.                                                 
      * NOMBRE DE COTES ARTICLES BATI                                           
2092               20 'X'-FILLER PIC X.                                         
2093               20 'X'-NIMTFB PIC 9(7).                                      
      * NOMBRE DE COTES ARTICLES OM                                             
2100               20 'X'-FILLER PIC X.                                         
2101               20 'X'-NIMOM  PIC 9(7).                                      
      * NOMBRE DE COTES ARTICLES NON BATI                                       
2108               20 'X'-FILLER PIC X.                                         
2109               20 'X'-NIMTFN PIC 9(7).                                      
      * NOMBRE DE COTES ARTICLES CAAA                                           
2116               20 'X'-FILLER PIC X.                                         
2117               20 'X'-NIMCAA PIC 9(7).                                      
      * NOMBRE DE COTES ARTICLES EN ABATTEMENT ZUS                              
2124               20 'X'-FILLER PIC X.                                         
2125               20 'X'-NEXZUS PIC 9(7).                                      
      * NOMBRE DE COTES ARTICLES TERRAIN A BATIR                                
2132               20 'X'-FILLER PIC X.                                         
2133               20 'X'-NIMTEB PIC 9(7).                                      
      * NOMBRE DE COTES AYANT UNE BASE CHAMBRE D'AGRICULTURE                    
2140               20 'X'-FILLER PIC X.                                         
2141               20 'X'-NIMCA  PIC 9(6).                                      
      * NOMBRE DE COTES AYANT UNE BASE TSE BATIE                                
2147               20 'X'-FILLER PIC X.                                         
2148               20 'X'-NIBTSN PIC 9(7).                                      
      * NOMBRE DE COTES AYANT UNE BASE TSE NON BATIE                            
2155               20 'X'-FILLER PIC X.                                         
2156               20 'X'-NINTSN PIC 9(7).                                      
      * NOMBRE DE COTES AYANT UNE BASE TASA                                     
2163               20 'X'-FILLER PIC X.                                         
2164               20 'X'-NIBTAS PIC 9(7).                                      
      * NOMBRE DE COTES AYANT UNE BASE GEMAPI BATI                              
2171               20 'X'-FILLER PIC X.                                         
2172               20 'X'-NIBGEM PIC 9(7).                                      
      * NOMBRE DE COTES AYANT UNE BASE GEMAPI NON BATI                          
2179               20 'X'-FILLER PIC X.                                         
2180               20 'X'-NINGEM PIC 9(7).                                      
      * NOMBRE ARTICLES EXO (HORS ECF) AYANT UN FORFAIT FORESTIER               
2187               20 'X'-FILLER PIC X.                                         
2188               20 'X'-NBAFFO PIC 9(6).                                      
                 15 'X'-NBPROP.                                                 
      * NOMBRE DE PROPRIETAIRES ECRITS SUR LE ROLE                              
2194               20 'X'-FILLER PIC X.                                         
2195               20 'X'-NROPRO PIC 9(7).                                      
      * NOMBRE DE PROPRIETAIRES AYANT UN AVIS D'IMPOSITION                      
2202               20 'X'-FILLER PIC X.                                         
2203               20 'X'-NIMPRO PIC 9(7).                                      
      * NOMBRE DE PROPRIETAIRES AYANT UNE COTISATION INFERIEURE A 12 þ          
2210               20 'X'-FILLER PIC X.                                         
2211               20 'X'-N80PRO PIC 9(7).                                      
      * NOMBRE DE PROPRIETAIRES EXONERES ECF                                    
2218               20 'X'-FILLER PIC X.                                         
2219               20 'X'-NEXECF PIC 9(7).                                      
      * NOMBRE DE PROPRIETAIRES EXONERES 100 SANS TEOM                          
2226               20 'X'-FILLER PIC X.                                         
2227               20 'X'-NEXEC1 PIC 9(7).                                      
                                                                                
      ********************************************                              
      *                                          *                              
      *  JEUNES AGRICULTEURS                     *                              
      *                                          *                              
      ********************************************                              
               10 'X'-JEUNES-AGRICULTEURS.                                      
      * DELIBERATIONS JEUNES AGRICULTEURS AU NIVEAU DE LA COMMUNE               
      * ANNEE D'INSTALLATION (JCOINX) - ANNEE RETOUR IMPOS (JCORIX)             
                 15 'X'-DELIB-JA-COMMUNALES.                                    
                   20 'X'-AGPJAG.                                               
      * N-4                                                                     
2234                 25 'X'-FILLER PIC X.                                       
2235                 25 'X'-JCOIN5 PIC 9(4).                                    
2239                 25 'X'-JCORI5 PIC 9(4).                                    
      * N-3                                                                     
2243                 25 'X'-FILLER PIC X.                                       
2244                 25 'X'-JCOIN4 PIC 9(4).                                    
2248                 25 'X'-JCORI4 PIC 9(4).                                    
      * N-2                                                                     
2252                 25 'X'-FILLER PIC X.                                       
2253                 25 'X'-JCOIN3 PIC 9(4).                                    
2257                 25 'X'-JCORI3 PIC 9(4).                                    
      * N-1                                                                     
2261                 25 'X'-FILLER PIC X.                                       
2262                 25 'X'-JCOIN2 PIC 9(4).                                    
2266                 25 'X'-JCORI2 PIC 9(4).                                    
      * N                                                                       
2270                 25 'X'-FILLER PIC X.                                       
2271                 25 'X'-JCOIN1 PIC 9(4).                                    
2275                 25 'X'-JCORI1 PIC 9(4).                                    
                   20 'X'-ACJAR REDEFINES 'X'-AGPJAG.                           
                     25 'X'-ACJARO OCCURS 5.                                    
                       30 'X'-FILLER PIC X.                                     
                       30 'X'-CINSN  PIC 9(4).                                  
                       30 'X'-CRIMN  PIC 9(4).                                  
                                                                                
      * DELIBERATIONS JEUNES AGRICULTEURS AU NIVEAU DE L'EPCI                   
      * ANNEE D'INSTALLATION (FGCINX) - ANNEE RETOUR IMPOS (JGCRIX)             
                 15 'X'-DELIB-JA-EPCI.                                          
                   20 'X'-AGRJA.                                                
      * N-4                                                                     
2279                 25 'X'-FILLER PIC X.                                       
2280                 25 'X'-JGCIN5 PIC 9(4).                                    
2284                 25 'X'-JGCRI5 PIC 9(4).                                    
      * N-3                                                                     
2288                 25 'X'-FILLER PIC X.                                       
2289                 25 'X'-JGCIN4 PIC 9(4).                                    
2293                 25 'X'-JGCRI4 PIC 9(4).                                    
      * N-2                                                                     
2297                 25 'X'-FILLER PIC X.                                       
2298                 25 'X'-JGCIN3 PIC 9(4).                                    
2302                 25 'X'-JGCRI3 PIC 9(4).                                    
      * N-1                                                                     
2306                 25 'X'-FILLER PIC X.                                       
2307                 25 'X'-JGCIN2 PIC 9(4).                                    
2311                 25 'X'-JGCRI2 PIC 9(4).                                    
      * N                                                                       
2315                 25 'X'-FILLER PIC X.                                       
2316                 25 'X'-JGCIN1 PIC 9(4).                                    
2320                 25 'X'-JGCRI1 PIC 9(4).                                    
                   20 'X'-AGRJAR REDEFINES  'X'-AGRJA.                          
                     25 'X'-AGRJAO OCCURS 5.                                    
                       30 'X'-FILLER PIC X.                                     
                       30 'X'-GRINSN PIC 9(4).                                  
                       30 'X'-GRRIMN PIC 9(4).                                  
      * DEGREVEMENT JA COMMUNE                                                  
2324             15 'X'-FILLER PIC X.                                           
2325             15 'X'-VDJCOM PIC 9(10).                                       
      * DEGREVEMENT JA SYNDICAT                                                 
2335             15 'X'-FILLER PIC X.                                           
2336             15 'X'-VDJSYN PIC 9(10).                                       
      * DEGREVEMENT JA EPCI                                                     
2346             15 'X'-FILLER PIC X.                                           
2347             15 'X'-VDJCU  PIC 9(10).                                       
      * DEGREVEMENT JA ETAT (COTISATIONS + FRAIS)                               
2357             15 'X'-FILLER PIC X.                                           
2358             15 'X'-VDJETA PIC 9(10).                                       
      * NOMBRE DE COMPTES AVEC DEGVT JA ETAT                                    
2368             15 'X'-FILLER PIC X.                                           
2369             15 'X'-NDGJAE PIC 9(5).                                        
      * NOMBRE DE COMPTES AVEC DEGVT JA COLLOC                                  
2374             15 'X'-FILLER PIC X.                                           
2375             15 'X'-NDGJAC PIC 9(5).                                        
      * NOMBRE DE COTES AVEC DEGVT JA COMMUNE                                   
2380             15 'X'-FILLER PIC X.                                           
2381             15 'X'-NDGJAM PIC 9(5).                                        
      * NOMBRE DE COTES AVEC DEGVT JA SYNDICAT                                  
2386             15 'X'-FILLER PIC X.                                           
2387             15 'X'-NDGJAS PIC 9(5).                                        
      * NOMBRE DE COTES AVEC DEGVT JA EPCI                                      
2392             15 'X'-FILLER PIC X.                                           
2393             15 'X'-NDGJAG PIC 9(5).                                        
                                                                                
      ********************************************                              
      *                                          *                              
      *  COMPTAGES LORS DES IS                   *                              
      *                                          *                              
      ********************************************                              
               10 'X'-COMPTAGES-IS.                                             
      * MONTANT COTIS SUITE A CHANGEMENT DE ZONE OM (POUR IS)                   
2398             15 'X'-FILLER PIC X.                                           
2399             15 'X'-MCTZOM PIC 9(10).                                       
      * NOMBRE DE COTE ETAT (POUR IS)                                           
2409             15 'X'-FILLER PIC X.                                           
2410             15 'X'-NIMETA PIC 9(6).                                        
      * NOMBRE DE COTE AYANT UNE BASE IMPOSITION COT                            
2416             15 'X'-FILLER PIC X.                                           
2417             15 'X'-NIMCO0 PIC 9(6).                                        
      * NOMBRE DE REPRISE DEGREVEMENT JA ETAT (POUR IS)                         
2423             15 'X'-FILLER PIC X.                                           
2424             15 'X'-NDGRJE PIC 9(6).                                        
      * NOMBRE DE REPRISE DEGREVEMENT JA COLLECTIVITE (POUR IS)                 
2430             15 'X'-FILLER PIC X.                                           
2431             15 'X'-NDGRJC PIC 9(6).                                        
                                                                                
      ********************************************                              
      *                                          *                              
      *  FRAIS                                   *                              
      *                                          *                              
      ********************************************                              
               10 'X'-FRAIS.                                                    
      * FRAIS ASSIETTE BATI                                                     
2437             15 'X'-FILLER PIC X.                                           
2438             15 'X'-MFSTFB PIC 9(10).                                       
      * FRAIS ASSIETTE NON BATI                                                 
2448             15 'X'-FILLER PIC X.                                           
2449             15 'X'-MFSTFN PIC 9(10).                                       
      * FRAIS ASSIETTE NON BATI A 7,81% (CAAA)                                  
2459             15 'X'-FILLER PIC X.                                           
2460             15 'X'-MFSCAA PIC 9(10).                                       
      * FRAIS ETAT BATI A 8%                                                    
2470             15 'X'-FILLER PIC X.                                           
2471             15 'X'-MFSETB PIC 9(10).                                       
      * FRAIS ETAT NON BATI A 8%                                                
2481             15 'X'-FILLER PIC X.                                           
2482             15 'X'-MFSETN PIC 9(10).                                       
                                                                                
      * FRAIS BATIS 3%                                                          
      *             1%                                                          
2492             15 'X'-FILLER PIC X.                                           
2493             15 'X'-FRBA10 PIC 9(10).                                       
      *             2%                                                          
2503             15 'X'-FILLER PIC X.                                           
2504             15 'X'-FRBA20 PIC 9(10).                                       
      *             3%                                                          
2514             15 'X'-FILLER PIC X.                                           
2515             15 'X'-FRBA30 PIC 9(10).                                       
      *             1% ETAT (POUR IS)                                           
2525             15 'X'-FILLER PIC X.                                           
2526             15 'X'-FREBA1 PIC 9(10).                                       
      *             2% ETAT (POUR IS)                                           
2536             15 'X'-FILLER PIC X.                                           
2537             15 'X'-FREBA2 PIC 9(10).                                       
      *             3% ETAT (POUR IS)                                           
2547             15 'X'-FILLER PIC X.                                           
2548             15 'X'-FREBA3 PIC 9(10).                                       
                                                                                
      * FRAIS NON BATIS 3%                                                      
      *             1%                                                          
2558             15 'X'-FILLER PIC X.                                           
2559             15 'X'-FRNB10 PIC 9(10).                                       
      *             2%                                                          
2569             15 'X'-FILLER PIC X.                                           
2570             15 'X'-FRNB20 PIC 9(10).                                       
      *             3%                                                          
2580             15 'X'-FILLER PIC X.                                           
2581             15 'X'-FRNB30 PIC 9(10).                                       
      *             1% ETAT (POUR IS)                                           
2591             15 'X'-FILLER PIC X.                                           
2592             15 'X'-FENB10 PIC 9(10).                                       
      *             2% ETAT (POUR IS)                                           
2602             15 'X'-FILLER PIC X.                                           
2603             15 'X'-FENB20 PIC 9(10).                                       
      *             3% ETAT (POUR IS)                                           
2613             15 'X'-FILLER PIC X.                                           
2614             15 'X'-FENB30 PIC 9(10).                                       
                                                                                
      * FRAIS A 8%                                                              
      *           BATIS                                                         
2624             15 'X'-FILLER PIC X.                                           
2625             15 'X'-FRBA80 PIC 9(10).                                       
      *           NON BATIS                                                     
2635             15 'X'-FILLER PIC X.                                           
2636             15 'X'-FRNB80 PIC 9(10).                                       
                                                                                
      * FRAIS BATIS 9%                                                          
      *             3,6%                                                        
2646             15 'X'-FILLER PIC X.                                           
2647             15 'X'-FRBA36 PIC 9(10).                                       
      *             5,4%                                                        
2657             15 'X'-FILLER PIC X.                                           
2658             15 'X'-FRBA54 PIC 9(10).                                       
      *             9%                                                          
2668             15 'X'-FILLER PIC X.                                           
2669             15 'X'-FRBA90 PIC 9(10).                                       
      *             3,6% ETAT (POUR IS)                                         
2679             15 'X'-FILLER PIC X.                                           
2680             15 'X'-FREB36 PIC 9(10).                                       
      *             5,4% ETAT (POUR IS)                                         
2690             15 'X'-FILLER PIC X.                                           
2691             15 'X'-FREB54 PIC 9(10).                                       
      *             9% ETAT (POUR IS)                                           
2701             15 'X'-FILLER PIC X.                                           
2702             15 'X'-FREB90 PIC 9(10).                                       
                                                                                
      * FRAIS NON BATIS 9%                                                      
      *             3,6%                                                        
2712             15 'X'-FILLER PIC X.                                           
2713             15 'X'-FRNB36 PIC 9(10).                                       
      *             5,4%                                                        
2723             15 'X'-FILLER PIC X.                                           
2724             15 'X'-FRNB54 PIC 9(10).                                       
      *             9%                                                          
2734             15 'X'-FILLER PIC X.                                           
2735             15 'X'-FRNB90 PIC 9(10).                                       
      *             3,6% ETAT (POUR IS)                                         
2745             15 'X'-FILLER PIC X.                                           
2746             15 'X'-FENB36 PIC 9(10).                                       
      *             5,4% ETAT (POUR IS)                                         
2756             15 'X'-FILLER PIC X.                                           
2757             15 'X'-FENB54 PIC 9(10).                                       
      *             9% ETAT (POUR IS)                                           
2767             15 'X'-FILLER PIC X.                                           
2768             15 'X'-FENB90 PIC 9(10).                                       
                                                                                
      * FRAIS DE GESTION BATI A 4,4%                                            
2778             15 'X'-FILLER PIC X.                                           
2779             15 'X'-MFSB41 PIC S9(9) SIGN LEADING SEPARATE.                 
      * FRAIS DE GESTION NON BATI A 4,4%                                        
2789             15 'X'-FILLER PIC X.                                           
2790             15 'X'-MFSN41 PIC S9(9) SIGN LEADING SEPARATE.                 
      * FRAIS DE GESTION ETAT BATI A 4,4%                                       
2800             15 'X'-FILLER PIC X.                                           
2801             15 'X'-MFEB41 PIC 9(10).                                       
      * FRAIS DE GESTION ETAT NON BATI A 4,4%                                   
2811             15 'X'-FILLER PIC X.                                           
2812             15 'X'-MFEN41 PIC 9(10).                                       
      * FRAIS DE GESTION CAAA A 4,58%                                           
2822             15 'X'-FILLER PIC X.                                           
2823             15 'X'-MFSC41 PIC S9(9) SIGN LEADING SEPARATE.                 
      * FRAIS DE GESTION BATI A 3,6%                                            
2833             15 'X'-FILLER PIC X.                                           
2834             15 'X'-MFSB31 PIC S9(9) SIGN LEADING SEPARATE.                 
      * FRAIS DE GESTION NON BATI A 3,6%                                        
2844             15 'X'-FILLER PIC X.                                           
2845             15 'X'-MFSN31 PIC S9(9) SIGN LEADING SEPARATE.                 
      * FRAIS DE GESTION ETAT BATI A 3,6%                                       
2855             15 'X'-FILLER PIC X.                                           
2856             15 'X'-MFEB31 PIC 9(10).                                       
      * FRAIS DE GESTION ETAT NON BATI A 3,6%                                   
2866             15 'X'-FILLER PIC X.                                           
2867             15 'X'-MFEN31 PIC 9(10).                                       
      * FRAIS DE GESTION CAAA A 3,23%                                           
2877             15 'X'-FILLER PIC X.                                           
2878             15 'X'-MFSC31 PIC S9(9) SIGN LEADING SEPARATE.                 
                                                                                
      ********************************************                              
      *                                          *                              
      * LISSAGES DES COTISATIONS BATIES REVISEES *                              
      *                                          *                              
      ********************************************                              
               10 'X'-LISSAGES.                                                 
      * LISSAGE COMMUNE                                                         
2888             15 'X'-FILLER PIC X.                                           
2889             15 'X'-MLBCOM PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL                                               
2899             15 'X'-FILLER PIC X.                                           
2900             15 'X'-MLBSYN PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE EPCI                                                            
2910             15 'X'-FILLER PIC X.                                           
2911             15 'X'-MLBCU  PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE DEPARTEMENT                                                     
2921             15 'X'-FILLER PIC X.                                           
2922             15 'X'-MLBDEP PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE TSE 1                                                           
2932             15 'X'-FILLER PIC X.                                           
2933             15 'X'-MLBTS1 PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE TSE 2                                                           
2943             15 'X'-FILLER PIC X.                                           
2944             15 'X'-MLBTS2 PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE TASA                                                            
2955             15 'X'-FILLER PIC X.                                           
2955             15 'X'-MLBTAS PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE GEMAPI                                                          
2965             15 'X'-FILLER PIC X.                                           
2966             15 'X'-MLBGEM PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE TEOM                                                            
2976             15 'X'-FILLER PIC X.                                           
2977             15 'X'-MLBTOM PIC S9(9) SIGN LEADING SEPARATE.                 
                                                                                
      ********************************************                              
      *                                          *                              
      *  LISSAGES DES SYNDICATS COMMUNAUX BATIS  *                              
      *                                          *                              
      ********************************************                              
               10 'X'-LISSAGES-SYNDICATS.                                       
      * LISSAGE SYNDICAT COMMUNAL 1                                             
2987             15 'X'-FILLER PIC X.                                           
2988             15 'X'-MLBSYA PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 2                                             
2998             15 'X'-FILLER PIC X.                                           
2999             15 'X'-MLBSYB PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 3                                             
3009             15 'X'-FILLER PIC X.                                           
3010             15 'X'-MLBSYC PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 4                                             
3020             15 'X'-FILLER PIC X.                                           
3021             15 'X'-MLBSYD PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 5                                             
3031             15 'X'-FILLER PIC X.                                           
3032             15 'X'-MLBSYE PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 6                                             
3042             15 'X'-FILLER PIC X.                                           
3043             15 'X'-MLBSYF PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 7                                             
3053             15 'X'-FILLER PIC X.                                           
3054             15 'X'-MLBSYG PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 8                                             
3064             15 'X'-FILLER PIC X.                                           
3065             15 'X'-MLBSYH PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 9                                             
3075             15 'X'-FILLER PIC X.                                           
3076             15 'X'-MLBSYI PIC S9(9) SIGN LEADING SEPARATE.                 
      * LISSAGE SYNDICAT COMMUNAL 10                                            
3086             15 'X'-FILLER PIC X.                                           
3087             15 'X'-MLBSYJ PIC S9(9) SIGN LEADING SEPARATE.                 
                                                                                
      ********************************************                              
      *                                          *                              
      *  ZONES SPECIFIQUES POUR ROLE REGULE      *                              
      *                                          *                              
      ********************************************                              
               10 'X'-REGULARISATION.                                           
      * MONTANT DEGREVT JA COLL ET ETA REGUL POSITIF                            
3097             15 'X'-FILLER      PIC X.                                      
3098             15 'X'-MDJ-SUP-R   PIC S9(10) SIGN LEADING SEPARATE.           
      * MONTANT TOTAL BATI REGUL                                                
3109             15 'X'-FILLER      PIC X.                                      
3110             15 'X'-MT-BAT-R    PIC S9(6) SIGN LEADING SEPARATE.            
      * NOMBRE VARIATION BATI REGUL                                             
3117             15 'X'-FILLER      PIC X.                                      
3118             15 'X'-NB-MT-BAT-R PIC 9(7).                                   
      * MONTANT TOTAL NBATI REGUL                                               
3125             15 'X'-FILLER      PIC X.                                      
3126             15 'X'-MT-NBAT-R   PIC S9(6) SIGN LEADING SEPARATE.            
      * NOMBRE VARIATION NBATI REGUL                                            
3133             15 'X'-FILLER      PIC X.                                      
3134             15 'X'-NB-MT-NBAT-R PIC 9(7).                                  
      * VARIATION BATI DES ARTICLES POSITIFS                                    
3141             15 'X'-FILLER      PIC X.                                      
3142             15 'X'-MT-BAT-SUP-R PIC S9(10) SIGN LEADING SEPARATE.          
      * NOMBRE VARIATION BATI DES ARTICLES POSITIFS                             
3153             15 'X'-FILLER      PIC X.                                      
3154             15 'X'-NB-MT-BAT-SUP-R PIC 9(7).                               
      * VARIATION NBATI DES ARTICLES POSITIFS                                   
3161             15 'X'-FILLER      PIC X.                                      
3162             15 'X'-MT-NBAT-SUP-R PIC S9(10) SIGN LEADING SEPARATE.         
      * NOMBRE VARIATION NBATI DES ARTICLES POSITIFS                            
3173             15 'X'-FILLER      PIC X.                                      
3174             15 'X'-NB-MT-NBAT-SUP-R PIC 9(7).                              
      * VARIATON BATI DES ARTICLES NEGATIFS                                     
3181             15 'X'-FILLER      PIC X.                                      
3182             15 'X'-MT-BAT-NEG-R PIC S9(10) SIGN LEADING SEPARATE.          
      * NOMBRE VARIATION BATI DES ARTICLES NEGATIFS                             
3193             15 'X'-FILLER      PIC X.                                      
3194             15 'X'-NB-MT-BAT-NEG-R PIC 9(7).                               
      * VARIATION NBATI DES ARTICLES NEGATIFS                                   
3201             15 'X'-FILLER      PIC X.                                      
3202             15 'X'-MT-NBAT-NEG-R PIC S9(10) SIGN LEADING SEPARATE.         
      * NOMBRE VARIATION NBATI DES ARTICLES NEGATIFS                            
3213             15 'X'-FILLER      PIC X.                                      
3214             15 'X'-NB-MT-NBAT-NEG-R PIC 9(7).                              
      * NOMBRE VARIATION BATI DES ARTICLES NULS                                 
3221             15 'X'-FILLER      PIC X.                                      
3222             15 'X'-NB-MT-BAT-NUL-R PIC 9(7).                               
      * NOMBRE VARIATION NBATI DES ARTICLES NULS                                
3229             15 'X'-FILLER      PIC X.                                      
3230             15 'X'-NB-MT-NBAT-NUL-R PIC 9(7).                              
      * MONTANT DES NON-VALEURS ET DES NON-VALEURS DE REGULARISATION            
      * POSITIFS                                                                
3237             15 'X'-FILLER      PIC X.                                      
3238             15 'X'-MT-DES-2-NV-REG-SUP-R PIC 9(11).                        
      * MONTANT DES NON-VALEURS DES ARTICLES POSITIFS                           
3249             15 'X'-FILLER      PIC X.                                      
3250             15 'X'-MT-NV-SUP-R PIC S9(6) SIGN LEADING SEPARATE.            
      * MONTANT TOTAL DES NON-VALEURS DES ARTICLES NEGATIFS                     
3257             15 'X'-FILLER      PIC X.                                      
3258             15 'X'-MT-NV-NEG-R PIC S9(6) SIGN LEADING SEPARATE.            
      * MONTANT DES REGUL (>0)                                                  
3265             15 'X'-FILLER      PIC X.                                      
3266             15 'X'-MT-REG-SUP  PIC S9(10) SIGN LEADING SEPARATE.           
      * MONTANT DES REGUL (<0)                                                  
3277             15 'X'-FILLER      PIC X.                                      
3278             15 'X'-MT-REG-NEG  PIC S9(10) SIGN LEADING SEPARATE.           
      * MONTANT DEGREVEMENTS JA COLLECTIVITE REGUL                              
3289             15 'X'-FILLER      PIC X.                                      
3290             15 'X'-MT-MDJ-COL-SUP-R PIC 9(11).                             
      * NOMBRE MONTANT DEGREVEMENTS JA COLLECTIVITE REGUL                       
3301             15 'X'-FILLER      PIC X.                                      
3302             15 'X'-NB-MT-MDJ-COL-SUP-R PIC 9(7).                           
      * MONTANT DEGREVEMENTS JA ETAT REGUL                                      
3309             15 'X'-FILLER      PIC X.                                      
3310             15 'X'-MT-MDJ-ETA-SUP-R PIC 9(11).                             
      * NOMBRE MONTANT DEGREVEMENTS JA ETAT REGUL                               
3321             15 'X'-FILLER      PIC X.                                      
3322             15 'X'-NB-MT-MDJ-ETA-SUP-R PIC 9(7).                           
      * MONTANT DEGREVEMENTS ECF REGUL POSITIF                                  
3329             15 'X'-FILLER      PIC X.                                      
3330             15 'X'-MT-MDG-PV-SUP-R PIC 9(11).                              
      * NOMBRE MONTANT DEGREVEMENTS ECF REGUL                                   
3341             15 'X'-FILLER      PIC X.                                      
3342             15 'X'-NB-MT-MDG-PV-SUP-R PIC 9(7).                            
      * MONTANT NON-VALEUR OU MONTANT DEGREVEMENT ETAT (<12EURO) POSITIF        
3349             15 'X'-FILLER      PIC X.                                      
3350             15 'X'-MT-NV-MDG-SUP-R PIC 9(11).                              
      * NOMBRE MONTANT DEGREVEMENT ETAT (<12EUROS)                              
3361             15 'X'-FILLER      PIC X.                                      
3362             15 'X'-NB-MT-NV-MDG-SUP-R PIC 9(7).                            
      * MONTANT DE REGUL (>0) ET (<12) NON VALEUR DE REGUL POSITIF              
3369             15 'X'-FILLER      PIC X.                                      
3370             15 'X'-MT-NV-DE-REGUL-SUP-R PIC 9(11).                         
      * NOMBRE MONTANT DE REGUL (>0) ET (<12)                                   
3381             15 'X'-FILLER      PIC X.                                      
3382             15 'X'-NB-MT-NV-DE-REG-SUP-R PIC 9(7).                         
      * NOMBRE D'AVIS REG > 0                                                   
3389             15 'X'-FILLER      PIC X.                                      
3390             15 'X'-NIMPRO-SUP-R PIC 9(7).                                  
      * NOMBRE D'ARTICLES INDIVIDUELS = 0                                       
3397             15 'X'-FILLER      PIC X.                                      
3398             15 'X'-NIMPRO-NUL-R PIC 9(7).                                  
      * NOMBRE D'AVIS REG < 0                                                   
3405             15 'X'-FILLER      PIC X.                                      
3406             15 'X'-NIMPRO-NEG-R PIC 9(7).                                  
      * REPRISE ETAT BATI                                                       
3413             15 'X'-FILLER      PIC X.                                      
3414             15 'X'-REP-ETAT-BATI  PIC 9(4).                                
      * REPRISE ETAT NON BATI                                                   
3418             15 'X'-FILLER      PIC X.                                      
3419             15 'X'-REP-ETAT-NBATI PIC 9(4).                                
      * REPRISE ETAT NON VALEUR                                                 
3423             15 'X'-FILLER      PIC X.                                      
3424             15 'X'-REP-ETAT-NV    PIC 9(4).                                
      * NB TOTAL D'ARTICLES BATI ET NON BATI                                    
3428             15 'X'-FILLER      PIC X.                                      
3429             15 'X'-NB-MTTOT-R     PIC 9(7).                                
      * NB TOTAL VARIATION BATI ET NON BATI DES ARTICLES POSITIFS               
3436             15 'X'-FILLER      PIC X.                                      
3437             15 'X'-NB-MTTOT-SUP-R PIC 9(7).                                
      * NB TOTAL VARIATION BATI ET NON BATI DES ARTICLES NEGATIFS               
3444             15 'X'-FILLER      PIC X.                                      
3445             15 'X'-NB-MTTOT-NEG-R PIC 9(7).                                
      * NB TOTAL VARIATION BATI ET NON BATI DES ARTICLES NULS                   
3452             15 'X'-FILLER      PIC X.                                      
3453             15 'X'-NB-MTTOT-NUL-R PIC 9(7).                                
                                                                                
      ********************************************                              
      *                                          *                              
      *  NUM FACTURE DES ART COLLECTIFS DU BRAV  *                              
      *                                          *                              
      ********************************************                              
               10 'X'-REF-ART-COLLECTIF.                                        
      * BRAV DGE                                                                
3460             15 'X'-FILLER PIC X.                                           
                 15 'X'-AGEREF.                                                 
3461               20 'X'-DCPNU1 PIC 9(7).                                      
3468               20 'X'-KCPCLE PIC X(2).                                      
      * BRAV NON DGE                                                            
3470             15 'X'-FILLER PIC X.                                           
                 15 'X'-REF-ARTCOLL.                                            
3471               20 'X'-DCPNU9 PIC 9(7).                                      
3478               20 'X'-KNOCP  PIC X(2).                                      
                                                                                
      ********************************************                              
      *                                          *                              
      *  EXPERIMENTATION ETATS COMPTABLES RS     *                              
      *  AVEC COMMUNE DE TAXATION INITIALE       *                              
      *                                          *                              
      ********************************************                              
3480           10 'X'-FILLER      PIC X(1).                                     
3481           10 'X'-DLICOM-INIT PIC X(30).                                    
3511           10 'X'-FILLER      PIC X(1).                                     
3512           10 'X'-CCOCOM-INIT PIC X(3).                                     
3515           10 'X'-FILLER      PIC X(1).                                     
3516           10 'X'-SIRENC-INIT PIC X(9).                                     
                                                                                
      ********************************************                              
      * LIBELLE DE LA PAERCEPTION                *                              
      ********************************************                              
3525           10 'X'-FILLER      PIC X(1).                                     
3526           10 'X'-DLIPER      PIC X(30).                                    
                                                                                
3556           10 'X'-FILLER      PIC X(445).                                   
