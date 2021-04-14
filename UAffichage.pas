UNIT UAffichage;

	INTERFACE 
	
	USES UStructures,UEquipes,UPointeurs;
	
	PROCEDURE afficherTirage (t :tirage);
	PROCEDURE afficherChapeau(c : chapeau);


	IMPLEMENTATION
	
	PROCEDURE afficherTirage (t :tirage);
	VAR i : INTEGER;
	BEGIN
		FOR i := 1 TO 8 DO 
		writeln(t[i].e1.nom,' vs ',t[i].e2.nom);
	END; 

	PROCEDURE afficherChapeau(c : chapeau);
	VAR i : INTEGER;
	BEGIN
		for i := 1 TO 8 DO writeln(c[i].nom);
	END;
END.
