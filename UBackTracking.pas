UNIT UBackTracking;

	INTERFACE 
	
	USES UStructures,UEquipes,UPointeurs,UAffichage,UFonctions;

	FUNCTION Match (VAR c1 : chapeau; VAR c2 : chapeau; i : INTEGER; VAR ptrTab : listeAdv; VAR Blacklist : listeAdv; VAR t : tirage; VAR flag:BOOLEAN): INTEGER;
	PROCEDURE BackTracking(VAR c1 : chapeau;VAR c2 : chapeau;VAR ptrTab : listeAdv; i : INTEGER; VAR Blacklist : listeAdv; VAR t : tirage);

	IMPLEMENTATION


{	* Procedure de retour sur trace pour régler les conflits
	* 
	* c1,c2 les chapeaux d'équipes
	* i le numéro du tour où on doit régler le problème. Autrement dit ce sera i-1 car si titage imposssible au tour i alors problème au tour i-1
	* prtTab le tableau des liste d'adversaire pour chaque tirage
	* Blacklist la liste des equipes qui mènent à des tirages impossibles 
	* t le tableau des rencontres
}

	PROCEDURE BackTracking(VAR c1 : chapeau;VAR c2 : chapeau;VAR  ptrTab : listeAdv; i : INTEGER; VAR Blacklist : listeAdv; VAR t : tirage); 
	BEGIN
		writeln('Entrez dans Backtracking');
		ajouterDebut(t[i-1].e1,Blacklist[i-1]);
		IF @Blacklist[i-1]^.eq = @ptrTab[i-1]^.eq THEN writeln('meme adresse'); 
		rajouterEquipe(c1,t[i-1].e1);
		writeln('Fin de backtracking');
	END;


	FUNCTION Match (VAR c1 : chapeau; VAR c2 : chapeau; i : INTEGER; VAR ptrTab : listeAdv;VAR Blacklist : listeAdv; VAR t : tirage; VAR flag:BOOLEAN): INTEGER;
	VAR eSelec : equipe;
		adv : ptrNoeud;
		num,taille : INTEGER;
	BEGIN
		IF (NOT flag) THEN 
			eSelec := selectionDeLEquipeDuC2(c2) // séléction d'une équipe du chapeau 2
		ELSE BEGIN
			ptrTab[i] := supprimerListe(ptrTab[i]);
			writeln('BL apres supprimerListe');
			afficherListe(Blacklist[i]);
			eSelec := t[i].e2;
		END;
		creerAdv(eSelec,Blacklist[i],ptrTab[i],c1); //création liste des adversaires
		IF ptrTab[i] <> Nil THEN BEGIN
			taille := longueur(ptrTab[i]);
			num := Random(taille) + 1; //séléction d'un élément aléatoire dans la liste d'adv
			new(adv);
			adv := parcourirListe(num,ptrTab[i]);//accès à l'élément num de la liste
			t[i].e1 := copierEq(adv^.eq);
			t[i].e2 := copierEq(eSelec);
			dispose(adv);
			effacerEquipe(t[i].e1,c1);// on retire du chapeau 1 l'équipe car elle a été tiré
			effacerEquipe(t[i].e2,c2);// on retire du chapeau 2 l'équipe car elle a été tiré
			flag := false;
			Match := i;
		END
		ELSE BEGIN
			BackTracking(c1,c2,ptrTab,i,Blacklist,t);
			flag:= TRUE;
			Match := i-2;
		END;
	END;
END.

