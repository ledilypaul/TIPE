UNIT UTestPointeurs;

INTERFACE 

USES UStructures, UEquipes, UPointeurs;

PROCEDURE testAjoutDebut();
PROCEDURE testSupprimerListe();


IMPLEMENTATION 

PROCEDURE testAjoutDebut();
VAR tete:ptrNoeud;
	manU : equipe;
BEGIN
	manU.nom := 'Man.United';
	manU.grp := 'A';
	manU.rg := 1;
	manU.pays := 'UK';

	ajouterDebut(manU,tete);
	afficherListe(tete);
END;

PROCEDURE testSupprimerListe();
VAR tete,tete2:ptrNoeud;
	c1,c2 : chapeau;
	t : tirage; // même circuit d'affectation que dans le programme
BEGIN
	initChapeaux(c1,c2);
	t[1].e1 := c1[1];

	ajouterDebut(c1[2],tete);
	ajouterDebut(t[1].e1,tete);

	ajouterDebut(t[1].e1,tete2);
	afficherListe(tete);
	writeln;
	afficherListe(tete2);
	supprimerListe(tete);
	writeln;
	afficherListe(tete);
	writeln;
	afficherListe(tete2);
END;
END.