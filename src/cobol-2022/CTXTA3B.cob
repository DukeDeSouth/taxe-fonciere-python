      *********************************************************                 
      * PROGRAMME CTXTA3B                                     *                 
      * LANGAGE COBOL                                         *                 
      *                                                       *                 
      * CE SOUS-PROGRAMME EST LE POINT D'ENTREE DE LA         *                 
      * CALCULETTE DES COTISATIONS DE TF BATIE.               *                 
      * EN FONCTION DE L'ANNEE D'IMPOSITION VALORISEE DANS LA *                 
      * ZONE D'E/S, LE SOUS PROGRAMME APPELLE LA CALCULETTE   *                 
      * MILLESIMEE CORRESPONDANTE.                            *                 
      *                                                       *                 
      *********************************************************                 
JMB22 * MAINTENANCE 2022                                                        
      * - AUTOMATISATION DE L'APPEL                                             
      *********************************************************                 
IH21  * MAINTENANCE 2021                                                        
      * - APPEL DE LA CALCULETTE 2021 : EFITA3B1                                
      *********************************************************                 
VC20  * MAINTENANCE 2020                                                        
      * - APPEL DE LA CALCULETTE 2020 : EFITA3B0                                
      * - MAJ DE LA VERSION (DATE)                                              
      *********************************************************                 
                                                                                
       ID DIVISION.                                                             
       PROGRAM-ID. CTXTA3B.                                                     
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***                           
       01 SLATVARS              PIC X(122)                  VALUE 'SLAT         
      -    'VARS START:22/06/1618:00:40TSOCQF3        CTXTA3B 0000100001        
      -    'GO2.TAX.PGM                                 SLAT VARS END'.         
                                                                                
       01  VERSION PIC X(23) VALUE 'CTXTA3B  20 DU 16/06/22'.                   
       01 PARM                     PIC X.                                       
                                                                                
JMB    01 WW00-SSPROG.                                                          
JMB       05 WW00-DEBUT PIC X(7) VALUE 'EFITA3B'.                               
JMB       05 WW00-UNITE PIC X(1).                                               
                                                                                
       LINKAGE SECTION.                                                         
      * DESCRIPTION DES PARAMETRES                                              
      * APPEL INITIAL                                                           
       01 ENTREE.                                                               
          05             PIC X.                                                 
JMB       05 E-ANNEE.                                                           
JMB          10 E-XXX    PIC X(3).                                              
JMB          10 E-UNITE  PIC X(1).                                              
          05             PIC X(595).                                            
      * RETOUR DES COTISATIONS CALCULEES                                        
       01 SORTIE      PIC X(600).                                               
      * RETOUR DES CODES ANOMALIES                                              
       01 CRM         PIC 9(2).                                                 
       01 RCM         PIC 9(2).                                                 
                                                                                
       PROCEDURE DIVISION USING ENTREE SORTIE CRM RCM .                         
       TRAIT.                                                                   
           IF CRM = 99                                                          
              MOVE 'M' TO PARM                                                  
           ELSE                                                                 
              MOVE ' ' TO PARM                                                  
           END-IF                                                               
           MOVE 00     TO CRM                                                   
                                                                                
JMB            MOVE E-UNITE TO WW00-UNITE.                                      
JMB            CALL  WW00-SSPROG USING   ENTREE SORTIE CRM RCM PARM             
                                                                                
           GOBACK                                                               
           .                                                                    
