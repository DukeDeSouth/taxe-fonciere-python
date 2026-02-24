      *********************************************************                 
      * PROGRAMME CTXTA3N                                     *                 
      * LANGAGE COBOL                                         *                 
      *                                                       *                 
      * CE SOUS-PROGRAMME EST LE POINT D'ENTREE DE LA         *                 
      * CALCULETTE DES COTISATIONS DE TF NON BATIE.           *                 
      * EN FONCTION DE L'ANNEE D'IMPOSITION VALORISEE DANS LA *                 
      * ZONE D'E/S, LE SOUS PROGRAMME APPELLE LA CALCULETTE   *                 
      * MILLESIMEE CORRESPONDANTE.                            *                 
      *                                                       *                 
      *********************************************************                 
JMB22 * MAINTENANCE 2022                                                        
      * - AUTOMATISATION DE L'APPEL                                             
      *********************************************************                 
JJ21  * MAINTENANCE 2021                                                        
      * - APPEL DE LA CALCULETTE 2021 : EFITA3N1                                
      * - MAJ DE LA VERSION (DATE)                                              
      *********************************************************                 
VC20  * MAINTENANCE 2020                                                        
      * - APPEL DE LA CALCULETTE 2020 : EFITA3N0                                
      * - MAJ DE LA VERSION (DATE)                                              
      *********************************************************                 
VB19  * MAINTENANCE 2019                                                        
      * - APPEL DE LA CALCULETTE 2019 : EFITA3N9                                
      * - MAJ DE LA VERSION (DATE)                                              
      *********************************************************                 
                                                                                
       ID DIVISION.                                                             
       PROGRAM-ID. CTXTA3N.                                                     
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***                           
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT         
      -    'VARS START:22/06/1618:00:41TSOCQF3        CTXTA3N 0000100001        
      -    'GO2.TAX.PGM                                 SLAT VARS END'.         
                                                                                
       01  VERSION PIC X(23) VALUE 'CTXTA3N  19 DU 16/06/22'.                   
       01 PARM          PIC X .                                                 
                                                                                
JMB    01 WW00-SSPROG.                                                          
JMB       05 WW00-DEBUT PIC X(7) VALUE 'EFITA3N'.                               
JMB       05 WW00-UNITE PIC X(1).                                               
                                                                                
       LINKAGE SECTION.                                                         
      *DESCRIPTION DES PARAMETRES DE LIAISON                                    
      * - APPEL INITIAL                                                         
       01 ENTREE.                                                               
          05               PIC X(1).                                            
JMB       05  ANNEE.                                                            
JMB          10 E-XXX      PIC X(3).                                            
JMB          10 E-UNITE    PIC X(1).                                            
          05               PIC X(595).                                          
      * - RETOUR             DES BASES CALCULEES                                
       01 SORTIE  PIC X(600).                                                   
      * - RETOUR             DES CODES ANOMALIES                                
       01 CR           PIC 99.                                                  
       01 RC           PIC 99.                                                  
                                                                                
       PROCEDURE DIVISION   USING   ENTREE SORTIE CR RC .                       
       TRAIT.                                                                   
               IF CR  = 99                                                      
                   MOVE 'M' TO PARM                                             
               ELSE                                                             
                   MOVE ' ' TO PARM                                             
               END-IF                                                           
               MOVE 00      TO CR                                               
                                                                                
JMB            MOVE E-UNITE TO WW00-UNITE.                                      
JMB            CALL  WW00-SSPROG USING   ENTREE  SORTIE  CR  RC PARM            
                                                                                
           GOBACK.                                                              
