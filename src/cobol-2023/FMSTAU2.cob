      ************************************************************              
      *    PROGRAMME 'PRIMITIVE' D INTERROGATION A LA            *              
      *    BASE TAUX                                             *              
      ************************************************************              
      ************************************************************              
      * LP1097  MODIF GESTION CODE RETOUR QD COMMUNE NON TROUVEE *              
      ************************************************************              
      *    APPEL :                                               *              
      *                                                          *              
      *    CALL 'Fmstaux' USING                                  *              
      *               TETE DIR COM SR CR RC ZONE-RECEPTION       *              
      *                                                          *              
      *   DEFINITION DES ZONES :                                 *              
      *                                                          *              
      *     TETE :  ANNEE SUR 4 CHIFFRES   -  9(4) -             *              
      *     DIR  :  DIRECTION              -  X(3) -             *              
      *     COM  :  COMMUNE                -  9(3) -             *              
      *     IFP  :  CODE IFP               -  X(3) -             *              
      *                                                          *              
      *     CR   :  CODE RETOUR            -  9(2) -             *              
      *     RC   :  CODE RAISON            -  X(2) -             *              
      *                                                          *              
      *     ZONE RECEPTION : ZONE DE RECEPTION DES               *              
      *          INFORMATIONS BASE TAUX                          *              
010305*               X(400)  OCCURS 7                           *              
      *                                                          *              
      *               1ER ELEMENT : INFO ANNEE                   *              
      *               2EM ELEMENT : INFO DIR REGION              *              
      *               3EM ELEMENT : INFO COMMUNE                 *              
      *               4EM ELEMENT : INFO IFP                     *              
018639*               5EM ELEMENT : INFO TSE, TSEGP, EPCI        *              
018639*               (fourni sous forme d'un occurs 3 )         *              
018639*                             et ADRESSE MEL EPCI          *              
010305*               6EM ELEMENT : INFO LIBELLE BENEFICIAIRE OM *              
019828*                             et ADRESSE MEL COMMUNE       *              
010305*               7EM ELEMENT : INFO LIBELLES SYNDICATS      *              
      *                                                          *              
      *               SI LES 4 PARAMETRES (TETE DIR COM SR)      *              
010305*               SONT SERVIS, 4 ELEMENTS  AU MOINS SERONT   *              
010305*               REMPLIS (MAXIMUM 7 ELEMENTS)               *              
      *               SI ON NE DESIRE QUE LES INFOS NIVEAU       *              
      *               COMMUNE ON METTRA SR A SPACE               *              
      *               SI ON NE DESIRE QUE LES INFOS NIVEAU       *              
      *               DIRECTION ON METTRA SR A SPACE ET          *              
      *               COM A ZERO.                                               
      *               SI ON NE DESIRE QUE LES INFOS NIVEAU       *              
      *               TETE  ON METTRA SR A SPACE , COM A ZERO    *              
      *               ET DIR A SPACE.                            *              
      *                                                          *              
      ************************************************************              
      *   CODES RETOURS RENDUS :                                 *              
      *                                                          *              
      *    CR   RC                                               *              
      *    20   01     SEGMENT TETE NON TROUVE                   *              
      *    21   01     SEGMENT DIR  NON TROUVE                   *              
      *    22   01     SEGMENT COM  NON TROUVE                   *              
      *    23   01     SEGMENT SR   NON TROUVE                   *              
018639*    24   01     SEGMENT SR SUITE  NON TROUVE              *              
018967*    25   01     SEGMENT DIR ORIGINE NON TROUVE (EN CAS DE *              
      *                COMMUNE AYANT CHANGE DE DEPARTEMENT)      *              
      *    12   10     TAUX NON VALIDES                          *              
      *                                                          *              
      *    16   DLI    ANO ACCES BASE TAUX                       *              
      *    18   DLI    ANO SUR RECUP PCB                         *              
      *                                                          *              
      ************************************************************              
       ID DIVISION.                                                             
019128 PROGRAM-ID. FMSTAU2.                                                     
       DATA DIVISION.                                                           
       WORKING-STORAGE SECTION.                                                 
      *   *** ADR/LIBRARIAN SLAT VARIABLES FOLLOW ***                           
       01  SLATVARS              PIC X(122)                 VALUE 'SLAT         
      -    'VARS START:›DATEUPD›TIMEUPD›PROGRAMMERNAME›MODNAME›LVNO›UPNO        
      -    '›DATA-SET-NAME-FOR-THE-LIBRARIAN-MASTER-FILESLAT VARS END'.         
                                                                                
      * PARAMETRES D ACCES A LA BASE TAUX (DLI)                                 
       77  GU                           PIC X(04).                              
       01  SSAQ-GEN.                                                            
           05  SSA-SEG PIC X(11) value 'XEXTDXTD*C('.                           
019128     05  SSAQ-CLE                 PIC X(13).                              
           05  SSA-F3                   PIC X(01) value ')'.                    
      * DETAIL CLE                                                              
       01 W-TAU-CLE.                                                            
           05  W-TAU-AN PIC 9(4).                                               
           05  W-TAU-DIR PIC X(3).                                              
           05  W-TAU-COM PIC 9(3).                                              
019128     05  W-TAU-IFP PIC X(3).                                              
018967 01 W-ORI-CLE.                                                            
  "        05  W-ORI-AN PIC 9(4).                                               
  "        05  W-ORI-DIR PIC X(3).                                              
  "        05  W-ORI-COM PIC 9(3).                                              
019128     05  W-ORI-IFP PIC X(3).                                              
010305*                                                                         
010305* DETAIL CLE POUR RECHERCHE DES ARTICLES LIBELLES                         
010305 01 W-LIB-CLE.                                                            
010305     05  W-LIB-AN PIC 9(4).                                               
010305     05  W-LIB-DIR PIC X(3).                                              
060506     05  W-LIB-CLE1.                                                      
010305       10  W-LIB-CTYGC PIC X.                                             
010305       10  W-LIB-DNUCOL PIC X(3).                                         
019128     05  FILLER PIC X(2) VALUE SPACE.                                     
010305*                                                                         
016935* SAUVEGARDE CODE DIRECTION ENTREE                                        
  "    01 W-ACODIR-ENTREE               PIC X(03).                              
  "   * DERNIER CARACTERE MIN DU CODE DIRECTION POUR LES DEPARTEMENTS           
  "     1 DEPT-DIR-MIN     PIC 9.                                               
  "        88 DEPT-DIR-N2  VALUE 1.                                             
  "        88 DEPT-DIR-N5  VALUE 4.                                             
  "   * DERNIER CARACTERE MAX DU CODE DIRECTION POUR LES DEPARTEMENTS           
  "     1 DEPT-DIR-MAX     PIC 9.                                               
  "        88 DEPT-DIR-X2  VALUE 2.                                             
  "        88 DEPT-DIR-X5  VALUE 8.                                             
  "   * TROISIEME ET DERNIER CARACTERE DU CODE DIRECTION                        
  "    01 IND-DIR  PIC 9.                                                       
  "   * INDICATEUR DE FIN DE BOUCLE                                             
  "     1                  PIC 9.                                               
  "        88 NOTOK        VALUE 0.                                             
016935     88 OK           VALUE 1.                                             
      * ADRESSE PCB                                                             
       01 XPCBNAME                      PIC X(08).                              
       01 XPCBADX                       EXTERNAL.                               
          05 XPCB-COM00                 USAGE POINTER.                          
010305*--------------    DONNEES GENERALES  ANNEE --------------------***       
      *  ANNEE SERVIE  -  DIR = SPACE  - COM = 000 - CODE IFP = SPACE   *       
019128 01   XB30.                                                               
019128 COPY XB30.                                                               
      *--------------    DONNEES DIRECTION  --------------------------***       
      *  ANNEE SERVIE  -  DIR SERVIE   - COM = 000 - CODE IFP = SPACE   *       
019128 01   XB35.                                                               
019128 COPY XB35.                                                               
018967*--------------    DONNEES DIRECTION ORIGINE -------------------***       
019128*  ANNEE SERVIE  -  DIR SERVIE   - COM = 000 - CODE IFP = SPACE   *       
019128 01   XB35-ORI.                                                           
019128 COPY XBXTDDIR REPLACING 'X' BY XB35-ORI.                                 
      *--------------    DONNEES COMMUNE    --------------------------***       
019128* ANNEE SERVIE - DIR SERVIE  - COM SERVIE    - CODE IFP = SPACE   *       
019128 01   XB40.                                                               
019128 COPY XB40.                                                               
019128*--------------    DONNEES CODE IFP ----------------------------***       
019128* ANNEE SERVIE - DIR SERVIE  - COM SERVIE  - CODE IFP = SERVI     *       
019128 01   XB45.                                                               
019128 COPY XB45.                                                               
019128*--------------    DONNEES CODE IFP SUITE ----------------------***       
019128 01   XB46.                                                               
019128 COPY XB46.                                                               
      *--------------    DONNEES ORGANISME TSE------------------------***       
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***       
019128 01   XB36.                                                               
019128 COPY XB36.                                                               
      *--------------    DONNEES LIBELLE EPCI ------------------------***       
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***       
019128 01   XB37.                                                               
019128 COPY XB37.                                                               
      *--------------    DONNEES LIBELLE TEOM ------------------------***       
      * ANNEE SERVIE - DIR SERVIE  - TYPE GPT SERVI - CODE GPT SERVI  ***       
019128 01   XB38.                                                               
019128  COPY XB38.                                                              
      *--------------    DONNEES LIBELLES SYNDICATS ------------------***       
019128* ANNEE SERVIE - DIR SERVIE  - COM SERVIE - CODE IFP Z SERVI    ***       
019128 01   XB47.                                                               
019128 COPY XB47.                                                               
018639*--------------    DONNEES ADRESSE MEL COMMUNE -----------------***       
019128* ANNEE SERVIE - DIR SERVIE  - COM SERVIE - CODE IFP Y SERVI    ***       
019128 01   XB41.                                                               
019128 COPY XB41.                                                               
018639*-------------    article pour restitution des 3 libell{s        ***      
018639*------------- 1er  occurs : libell{ TSE          sur 100 C.     ***      
018639*------------- 2}me occurs : libell{ TSE GP,MA,GA sur 100 C.     ***      
018639*------------- 3er  occurs : libell{ EPCI sur 100 caract}res     ***      
018639*-------------             : adresse mel EPCI sur 100 C.         ***      
019128 01   XB50.                                                               
019128 COPY XB50.                                                               
020452*-------------    article pour restitution des 2 libell{s        ***      
020452*------------- 1er  occurs : libell{ TEOM         sur 100 C.     ***      
020452*------------- 2}me occurs : libell{ TANB         sur 100 C.     ***      
020452*-------------             : adresse mel commune sur 100 C.      ***      
019128 01   XB51.                                                               
019128 COPY XB51.                                                               
300903 LINKAGE SECTION.                                                         
300903* DESCRIPTION DES PARMS EN ENTREE                                         
019128 COPY XTAU2.                                                              
300903* **************************************************                      
      * DESCRIPTION PCB                                                         
       01  PCB-COM.                                                             
            05  NOMBASE               PIC X(8).                                 
            05  NIVEAUSEG             PIC X(2).                                 
            05  DLI-RETOUR            PIC X(2).                                 
            05  PROCOPT               PIC X(4).                                 
            05  RESERVES              PIC S9(5) COMP.                           
            05  NOMSEG                PIC X(8).                                 
            05  LG-CLE                PIC S9(5) COMP.                           
            05  NB-SEG-ACCESSIB       PIC S9(5) COMP.                           
            05  CLE-CONCAT            PIC X(07).                                
                                                                                
300903* **************************************************                      
       PROCEDURE DIVISION USING FIE01-JANIPT FIE01-ACODIR                       
019128         FIE01-CCOCOM FIE01-CCOIFP CR RC                                  
               ZES.                                                             
      **************************************************************            
      *  INITIALISATION.                                           *            
      **************************************************************            
        INIT.                                                                   
            MOVE 'GU' TO GU.                                                    
019128      INITIALIZE XB30                                                     
019128                 XB35                                                     
019128                 XB36                                                     
019128                 XB40                                                     
019128                 XB45                                                     
019128                 XB37                                                     
019128                 XB38                                                     
019128                 XB50                                                     
019128                 XB41 XB46 XB51                                           
019128                 XB47           CR  RC                                    
            .                                                                   
      **************************************************************            
      *  ACCES A LA BASE DES TAUX                                  *            
      *  UN SEUL PCB EN LECTURE : GPHXTDTA                         *            
      **************************************************************            
        ACCES-TAUX.                                                             
            MOVE 'GPHXTD00' TO XPCBNAME                                         
            CALL 'FMSPCB' USING XPCBNAME XPCB-COM00                             
            IF RETURN-CODE NOT = 0                                              
                  MOVE 18 TO CR                                                 
                  MOVE RETURN-CODE TO RC                                        
            ELSE                                                                
              SET ADDRESS OF PCB-COM TO XPCB-COM00                              
            END-IF                                                              
            .                                                                   
      *                                                                         
016935**************************************************************            
  "   *  CAS DU PELP                                               *            
  "   **************************************************************            
  "     PELP-DEPT-MULTI-DSF.                                                    
  "         MOVE FIE01-ACODIR TO W-ACODIR-ENTREE                                
  "   *   RECHERCHE DE LA COMMUNE DANS LA BASE TAUX                             
  "   *********************************************                             
  "         IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND                      
  "            (FIE01-CODEP = '75' OR '13' OR '59' OR '92')                     
  "                                  AND FIE01-CCOCOM NOT = ZERO)               
  "             PERFORM PELP-COM                                                
  "         END-IF                                                              
  "         .                                                                   
016935*                                                                         
      **************************************************************            
      *  RECUP SELON LE CAS DE 1 A 7 SEGMENTS                      *            
      **************************************************************            
        RECUP-SEG.                                                              
      *                                                                         
      *   RECHERCHE DE L'ANNEE DANS LA BASE TAUX                                
      ******************************************                                
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO)                         
              PERFORM RECH-ANNEE                                                
            END-IF                                                              
      *                                                                         
      *   RECHERCHE DE LA DIRECTION DANS LA BASE TAUX                           
      ***********************************************                           
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO                          
                           AND FIE01-ACODIR NOT = SPACE)                        
              PERFORM RECH-DIR                                                  
            END-IF                                                              
      *                                                                         
      *   RECHERCHE DE LA COMMUNE DANS LA BASE TAUX                             
      *********************************************                             
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND                      
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)           
                PERFORM RECH-COM                                                
      *  RECHERCHE DU LIBELLE GROUPEMENT EPCI SI CODE RENSEIGNE                 
                IF (CR NOT > 2 AND XB40-CTYGC NOT = SPACE                       
                             AND XB40-DNUCOL NOT = SPACE)                       
                    PERFORM RECH-LEPCI                                          
                END-IF                                                          
      *  RECHERCHE DU LIBELLE GROUPEMENT TEOM SI CODE RENSEIGNE                 
                IF (CR NOT > 2 AND XB40-CTYSYN NOT = SPACE                      
                             AND XB40-CCOSYN NOT = SPACE)                       
                    PERFORM RECH-LTEOM                                          
                END-IF                                                          
020452*  RECHERCHE DU LIBELLE GROUPEMENT TANB SI CODE RENSEIGNE                 
  "             IF (CR NOT > 2 AND XB40-CTYTXA NOT = SPACE                      
  "                          AND XB40-CCOTXA NOT = SPACE)                       
  "                 PERFORM RECH-LTANB                                          
020452          END-IF                                                          
            END-IF                                                              
      *                                                                         
019128*   RECHERCHE DU CODE IFP DANS LA BASE TAUX                               
      ********************************************                              
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND                      
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO            
019128                                   AND FIE01-CCOIFP NOT = SPACE)          
019128        PERFORM RECH-IFP                                                  
019128*   RECHERCHE DU CODE IFP SUITE DANS LA BASE TAUX                         
              IF FIE01-JANIPT > 2015                                            
019128           PERFORM RECH-IFP-SUITE                                         
020452*  RECHERCHE DU LIBELLE GROUPEMENT EPCI SI CODE RENSEIGNE                 
  "   *  A PARTIR DE 2019, LE CODE GROUPEMENT EPCI EST AU NIVEAU IFP            
  "              IF (CR NOT > 2 AND XB40-CTYGC NOT = SPACE                      
  "                           AND XB40-DNUCOL NOT = SPACE)                      
  "                 PERFORM RECH-LEPCI                                          
020452           END-IF                                                         
019128*  RECHERCHE DU LIBELLE GROUPEMENT TEOM SI CODE RENSEIGNE                 
  "   *  A PARTIR DE 2016, LE CODE GROUPEMENT TEOM EST AU NIVEAU IFP            
  "              IF (CR NOT > 2 AND XB40-CTYSYN NOT = SPACE                     
  "                             AND XB40-CCOSYN NOT = SPACE)                    
  "                 PERFORM RECH-LTEOM                                          
019218           END-IF                                                         
020452*  RECHERCHE DU LIBELLE GROUPEMENT TANB SI CODE RENSEIGNE                 
  "   *  A PARTIR DE 2016, LE CODE GROUPEMENT TANB EST AU NIVEAU SR/IFP         
  "   *  A PARTIR DE 2019, RESTITUTION DU LIBELLE TANB                          
  "              IF (CR NOT > 2 AND XB40-CTYTXA NOT = SPACE                     
  "                             AND XB40-CCOTXA NOT = SPACE)                    
  "                 PERFORM RECH-LTANB                                          
020452           END-IF                                                         
018639        END-IF                                                            
      * RECHERCHE DES LIBELLES TSE POUR RESTITUTION DU RESULTAT DANS XB50       
              PERFORM RECH-LIB                                                  
018967* CAS DU CHANGEMENT DE DEPARTEMENT POUR UNE COMMUNE : RECHERCHE DU        
  "   * SEGMENT DIRECTION D'ORIGINE                                             
  "           IF (CR NOT > 2 AND XB45-CCDDIR NOT = SPACE)                       
  "              PERFORM RECH-DIR-ORI                                           
018967        END-IF                                                            
            END-IF                                                              
      *                                                                         
019128*   RECHERCHE DES LIBELLES SYNDICATS (CODE IFP "Z  ")                     
      ***************************************************                       
            IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND                      
                FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)           
              PERFORM RECH-LSYN                                                 
            END-IF                                                              
018639*                                                                         
019128*   RECHERCHE DE L'ADRESSE MEL COMMUNE (CODE IFP "Y  ")                   
  "   ***************************************************                       
  "         IF (CR NOT > 2 AND FIE01-JANIPT NOT = ZERO AND                      
  "             FIE01-ACODIR NOT = SPACE AND FIE01-CCOCOM NOT = ZERO)           
  "           PERFORM RECH-LMEL                                                 
018639      END-IF                                                              
      *                                                                         
      *   RESTITUTION DES INFORMATIONS                                          
      ***************************************************                       
            MOVE   XB30      TO  EL-REC(1)                                      
            MOVE   XB35      TO  EL-REC(2)                                      
            MOVE   XB40      TO  EL-REC(3)                                      
            MOVE   XB45      TO  EL-REC(4)                                      
            MOVE   XB50      TO  EL-REC(5)                                      
019828      MOVE   XB51      TO  EL-REC(6)                                      
019828      MOVE   XB47      TO  EL-REC(7)                                      
016935      MOVE W-ACODIR-ENTREE TO FIE01-ACODIR                                
            GOBACK                                                              
            .                                                                   
                                                                                
      ********      FONCTIONS APPELEES PAR PERFORM                              
                                                                                
      *  RECHERCHE DE L'ARTICLE ANNEE DANS LA BASE TAUX                         
      *                                                                         
       RECH-ANNEE.                                                              
              MOVE FIE01-JANIPT TO W-TAU-AN                                     
              MOVE SPACE        TO W-TAU-DIR                                    
              MOVE 0            TO W-TAU-COM                                    
019128        MOVE SPACE        TO W-TAU-IFP                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB30                             
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN 'GE'                                                         
                   MOVE  20  TO  CR    MOVE 01 TO RC                            
              WHEN  NOT SPACE                                                   
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
                .                                                               
      *                                                                         
      *  RECHERCHE DE L'ARTICLE DIRECTION DANS LA BASE TAUX                     
       RECH-DIR.                                                                
              MOVE FIE01-ACODIR TO W-TAU-DIR                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB35                             
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN 'GE'                                                         
                   MOVE  21  TO  CR    MOVE 01 TO RC                            
              WHEN  NOT SPACE                                                   
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
               .                                                                
      *                                                                         
018967*  RECHERCHE DE L'ARTICLE DIRECTION ORIGINE DANS LA BASE TAUX             
018967 RECH-DIR-ORI.                                                            
              MOVE FIE01-JANIPT TO W-ORI-AN                                     
              MOVE XB45-CCDDIR  TO W-ORI-DIR                                    
              MOVE '000'        TO W-ORI-COM                                    
019128        MOVE SPACE        TO W-ORI-IFP                                    
              MOVE W-ORI-CLE    TO SSAQ-CLE                                     
              CALL 'CBLTDLI' USING GU  PCB-COM XB35-ORI                         
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN '  '                                                         
019128             MOVE XB35-ORI-ADTSEG(1:385)                                  
                                        TO XB35-ADTSEG                          
      * LE TAUX DEPARTEMENTAL BATI S'APPLIQUE-T-IL @ LA COMMUNE ?               
                   IF XB40-GNIDEP = 'N'                                         
                      MOVE ZERO TO XB35-PTBDEP                                  
                   END-IF                                                       
              WHEN 'GE'                                                         
                   MOVE  25  TO  CR    MOVE 01 TO RC                            
              WHEN OTHER                                                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
               .                                                                
      *                                                                         
      *  RECHERCHE DE L'ARTICLE COMMUNE DANS LA BASE TAUX                       
       RECH-COM.                                                                
              MOVE FIE01-CCOCOM TO W-TAU-COM                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB40                             
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN '  '                                                         
      *                LES TAUX DE LA COMMUNE SONT ILS VALIDES ?                
                   IF XB40-GTOVOT NOT = 'V'                                     
                      MOVE 12 TO CR  MOVE 10 TO RC                              
                   END-IF                                                       
018038* LE TAUX DEPARTEMENTAL BATI S'APPLIQUE-T-IL @ LA COMMUNE ?               
  "                IF XB40-GNIDEP = 'N'                                         
  "                   MOVE ZERO TO XB35-PTBDEP                                  
018038             END-IF                                                       
              WHEN 'GE'                                                         
                   MOVE  22  TO  CR    MOVE 01 TO RC                            
              WHEN  NOT SPACE                                                   
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
              .                                                                 
      *                                                                         
019128*  RECHERCHE DE L'ARTICLE CODE IFP DANS LA BASE TAUX                      
019128 RECH-IFP.                                                                
019128        MOVE FIE01-CCOIFP TO W-TAU-IFP                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB45                             
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN 'GE'                                                         
                   MOVE  23  TO  CR    MOVE 01 TO RC                            
              WHEN  NOT SPACE                                                   
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
              .                                                                 
      *                                                                         
019128*  RECHERCHE DE L'ARTICLE CODE IFP SUITE DANS LA BASE TAUX                
019128 RECH-IFP-SUITE.                                                          
              MOVE SPACE        TO W-TAU-DIR                                    
019128        MOVE FIE01-CCOIFP TO W-TAU-IFP                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB46                             
                       SSAQ-GEN                                                 
              EVALUATE DLI-RETOUR                                               
              WHEN '  '                                                         
                   MOVE XB46-PBBOMP     TO XB40-PBBOMP                          
                   MOVE XB46-PBBOMA     TO XB40-PBBOMA                          
                   MOVE XB46-PBBOMB     TO XB40-PBBOMB                          
                   MOVE XB46-PBBOMC     TO XB40-PBBOMC                          
                   MOVE XB46-PBBOMD     TO XB40-PBBOMD                          
019250             MOVE XB46-PBBOME     TO XB40-PBBOME                          
                   MOVE XB46-NTXOM      TO XB40-NTXOM                           
                   MOVE XB46-ACOSYN     TO XB40-ACOSYN                          
                   MOVE XB46-ACOGOM     TO XB40-ACOGOM                          
                   MOVE XB46-ACOBIM     TO XB40-ACOBIM                          
                   MOVE XB46-ACOTXA     TO XB40-ACOTXA                          
                   MOVE XB46-ACOGEM     TO XB40-ACOGEM                          
                   MOVE XB46-JCOINS(1)  TO XB40-JCOINS(1)                       
                   MOVE XB46-JCORIM(1)  TO XB40-JCORIM(1)                       
                   MOVE XB46-JCOINS(2)  TO XB40-JCOINS(2)                       
                   MOVE XB46-JCORIM(2)  TO XB40-JCORIM(2)                       
                   MOVE XB46-JCOINS(3)  TO XB40-JCOINS(3)                       
                   MOVE XB46-JCORIM(3)  TO XB40-JCORIM(3)                       
                   MOVE XB46-JCOINS(4)  TO XB40-JCOINS(4)                       
                   MOVE XB46-JCORIM(4)  TO XB40-JCORIM(4)                       
                   MOVE XB46-JCOINS(5)  TO XB40-JCOINS(5)                       
                   MOVE XB46-JCORIM(5)  TO XB40-JCORIM(5)                       
020452             IF FIE01-JANIPT > 2018                                       
  "                   MOVE XB46-CTYGC   TO XB40-CTYGC                           
  "                   MOVE XB46-DNUCOL  TO XB40-DNUCOL                          
  "                   MOVE XB46-JGCINS(1)  TO XB40-JGCINS(1)                    
  "                   MOVE XB46-JGCRIM(1)  TO XB40-JGCRIM(1)                    
  "                   MOVE XB46-JGCINS(2)  TO XB40-JGCINS(2)                    
  "                   MOVE XB46-JGCRIM(2)  TO XB40-JGCRIM(2)                    
  "                   MOVE XB46-JGCINS(3)  TO XB40-JGCINS(3)                    
  "                   MOVE XB46-JGCRIM(3)  TO XB40-JGCRIM(3)                    
  "                   MOVE XB46-JGCINS(4)  TO XB40-JGCINS(4)                    
  "                   MOVE XB46-JGCRIM(4)  TO XB40-JGCRIM(4)                    
  "                   MOVE XB46-JGCINS(5)  TO XB40-JGCINS(5)                    
  "                   MOVE XB46-JGCRIM(5)  TO XB40-JGCRIM(5)                    
020452             END-IF                                                       
              WHEN 'GE'                                                         
                   MOVE  24  TO  CR    MOVE 01 TO RC                            
              WHEN OTHER                                                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-EVALUATE                                                      
              .                                                                 
      *                                                                         
      *  RECHERCHE DE L'ARTICLE LIBELLE EPCI DANS LA BASE TAUX                  
       RECH-LEPCI.                                                              
              MOVE FIE01-JANIPT TO W-LIB-AN                                     
              MOVE FIE01-ACODIR TO W-LIB-DIR                                    
018840        IF FIE01-CODEP = '75'                                             
  "              MOVE '754'        TO W-LIB-DIR                                 
018840        END-IF                                                            
              MOVE XB40-CTYGC  TO W-LIB-CTYGC                                   
              MOVE XB40-DNUCOL TO W-LIB-DNUCOL                                  
              MOVE W-LIB-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB37                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
020452        ELSE                                                              
  "   *  ALIMENTATION DU 3EME OCCURS : LIBELLE EPCI                             
  "              MOVE XB37 TO XB50-AENR (3)                                     
  "   *  ALIMENTATION ADRESSE MEL EPCI                                          
  "              MOVE XB37-VMAILG     TO XB50-VMAILG                            
020452           MOVE XB37-VMAILD     TO XB50-VMAILD                            
              END-IF                                                            
                 .                                                              
      *                                                                         
      *  RECHERCHE DES ARTICLES LIBELLES TSE ET PREPARATION DU RESULTAT         
       RECH-LIB.                                                                
018639*  ALIMENTATION DU 3EME OCCURS : LIBELLE EPCI                             
020452*       MOVE XB37 TO XB50-AENR (3)                                        
018639*  ALIMENTATION ADRESSE MEL EPCI                                          
020452*       MOVE XB37-VMAILG     TO XB50-VMAILG                               
020452*       MOVE XB37-VMAILD     TO XB50-VMAILD                               
      *  RECHERCHE DU LIBELLE TSE                                               
018639        INITIALIZE XB36                                                   
              MOVE FIE01-JANIPT TO W-LIB-AN                                     
              MOVE FIE01-ACODIR TO W-LIB-DIR                                    
              IF FIE01-CODEP = '75'                                             
                 MOVE '754'        TO W-LIB-DIR                                 
              END-IF                                                            
              MOVE XB45-ACOETS (1) TO W-LIB-CLE1                                
              MOVE W-LIB-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB36                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-IF                                                            
018639*  ALIMENTATION DU 1ER OCCURS : TSE                                       
018639        MOVE XB36 TO XB50-AENR (1)                                        
      *  RECHERCHE DU LIBELLE TSEGP, TSEMA, TSEGA                               
018639        INITIALIZE XB36                                                   
              MOVE FIE01-JANIPT TO W-LIB-AN                                     
              MOVE FIE01-ACODIR TO W-LIB-DIR                                    
              IF FIE01-CODEP = '75'                                             
                 MOVE '754'        TO W-LIB-DIR                                 
              END-IF                                                            
              MOVE XB45-ACOETS (2) TO W-LIB-CLE1                                
              MOVE W-LIB-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB36                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              END-IF                                                            
018639*  ALIMENTATION DU 2EME OCCURS : TSEGP, TSEMA, TSEGA                      
018639        MOVE XB36 TO XB50-AENR (2)                                        
                 .                                                              
      *                                                                         
      *  RECHERCHE DE L'ARTICLE LIBELLE TEOM DANS LA BASE TAUX                  
       RECH-LTEOM.                                                              
              MOVE FIE01-JANIPT TO W-LIB-AN                                     
              MOVE FIE01-ACODIR TO W-LIB-DIR                                    
              MOVE XB40-CTYSYN TO W-LIB-CTYGC                                   
              MOVE XB40-CCOSYN TO W-LIB-DNUCOL                                  
              MOVE W-LIB-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB38                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
019828        ELSE                                                              
020452*            MOVE XB38    TO XB51                                         
020452             MOVE XB38    TO XB51-AENR(1)                                 
              END-IF                                                            
                .                                                               
      *                                                                         
020452*  RECHERCHE DE L'ARTICLE LIBELLE TANB DANS LA BASE TAUX                  
020452 RECH-LTANB.                                                              
              INITIALIZE XB37                                                   
              MOVE FIE01-JANIPT TO W-LIB-AN                                     
              MOVE FIE01-ACODIR TO W-LIB-DIR                                    
              IF FIE01-CODEP = '75'                                             
                 MOVE '754'        TO W-LIB-DIR                                 
              END-IF                                                            
              MOVE XB40-CTYTXA TO W-LIB-CTYGC                                   
              MOVE XB40-CCOTXA TO W-LIB-DNUCOL                                  
              MOVE W-LIB-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB37                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
              ELSE                                                              
                   MOVE XB37    TO XB51-AENR(2)                                 
              END-IF                                                            
                .                                                               
      *                                                                         
      *  RECHERCHE DE L'ARTICLE LIBELLES SYNDICATS DANS LA BASE TAUX            
       RECH-LSYN.                                                               
018639        MOVE FIE01-ACODIR TO W-TAU-DIR                                    
019128        MOVE 'Z  '        TO W-TAU-IFP                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB47                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                   MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                    
019828*       ELSE                                                              
019828*            MOVE XB47    TO XB51                                         
              END-IF                                                            
                .                                                               
      *                                                                         
018639*  RECHERCHE DE L'ARTICLE ADRESSE MEL COMMUNE DANS LA BASE TAUX           
018639 RECH-LMEL.                                                               
              MOVE FIE01-ACODIR TO W-TAU-DIR                                    
019128        MOVE 'Y  '        TO W-TAU-IFP                                    
              MOVE W-TAU-CLE TO SSAQ-CLE                                        
              CALL 'CBLTDLI' USING GU  PCB-COM XB41                             
                       SSAQ-GEN                                                 
              IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                        
                  MOVE  16  TO  CR    MOVE DLI-RETOUR TO RC                     
              ELSE                                                              
                  MOVE XB41-VMAILG TO XB51-VMAILG                               
                  MOVE XB41-VMAILD TO XB51-VMAILD                               
              END-IF                                                            
                .                                                               
016935*                                                                         
  "   *  RECHERCHE DE LA DIRECTION A LAQUELLE EST RATTACHEE LA COMMUNE          
  "    PELP-COM.                                                                
  "           IF FIE01-CODEP = '75'                                             
  "              SET DEPT-DIR-N5   TO TRUE                                      
  "              SET DEPT-DIR-X5   TO TRUE                                      
  "           ELSE                                                              
  "              SET DEPT-DIR-N2   TO TRUE                                      
  "              SET DEPT-DIR-X2   TO TRUE                                      
  "           END-IF                                                            
  "           SET NOTOK            TO TRUE                                      
  "   *--- BOUCLE DE RECHERCHE SUR TOUTES LES DIRECTIONS ASSOCIEES AU           
  "   *--- AU DEPARTEMENT                                                       
  "           MOVE DEPT-DIR-MIN    TO IND-DIR                                   
  "           MOVE FIE01-JANIPT    TO W-TAU-AN                                  
  "           MOVE FIE01-ACODIR    TO W-TAU-DIR                                 
  "           MOVE IND-DIR         TO W-TAU-DIR(3:1)                            
  "           MOVE FIE01-CCOCOM    TO W-TAU-COM                                 
019128        MOVE SPACE           TO W-TAU-IFP                                 
  "           PERFORM UNTIL     IND-DIR > DEPT-DIR-MAX OR                       
  "                             OK                                              
  "               MOVE W-TAU-CLE   TO SSAQ-CLE                                  
  "               CALL 'CBLTDLI' USING GU  PCB-COM XB40                         
  "                    SSAQ-GEN                                                 
  "               IF (DLI-RETOUR NOT = SPACE AND NOT = 'GE')                    
  "                  MOVE  16          TO CR                                    
  "                  MOVE DLI-RETOUR   TO RC                                    
  "                  SET OK            TO TRUE                                  
  "               ELSE                                                          
  "                  IF DLI-RETOUR = 'GE'                                       
  "                     ADD 1          TO IND-DIR                               
  "                     MOVE IND-DIR   TO W-TAU-DIR(3:1)                        
  "                  ELSE                                                       
  "                     SET OK         TO TRUE                                  
  "                     MOVE W-TAU-DIR TO FIE01-ACODIR                          
  "                     INITIALIZE    XB40 W-TAU-CLE                            
  "                  END-IF                                                     
  "               END-IF                                                        
  "           END-PERFORM                                                       
016935          .                                                               
