      *-----------------------------------------------------------              
      *    NOM EXTERNE                :  XBALL                                  
      *    CODE                       :  XB                                                  
      *-----------------------------------------------------------              
001940        10          'X'-AIDFIC.                                       
      *                             /IDENTIFIANT DU FICHIER               
001950         15         'X'-JAN PICTURE 9(4).                             
      *                             /ANNEE                                
001960         15         'X'-DEPDIR.                                       
      *                             /zone groupe (dept + dir)             
001970          20        'X'-CODEP PICTURE X(2).                           
      *                             /code departement                     
001980          20        'X'-CODIR PICTURE X(1).                           
      *                             /code direction                       
001990         15         'X'-CCOCOM PICTURE X(3).                          
      *                             /CODE COMMUNE MAJIC2                  
002000         15         'X'-CCOIFP PICTURE X(3).                          
      *                             /CODE commune absorbee                
002010        10          'X'-ADTSEG.                                       
      *                             /DONNEES DU SEGMENT                   
002020         15         'X'-CCOENR PICTURE X(2).                          
      *                             /CODE ENREGISTREMENT                  
002030         15         'X'-LIGBENEFOM PICTURE 9(2).                      
      *                             /code collectivite beneficiaire om    
      *                             /                           PAC:CCOBOM
002040         15         'X'-TPBASY.                                       
      *                             /table repartition produits syndicats 
002050          20        'X'-PBASY1 PICTURE 9(3)V9(2)                      
002060                         OCCURS 010.                                  
      *                             /elt repartition produits syndicat    
002070         15         'X'-TPNBSY.                                       
      *                             /table repartition produits syndicats 
002080          20        'X'-PNBPSY PICTURE 9(3)V9(2)                      
002090                         OCCURS 010.                                  
      *                             /elt repartition produits syndicat    
002100         15         'X'-TPOMSY.                                       
      *                             /table repartition produits syndicats 
002110          20        'X'-POMSY1 PICTURE 9(3)V9(2)                      
002120                         OCCURS 010.                                  
      *                             /elt repartition produits syndicat    
002130         15         'X'-TAUCOM-B PICTURE 9(4)V9(6).                   
      *                             /TAUX BATI COMMUNAL                   
      *                             /                           PAC:PTBCOM
002140         15         'X'-TAUSYNDSFP-B PICTURE 9(4)V9(6).               
      *                             /taux bati syndicat                   
      *                             /                           PAC:PTBSYN
002150         15         'X'-TAUCUDFPVN-B PICTURE 9(4)V9(6).               
      *                             /taux bati groupement de commune      
      *                             /                           PAC:PTBCU 
002160         15         'X'-TAUTSE-B PICTURE 9(4)V9(6).                   
      *                             /taux bati taxe speciale d'equipement 
      *                             /                           PAC:PTBTSE
002170         15         'X'-PNBTXA PICTURE 9(4)V9(6).                     
      *                             /taux de taxe additionnellle          
002180         15         'X'-TAUCOM-NB PICTURE 9(4)V9(6).                  
      *                             /TAUX NB COMMUNE                      
      *                             /                           PAC:PNBCOM
002190         15         'X'-TAUSYNDSFP-NB PICTURE 9(4)V9(6).              
      *                             /TAUX NB SYNDICAT                     
      *                             /                           PAC:PNBSYN
002200         15         'X'-TAUCUDFPVN-NB PICTURE 9(4)V9(6).              
      *                             /TAUX NB COMMUNAUTE URBAINE           
      *                             /                           PAC:PNBCU 
002210         15         'X'-TAUTSE-NB PICTURE 9(4)V9(6).                  
      *                             /TAUX NB TSE sauf ILE DE FRANCE       
      *                             /                           PAC:PNBTSE
002220         15         'X'-PNBCAA PICTURE 9(4)V9(6).                     
      *                             /TAUX NB C.A.A.A.                     
002230         15         'X'-CCOEXC PICTURE X(2).                          
      *                             /code exclusion                       
002240         15         'X'-GIMOMI PICTURE X(1).                          
      *                             /Indicateur de taxation TEOMI         
002250         15         'X'-CCOBIM PICTURE 9(2).                          
      *                             /Code collectivite beneficiaire TEOMI 
002260         15         'X'-PTBGEM PICTURE 9(4)V9(6).                     
      *                             /TAUX BATI GEMAPI                     
002270         15         'X'-PNBGEM PICTURE 9(4)V9(6).                     
      *                             /TAUX NON BATI GEMAPI                 
002280         15         'X'-FILLER PICTURE X(50).                         
002290         15         'X'-ACOETS PICTURE X(4)                           
002300                         OCCURS 002.                                  
      *                             /CODE ORGANISME BENEFICIAIRE TSE      
002310         15         'X'-DNUTSE PICTURE 9(2)                           
002320                         OCCURS 002.                                  
      *                             /Num{ro de poste TSE nouvelle         
002330         15         'X'-TOTOFR PICTURE X.                             
      *                             /TOP FRAIS REDUIT OM                  
002340         15         'X'-FILLER PICTURE X(20).                         
002350         15         'X'-CCDDIR.                                       
      *                             /CODE DIRECTION                       
002360          20        'X'-CO2DEP PICTURE X(2).                          
      *                             /CODE DEPARTEMENT                     
002370          20        'X'-CCODIR PICTURE X(1).                          
      *                             /CODE DIRECTION                       
002380         15         'X'-PTBTGP PICTURE 9(4)V9(6).                     
      *                             /TAUX TSE GP MA GA bati               
002390         15         'X'-PNBTGP PICTURE 9(4)V9(6).                     
      *                             /TAUX TSE GRAND PARIS NON-BATI        
002400         15         'X'-DNUURC PICTURE X(2).                          
      *                             /NUM UNITE REGROUPEMENT CDIF ( UR )   
