UNIT UPointeurs;

	INTERFACE 

	USES UStructures,UEquipes;
	
	FUNCTION creerNoeud(e:equipe):ptrNoeud;
	FUNCTION longueur (tete : ptrNoeud): INTEGER;
	PROCEDURE afficherListe (tete : ptrNoeud);
	FUNCTION parcourirListe (n : INTEGER ;tete : ptrNoeud): ptrNoeud;
	PROCEDURE ajouterDebut (equ : equipe ; VAR tete : ptrNoeud); 
	PROCEDURE supprimerDebut(VAR tete : ptrNoeud);
	PROCEDURE supprimerFin(VAR tete : ptrNoeud);
	FUNCTION supprimerListe(VAR tete : ptrNoeud):ptrNoeud;

	IMPLEMENTATION
	
	FUNCTION creerNoeud(e:equipe):ptrNoeud;
	VAR nv: ptrNoeud;
	BEGIN
		new(nv);
		nv^.eq.nom := e.nom;
		nv^.eq.rg := e.rg;
		nv^.eq.grp := e.grp;
		nv^.eq.pays := e.pays;
		nv^.suivant := Nil; 
		creerNoeud := nv;
	END;
	
	PROCEDURE afficherListe (tete : ptrNoeud);
	VAR tmp : ptrNoeud;
		i : INTEGER;
	BEGIN
		IF tete = Nil THEN writeln('Liste vide')
		ELSE BEGIN
			i := 1;
			tmp := tete;
			WHILE (tmp <> Nil) DO BEGIN
				writeln('element ', i,': ',tmp^.eq.nom);
				tmp := tmp^.suivant;
				Inc(i);
			END;
			writeln;
		END;
	END;
	
	FUNCTION longueur (tete : ptrNoeud): INTEGER;
	VAR n : INTEGER;
		tmp : ptrNoeud;
	BEGIN
		n := 0;
		tmp := tete;
		WHILE (tmp <> Nil) DO BEGIN
			Inc(n);
			tmp := tmp^.suivant; 
		END;
		longueur := n;
	END;

	//renvoi le nieme element de la liste
	FUNCTION parcourirListe (n : INTEGER ;tete : ptrNoeud): ptrNoeud;
	VAR tmp : ptrNoeud;
	BEGIN
		tmp := tete;
		WHILE (tmp <> nil) AND (n > 1) DO BEGIN
			tmp := tmp^.suivant;
			Dec(n);
		END;
		parcourirListe := tmp;
	END;

	PROCEDURE ajouterDebut (equ : equipe ; VAR tete : ptrNoeud); // besoin de l'addresse du premier élément 
	VAR nd : ptrNoeud;
	BEGIN
		nd := creerNoeud(equ);
		nd^.suivant := tete;
		tete := nd;
	END;
		
	PROCEDURE supprimerDebut(VAR tete : ptrNoeud);
	VAR ptr_supp : ptrNoeud;
	BEGIN
		IF tete^.suivant = Nil THEN BEGIN
			dispose(tete);
			tete:= NIL;
		END
		ELSE
			ptr_supp := tete;
			tete := ptr_supp^.suivant;
			dispose(ptr_supp);
		END;
	
	PROCEDURE supprimerFin(VAR tete : ptrNoeud);
	VAR tmp:ptrNoeud;
		ptr_supp : ptrNoeud;
	BEGIN
		IF tete = Nil THEN  BEGIN
			dispose(tete);
			tete:= NIL;
		END
		ELSE BEGIN
			tmp := tete;
			WHILE (tmp^.suivant^.suivant <> Nil) DO 
				tmp := tmp^.suivant;
			ptr_supp := tmp^.suivant;
			tmp^.suivant := Nil;
			dispose(ptr_supp);
		END;
	END;
		
	//problème rencontré : les éléments des deux listes ont les même adresses donc en supprimant une liste on perd l'autre
	FUNCTION supprimerListe(VAR tete : ptrNoeud):ptrNoeud;
	VAR ptr_supp : ptrNoeud;
	BEGIN
		IF tete = Nil THEN supprimerListe := Nil
		ELSE BEGIN 
			IF tete^.suivant = Nil THEN BEGIN //si liste à un élément
				ptr_supp := tete;
				tete := ptr_supp^.suivant;
				dispose(ptr_supp);
			END
			ELSE BEGIN // liste à plus de 1 élément donc boucle de suppression
				WHILE (tete <> Nil) DO BEGIN
					writeln('enter');
					ptr_supp := tete;
					tete := ptr_supp^.suivant;
					dispose(ptr_supp);
				END;
			END;
			supprimerListe:= Nil;
		END;
	END;
END.
