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
         
                                                                                      
       ID DIVISION.                                                             
       PROGRAM-ID. CTXTA3B.                                                     
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
       01  VERSION PIC X(23) VALUE 'CTXTA3B  07 DU 02/06/20'.                   
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***                           
       01 SLATVARS              PIC X(122)                  VALUE 'SLAT         
      -    'VARS START:20/06/0211:17:40BEHYVER        CTXTA3B 0000100001        
      -    'GO2.TAX.PGM                                 SLAT VARS END'.         
       01 PARM                     PIC X.                                       
       LINKAGE SECTION.                                                         
      * DESCRIPTION DES PARAMETRES                                              
      * APPEL INITIAL                                                           
       01 ENTREE.                                                               
          05             PIC X.                                                 
          05 E-ANNEE     PIC X(4).                                              
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
           EVALUATE E-ANNEE                                                     
              WHEN '2011'                                                       
                 CALL 'EFITA3B1' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2012'                                                       
                 CALL 'EFITA3B2' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2013'                                                       
                 CALL 'EFITA3B3' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2014'                                                       
                 CALL 'EFITA3B4' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2015'                                                       
                 CALL 'EFITA3B5' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2016'                                                       
                 CALL 'EFITA3B6' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2017'                                                       
                 CALL 'EFITA3B7' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2018'                                                       
                 CALL 'EFITA3B8' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2019'                                                       
                 CALL 'EFITA3B9' USING ENTREE SORTIE CRM RCM PARM               
              WHEN '2020'                                                       
                 CALL 'EFITA3B0' USING ENTREE SORTIE CRM RCM PARM               
           END-EVALUATE                                                         
           GOBACK                                                               
           .                                                                    
