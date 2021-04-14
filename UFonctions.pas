UNIT UFonctions;

	INTERFACE 
	
	USES UStructures, UEquipes,UPointeurs,UAffichage;
	
	FUNCTION listeAdvPossible (c1,c2 : chapeau) : AdvPoss;
	FUNCTION selectionDeLEquipeDuC2(VAR c2:chapeau):equipe;
	FUNCTION eltAppartientALaListe(equ : equipe ; tete : ptrNoeud) : BOOLEAN;
	FUNCTION matchPossible (e1,e2 : equipe): BOOLEAN;
	PROCEDURE creerAdv(eSelec: equipe; teteBlacklist : ptrNoeud; VAR teteAdv : ptrNoeud; VAR c1 : chapeau);
	PROCEDURE effacerEquipe(e :equipe; VAR c : chapeau);
	PROCEDURE rajouterEquipe (VAR c : chapeau; eq : equipe);


	IMPLEMENTATION 
	
	//determine la liste des adv possible des equipes du chapeau 2 dans le chapeau 1
	FUNCTION listeAdvPossible (c1,c2 : chapeau) : AdvPoss;
	VAR i,j : INTEGER;
		t : AdvPoss;
	BEGIN
		FOR i := 1 TO 8 DO BEGIN
			t[i] := creerNoeud(copierEq(c2[i])); // tete = equipe du c2
			afficherListe(t[i]);
			FOR j:= 1 TO 8 DO BEGIN
				IF matchPossible(c2[i],c1[j]) THEN ajouterDebut(c1[j],t[i]);
			END;
			writeln('liste de ',t[i]^.eq.nom);
			afficherListe(t[i]);
			writeln;
		END;
		listeAdvPossible := t;
	END;
	
	//Choix d'une équipe du chapeau 2
	FUNCTION selectionDeLEquipeDuC2(VAR c2:chapeau):equipe;
	VAR i : INTEGER;
	BEGIN
		Randomize;
		i := Random(8)+1;
		WHILE c2[i].nom = 'V' DO i:= Random(8)+1;
		selectionDeLEquipeDuC2 := copierEq(c2[i]);
	END;
	
	//détermine si e1 peut affronter e2 avec les conditions basiques
	FUNCTION matchPossible (e1,e2 : equipe): BOOLEAN;
	BEGIN
		IF ((e1.nom = 'V') OR (e2.nom = 'V')) THEN matchPossible := FALSE // pour prévenir le choix dans l'avancement du tirage  
		ELSE
			IF e1.pays <> e2.pays THEN 
				IF e1.grp <> e2.grp THEN 
					IF e1.rg <> e2.rg THEN 
						IF e1.nom <> e2.nom THEN matchPossible := TRUE
						ELSE matchPossible := FALSE
					ELSE matchPossible := FALSE 
				ELSE matchPossible := FALSE
			ELSE matchPossible := FALSE;
	END;

// verifie si une equipe est dans la blacklist
	FUNCTION eltAppartientALaListe(equ : equipe ; tete : ptrNoeud) : BOOLEAN;
	VAR bool : BOOLEAN;
		tmp : ptrNoeud;
	BEGIN
		//si ma liste est vide alors appartient pas
		IF (tete = Nil) THEN eltAppartientALaListe := FALSE
		ELSE BEGIN
			bool := FALSE; // on suppose que l'équipe en question n'appartient pas à la liste 
			tmp := tete;
			WHILE (tmp <> Nil) DO BEGIN
				//on verifie si l'element en parametre match avec l'element actuelle
				IF tmp^.eq.nom = equ.nom THEN BEGIN
					bool := TRUE; // si elle appartient on passe à true
				END;
					tmp := tmp^.suivant;
			END;
			eltAppartientALaListe := bool;
		END;
	END;
	
//établi la liste des adversaires possibles poutr chaque tirage
	PROCEDURE creerAdv(eSelec: equipe; teteBlacklist : ptrNoeud; VAR teteAdv : ptrNoeud; VAR c1 : chapeau);
	VAR i : INTEGER;
	BEGIN
		FOR i := 1 TO 8  DO BEGIN
			//si on est dans une case "vide" alors on passe à la suivante 
			IF (c1[i].nom <> 'V') THEN
				IF (NOT eltAppartientALaListe(c1[i],teteBlacklist)) THEN 
					IF matchPossible(eSelec,c1[i]) THEN ajouterDebut(copierEq(c1[i]),teteAdv);
		END;
	END;
		
	//efface une équipe du chapeau de départ pour ne pas le tirer 2 fois
	PROCEDURE effacerEquipe(e :equipe; VAR c : chapeau);
	VAR i : INTEGER;
		evide : equipe;
	BEGIN
		initEVide(evide);
		FOR i := 1 TO 8 DO 
			IF (c[i].nom = e.nom) THEN c[i] := evide;
	END;
	
	//rajoute une equipe au chapeau donné
	PROCEDURE rajouterEquipe (VAR c : chapeau; eq : equipe);
	VAR i : INTEGER;
	BEGIN
		i := 1;
		WHILE ( i <= 8 ) AND (c[i].nom <> 'V') DO Inc(i);
		c[i] := copierEq(eq);
	END;
END.
