UNIT UTestFct;

INTERFACE 

USES UStructures, UEquipes, UPointeurs, UAffichage, UFonctions;

PROCEDURE testMatchPossible();
PROCEDURE testAppartient();
PROCEDURE testCreerAdv();
PROCEDURE testEffacerEquipe();
PROCEDURE testRajouterEquipe();


IMPLEMENTATION 

PROCEDURE testMatchPossible();
VAR manU,psg,munich : equipe;
BEGIN
	manU.nom := 'Man.United';
	manU.grp := 'A';
	manU.rg := 1;
	manU.pays := 'UK';

	psg.nom := 'PSG';
	psg.grp := 'B';
	psg.rg := 1;
	psg.pays := 'Fr';

	munich.nom := 'Bayern Munich';
	munich.grp := 'B';
	munich.rg := 2;
	munich.pays := 'All';

	IF matchPossible(manU,munich) THEN writeln('passed') ELSE writeln('failed');
	IF (NOT matchPossible(manU,psg)) THEN writeln('passed') ELSE writeln('failed');
	IF matchPossible(manU,munich) THEN writeln('passed') ELSE writeln('failed');
END;

PROCEDURE testAppartient();
VAR tete : ptrNoeud;
	manU,psg,munich : equipe;
BEGIN
	manU.nom := 'Man.United';
	manU.grp := 'A';
	manU.rg := 1;
	manU.pays := 'UK';
	
	psg.nom := 'PSG';
	psg.grp := 'B';
	psg.rg := 1;
	psg.pays := 'Fr';

	munich.nom := 'Bayern Munich';
	munich.grp := 'B';
	munich.rg := 2;
	munich.pays := 'All';
	
	ajouterDebut(manU,tete);
	ajouterDebut(psg,tete);

	IF (NOT eltAppartientALaListe(munich,tete)) THEN writeln('passed') ELSE writeln('failed');
	ajouterDebut(munich,tete);
	IF (eltAppartientALaListe(munich,tete)) THEN writeln('passed') ELSE writeln('failed');
END;

PROCEDURE testCreerAdv();
VAR teteAdv,teteBL : ptrNoeud;
	c1,c2 : chapeau;
BEGIN
	initChapeaux(c1,c2);
	teteBL := Nil;
	creerAdv(c2[2],teteBL,teteAdv,c1);
	writeln('liste adv de ',c2[2].nom);
	afficherListe(teteAdv);
END;


PROCEDURE testEffacerEquipe();
VAR c1,c2 : chapeau;
BEGIN
	initChapeaux(c1,c2);
	effacerEquipe(c1[2],c1);
	afficherChapeau(c1);
END;

PROCEDURE testRajouterEquipe();
VAR c1,c2 : chapeau;
	manU,psg,munich : equipe;
BEGIN
	manU.nom := 'Man.United';
	manU.grp := 'A';
	manU.rg := 1;
	manU.pays := 'UK';

	initChapeaux(c1,c2);
	effacerEquipe(manU,c1);
	afficherChapeau(c1);
	writeln;
	rajouterEquipe(c1,manU);
	afficherChapeau(c1);
END;
END.