      *-----------------------------------------------------------              
      *    ENTETE DU TAUDIS - CLEFS D'APPEL POUR LES COLLOCS                    
      *                                                                         
      *    ANNEE 2020                                                           
      *                                                                         
      *-----------------------------------------------------------              
             03 TAUDIS-ENTETE.                                              
      * DIRECTION                                                               
               10 'X'-CLETX.                                                
                 15 'X'-DEPDIR.                                             
0001               20 'X'-CODEP       PIC X(2).                             
0003               20 'X'-CODIR       PIC X.                                
      * COMMUNE IFP TRESORERIE                                                  
                 15 'X'-CLETX1.                                             
0004               20 'X'-CCOCOM      PIC X(3).                             
0007               20 'X'-CCOIFP      PIC X(3).                             
0010               20 'X'-CCPPER      PIC X(3).                             
      * EPCI                                                                    
                 15 'X'-CLETX2 REDEFINES      'X'-CLETX1.                   
0004               20 'X'-CTYGC       PIC X.                                
0005               20 'X'-CCOGC       PIC X(3).                             
0008               20 'X'-FILLER      PIC X(5).                             
      * ETABLISSEMENT TSE                                                       
                 15 'X'-CLETX3 REDEFINES      'X'-CLETX1.                   
0004               20 'X'-CTYETS      PIC X.                                
0005               20 'X'-GCOET1      PIC 9(3).                             
0008               20 'X'-FILLER      PIC X(5).                             
      * DIRECTION COMMUNE                                                       
               10 'X'-CLETX4 REDEFINES      'X'-CLETX.                      
0001             15 'X'-DIRCOM        PIC X(6).                             
0007             15 'X'-FILLER        PIC X(6).                             
