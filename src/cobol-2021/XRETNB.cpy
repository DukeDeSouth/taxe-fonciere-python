      *-----------------------------------------------------------*             
      *    NOM COPY                   :  XRETNB                   *             
      *-----------------------------------------------------------*             
           10 'X'-AIDFIC.                                                       
      * IDENTIFIANT DU FICHIER                                                  
              15 'X'-DAN       PIC 9(4).                                        
      * ANNEE IMPOSITION                                                        
              15 'X'-AC3DIR.                                                    
      * CODE DEPARTEMENT DIRECTION                                              
                 20 'X'-CC2DEP    PIC X(2).                                     
      * CODE DEPARTEMENT                                                        
                 20 'X'-CCODIR    PIC X.                                        
      * CODE DIRECTION                                                          
              15 'X'-CCOCOM    PIC X(3).                                        
      * CODE COMMUNE MAJIC2                                                     
              15 'X'-DSRPAR    PIC X.                                           
      * SERIE ROLE PARCELLE                                                     
           10 'X'-ANUPRO.                                                       
      * NUM COMPTE PROPRIETAIRE                                                 
              15 'X'-CGROUP    PIC X.                                           
      * CODE GROUPE PROPRIETAIRE                                                
              15 'X'-NNUPRO    PIC 9(5).                                        
      * NUM COMPTE PROPRIETAIRE                                                 
           10 'X'-CCOBNB    PIC X.                                              
      * CODE BATI / NON-BATI                                                    
           10 'X'-MCTCOM    PIC S9(10).                                         
      * COTISATION COMMUNALE                                                    
           10 'X'-MCTDEP    PIC S9(10).                                         
      * COTISATION DEPARTEMENTALE                                               
           10 'X'-MCTREG    PIC S9(10).                                         
      * COTISATION REGIONALE                                                    
           10 'X'-MCTSYN    PIC S9(10).                                         
      * COTIS. SYN. & DIST. SANS FISC. PROP                                     
           10 'X'-MCTCU     PIC S9(10).                                         
      * COTISATION GROUP. A FISCAL. PROPRE                                      
           10 'X'-MCTTSE    PIC S9(10).                                         
      * COTISATION TAXE SPECIALE EQUIPEMENT                                     
           10 'X'-MCNT13    PIC S9(10) OCCURS 2.                                
      * COTISATION NON BATI TSE EPF 1                                           
           10 'X'-MCTCA     PIC S9(10).                                         
      * COTISATION CHAMBRE D'AGRICULTURE                                        
           10 'X'-MCTBAP    PIC S9(10).                                         
      * COTISATION BAPSA                                                        
           10 'X'-MCTCAP    PIC S9(10).                                         
      * COTISATION DROIT PROPORTIONNEL CAAA                                     
           10 'X'-MCTCAD    PIC S9(5).                                          
      * COTISATION DROIT FIXE CAAA                                              
           10 'X'-MCNTSA    PIC 9(10).                                          
      * COTISATION AMALGAMEE NON BATI TSE NV                                    
           10 'X'-MCFFIX    PIC S9(10).                                         
      * MONTANT FRAIS FIXE CAAA                                                 
           10 'X'-MFA300    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE A 3%                                             
           10 'X'-MCFANO REDEFINES 'X'-MFA300    PIC S9(10).                    
      * MONTANT FRAIS ASSIETTE NORMAUX                                          
           10 'X'-MFN300    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR A 3%                                           
           10 'X'-MCFNVN REDEFINES 'X'-MFN300    PIC S9(10).                    
      * MONTANT FRAIS NON VALEUR NORMAUX                                        
           10 'X'-MCFABA    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE BAPSA                                            
           10 'X'-MCFNVB    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR BAPSA                                          
           10 'X'-MCFACA    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE CAAA                                             
           10 'X'-MCFNVC    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR CAAA                                           
           10 'X'-FILLER    PIC X(10).                                          
           10 'X'-MDGPLA    PIC S9(10).                                         
      * MONTANT DEGREVEMENT PRES ET LANDES                                      
           10 'X'-MDGFAP    PIC S9(10).                                         
      * MONTANT DEGREV.FRAIS ASSIETTE PRES                                      
           10 'X'-MDGFNV    PIC S9(10).                                         
      * MONTANT DEGREV.FRAIS NON VALEUR PRES                                    
           10 'X'-MDJCOM    PIC S9(10).                                         
      * MONTANT DEGREVT. JEUNE AGRIC. COM.                                      
           10 'X'-MDJSYN    PIC S9(10).                                         
      * MONTANT DEGREVT. JEUNE AGRIC. SYN.                                      
           10 'X'-MDJCU     PIC S9(10).                                         
      * MONTANT DEGREVT. JEUNE AGRIC. GROUP.                                    
           10 'X'-MDJTSE    PIC S9(10).                                         
      * MONTANT DEGREVT. JEUNE AGRIC. TSE                                       
           10 'X'-MDJDEP    PIC S9(10).                                         
      * MONTANT DEGREVT. JEUNE AGRIC. DPT.                                      
           10 'X'-MDJT13    PIC S9(10) OCCURS 2.                                
      * MONTANT DEGREV JEUNE AGRIC TSE EPF 1                                    
           10 'X'-TCTHFR    PIC S9(12).                                         
      * TOTAL COTISATION HORS FRAIS                                             
           10 'X'-TCTFRA    PIC S9(12).                                         
      * COTISATION - TOTAL DES FRAIS                                            
           10 'X'-TCTDU     PIC S9(12).                                         
      * TOTAL COTISATION DU (AVEC FRAIS)                                        
           10 'X'-MCNJAE    PIC S9(10).                                         
      * MONTANT TOTAL COTISATION JA ETAT                                        
           10 'X'-MFAJ1E    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE JA ETAT                                          
           10 'X'-MFNJ1E    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR JA ETAT                                        
           10 'X'-MCTCAS    PIC S9(10).                                         
      * COTIS. CHAMBRE D'AGR. SAINT MARTIN                                      
           10 'X'-MFA800    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE A 8%                                             
           10 'X'-MCAANO REDEFINES 'X'-MFA800    PIC S9(10).                    
      * MNT FRAIS ASSIETTE CHAGR NORMAUX                                        
           10 'X'-MFN800    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR A 8%                                           
           10 'X'-MCANVN REDEFINES 'X'-MFN800    PIC S9(10).                    
      * MNT FRAIS ASSIETTE CHAGR NON VALEUR                                     
           10 'X'-MFA900    PIC S9(10).                                         
      * MONTANT FRAIS ASSIETTE A 9%                                             
           10 'X'-MFN900    PIC S9(10).                                         
      * MONTANT FRAIS NON VALEUR A 9%                                           
           10 'X'-MCOGE3    PIC S9(10).                                         
      * COTISATION GEMAPI                                                       
           10 'X'-CCOIFP    PIC X(3).                                           
      * CODE COMMUNE ABSORBEE                                                   
           10 'X'-CCPPER    PIC X(3).                                           
      * CODE TRESORERIE                                                         
           10 'X'-FILLER    PIC X(145).                                         
