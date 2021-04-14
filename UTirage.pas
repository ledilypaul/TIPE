UNIT UTirage;

	INTERFACE 
	
	USES UStructures,UEquipes,UPointeurs,UAffichage,UFonctions,UBackTracking;
	
	PROCEDURE Tirage (VAR c1 : chapeau; VAR c2 : chapeau; i : INTEGER; VAR ptrTab : listeAdv;VAR Blacklist : listeAdv; VAR t : tirage);
	PROCEDURE Simulation (VAR c1 : chapeau; VAR c2 : chapeau; VAR ptrTab : listeAdv;VAR Blacklist : listeAdv; VAR r: resultat);


	IMPLEMENTATION
	
	PROCEDURE ecrireTirage (t : tirage);
	VAR fic : TEXT;
	    i : INTEGER;
	BEGIN
		{$i-}
		assign(fic, 'Resultat.txt');
		append(fic);
		writeln(fic,'');
		FOR i := 1 to 8 DO 
			writeln(fic,t[i].e2.nom,'-',t[i].e1.nom);
			

		close(fic);
	END;


	PROCEDURE initListe (ptrTab : listeAdv);
	VAR i : INTEGER;
	BEGIN
		FOR i:= 1 TO 8 DO 
			ptrTab[i] := Nil;
	END;

	PROCEDURE Tirage (VAR c1 : chapeau; VAR c2 : chapeau; i : INTEGER; VAR ptrTab : listeAdv;VAR Blacklist : listeAdv; VAR t : tirage);
	VAR j : INTEGER;
		flag:BOOLEAN;
	BEGIN
		initListe(ptrTab);
		initListe(Blacklist);
		j := 1;
		flag := FALSE;
		WHILE (j>0)AND(j <= 8) DO BEGIN
			writeln('Match ',j);
			j:= Match(c1,c2,j,ptrTab,Blacklist,t,flag) +1;
		END;
		//ecrireTirage(t);
	END;
	
	//Réalise un certain nombre de tirage pour pouvoir ensuite établir des probabilités. Celles ci seront effetués à l'aide d'un script bash  
	PROCEDURE Simulation (VAR c1 : chapeau; VAR c2 : chapeau; VAR ptrTab : listeAdv;VAR Blacklist : listeAdv; VAR r: resultat);
	VAR i : INTEGER;
	BEGIN
		FOR i := 1 TO 100 DO 
			initChapeaux(c1,c2);
			Tirage(c1,c2,i,ptrTab,Blacklist,r[i]);
			afficherTirage(r[i]);
	END;
	
	
END.
