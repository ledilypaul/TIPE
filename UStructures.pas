UNIT UStructures;

	INTERFACE 
	
TYPE equipe = RECORD 
		nom : STRING; // nom de l'équipe
		grp : CHAR;	// lettre du groupe de poule 
		rg : INTEGER; // place de l'équipe dans son groupe 1er ou 2ème symbolisé par 1 ou 2
		pays : STRING; // pays d'origine de l'équipe 
	END;
	
	ptrNoeud = ^noeud;
	
	noeud  = RECORD 
		eq : equipe;
		suivant : ptrNoeud;
	END;
	
	match = RECORD
		e1,e2 : equipe;
	END;
	
	chapeau = ARRAY [1..8] OF equipe; // tableau satique désignant les deux chapeaux 
	tirage = ARRAY[1..8]OF match;
	listeAdv = ARRAY[1..8] OF ptrNoeud; // contient les listes des adv pour le backtrcking. Chaque case est une tête de liste
										// permettra la gestion des adversaires impossibles
	resultat = ARRAY [1..100]OF tirage;
	AdvPoss = ARRAY [1..8] OF ptrNoeud; // Structure pour verifier les match à la fin; Composition tete de chaque liste --> Equipe du chapeau2 et reste --> adv de c1
	IMPLEMENTATION
	
	END.
