Contenu

Le code source de la calculette des taxes foncières est produit par la Direction Générale des Finances 
Publiques (DGFiP).

Ce code source est développé sous licence CeCILL 2.1 soumise au droit français et respectant les 
principes de diffusion des logiciels libres.
Ce code source est publié avec le statut "publié" du guide Etalab d'ouverture des codes sources publics 
(cf https://github.com/etalab/ouverture-des-codes-sources-publics).Les contributions extérieures ne 
seront donc pas traitées.

Les fichiers constituant le code source de la calculette des taxes Foncières sont écrits en cobol. 
Il y a deux types de fichiers : 
	- Les programmes cobol (avec une extension en .cob) 
	- Les copys cobol (avec une extensions .cpy) 

La culculette TF est en fait un ensemble de sous-programmes appelés pour tous les articles de 
la taxation.

Les programmes CTXTA3B.cob et CTXTA3N.cob constituent les points d'entrée dans les différentes 
calculettes millésimées. CTXTA3B.cob pour les calculettes des Taxes foncières bâties, CTXTA3N.cob pour 
les calculettes des taxes foncières non bâties. 

Ici, seules les calculettes des millésimes 2020, 2021, 2022 et 2023 sont fournies : 

	Calculettes des taxes foncières bâties :	- EFITA3Bx.cob
	
	Calculettes des taxes foncières non bâties :	- EFITA3Nx.cob
	
avec x = unité du millésime (0 pour 2020, 1 pour 2021, 2 pour 2022)

Les programmes EFITAUX2.cob et FMSTAUX2.cob sont des sous-programmes d'accès aux taux d'imposition 
appellés par les calculettes bâties (EFITA3Bx.cob) et non bâties (EFITA3Nx.cob).

Les copys cobol fournis sont utilisés dans les différents programmes cobol :  
	- Les Copys Tx00, Tx4C, Tx4D, Tx4G et Tx4R décrivent les enregistrements d'un fichier contenant 
           entre autres, les taux d'imposition de la TF, avec x = unité du millésime (0 pour 2020, 
           1 pour 2021, 2 pour 2022).
	- Lex Copys XBASEB, XBASENB, XBXTDAN, XBXTDCOM, XBXTDDIR, XBXTDSR, XCOMBAT, XCOMNBA, XCOTB, 
           XCOTNB, XRETB, XRETNB décrivent les zones d'entrée sortie des sous-programmes de 
           la calculette de la taxe foncière.