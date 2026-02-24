      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  XBALL                                  
      *    CODE                       :  XB                                     
      *-----------------------------------------------------------              
000150        10          'X'-AIDFIC.                                       
      *                             /IDENTIFIANT DU FICHIER               
000160         15         'X'-JAN PICTURE 9(4).                             
      *                             /ANNEE                                
000170         15         'X'-DEPDIR.                                       
      *                             /zone groupe (dept + dir)             
000180          20        'X'-CODEP PICTURE X(2).                           
      *                             /code departement                     
000190          20        'X'-CODIR PICTURE X(1).                           
      *                             /code direction                       
000200         15         'X'-CCOCOM PICTURE X(3).                          
      *                             /CODE COMMUNE MAJIC2                  
000210         15         'X'-CCOIFP PICTURE X(3).                          
      *                             /CODE commune absorbee                
000220        10          'X'-ADTSEG.                                       
      *                             /DONNEES DU SEGMENT                   
000230         15         'X'-CCOENR PICTURE X(2).                          
      *                             /CODE ENREGISTREMENT                  
000240         15         'X'-XDDAY6 PICTURE X(6).                          
      *                             /DATE DU JOUR SUR 6 CARACTERES        
000250         15         'X'-TAUDEP-B PICTURE 9(4)V9(6).                   
      *                             /taux bati departement                
      *                             /                           PAC:PTBDEP
000260         15         'X'-TAUREG-B PICTURE 9(4)V9(6).                   
      *                             /taux bati region                     
      *                             /                           PAC:PTBREG
000270         15         'X'-PTBTAS PICTURE 9(4)V9(6).                     
      *                             /taux bati TASA                       
000280         15         'X'-TAUDEP-NB PICTURE 9(4)V9(6).                  
      *                             /TAUX NB DEPARTEMENT                  
      *                             /                           PAC:PNBDEP
000290         15         'X'-TAUREG-NB PICTURE 9(4)V9(6).                  
      *                             /TAUX NB REGION et TSE IDF            
      *                             /                           PAC:PNBREG
000300         15         'X'-TAUCHAGR-NB PICTURE 9(4)V9(6).                
      *                             /TAUX NB CHAMBRE AGRICULTURE          
      *                             /                           PAC:PNBAGR
000310         15         'X'-TAUBAP405-NB PICTURE 9(2)V9(2).               
      *                             /TAUX BAPSA NON AGRICOLE (4,05)       
      *                             /                           PAC:PNBBAP
000320         15         'X'-TAUSMAGR-NB PICTURE 9(4)V9(6).                
      *                             /taux chambre agriculture communal    
      *                             /                           PAC:PNBAGN
000330         15         'X'-JDEJA                                         
000340                         OCCURS 005.                                  
      *                             /zone groupe ja (JDEINS+JDERIM)       
000350          20        'X'-JDEINS PICTURE 9(4).                          
      *                             /ANNEE INSTALLATION JA DEPARTEMENT    
000360          20        'X'-JDERIM PICTURE 9(4).                          
      *                             /ANNEE RETOUR IMPOSITION DEPARTEMENT  
000370         15         'X'-FILLER PICTURE X(9).                          
000380         15         'X'-ACOETS PICTURE X(4)                           
000390                         OCCURS 005.                                  
      *                             /CODE ORGANISME BENEFICIAIRE TSE      
000400         15         'X'-NBTSE PICTURE 9(2).                           
      *                             /NOMBRE DE TSE SUR LA DSF             
000410         15         'X'-PTBDRB PICTURE 9(4)V9(6).                     
      *                             /taux bati dept rebase                
000420         15         'X'-DSITAS PICTURE X(14).                         
      *                             /NUMERO SIRET REG BENEFICIAIRE TASA   
000430         15         'X'-GROTAS PICTURE X(1).                          
      *                             /OPTION COPIE ROLE TASA               
000440         15         'X'-DSIRED.                                       
      *                             /NUMERO SIRET DIRECTION               
000450          20        'X'-DSRNDR PICTURE X(9).                          
      *                             /SIREN Direction                      
000460          20        'X'-FILLER PICTURE X(5).                          
000470         15         'X'-DSICA.                                        
      *                             /NUMERO SIRET Ch Agr                  
000480          20        'X'-DSRNCA PICTURE X(9).                          
      *                             /SIREN Ch Agr                         
000490          20        'X'-FILLER PICTURE X(5).                          
000500         15         'X'-DSIRMP.                                       
      *                             /SIRET METROPOLE GRAND PARIS          
000510          20        'X'-DSRNMP PICTURE X(9).                          
      *                             /SIREN METROPOLE GRAND PARIS          
000520          20        'X'-FILLER PICTURE X(5).                          
000530         15         'X'-FILLER PICTURE X(165).                        
000540         15         'X'-DNUURC PICTURE X(2).                          
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )   
