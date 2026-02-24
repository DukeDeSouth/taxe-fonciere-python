      *-----------------------------------------------------------*             
      *    ENTETE DU TAUDIS - CLEFS D'APPEL POUR LES COLLOCS      *             
      *                                                           *             
      *    ANNEE 2022                                             *             
      *                                                           *             
      *-----------------------------------------------------------*             
             03 TAUDIS-ENTETE.                                          T800    
      * DIRECTION                                                               
               10 'X'-CLETX.                                            T800    
                 15 'X'-DEPDIR.                                         T800    
0001               20 'X'-CODEP       PIC X(2).                         T800    
0003               20 'X'-CODIR       PIC X.                            T800    
      * COMMUNE IFP TRESORERIE                                                  
                 15 'X'-CLETX1.                                         T800    
0004               20 'X'-CCOCOM      PIC X(3).                         T800    
0007               20 'X'-CCOIFP      PIC X(3).                         T800    
0010               20 'X'-CCPPER      PIC X(3).                         T800    
      * EPCI                                                                    
                 15 'X'-CLETX2 REDEFINES      'X'-CLETX1.               T800    
0004               20 'X'-CTYGC       PIC X.                            T800    
0005               20 'X'-CCOGC       PIC X(3).                         T800    
0008               20 'X'-FILLER      PIC X(5).                         T800    
      * ETABLISSEMENT TSE                                                       
                 15 'X'-CLETX3 REDEFINES      'X'-CLETX1.               T800    
0004               20 'X'-CTYETS      PIC X.                            T800    
0005               20 'X'-GCOET1      PIC 9(3).                         T800    
0008               20 'X'-FILLER      PIC X(5).                         T800    
      * DIRECTION COMMUNE                                                       
               10 'X'-CLETX4 REDEFINES      'X'-CLETX.                  T800    
0001             15 'X'-DIRCOM        PIC X(6).                         T800    
0007             15 'X'-FILLER        PIC X(6).                         T800    
