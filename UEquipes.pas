UNIT UEquipes; 

	INTERFACE
	USES UStructures;
	
	
	PROCEDURE initEquipes ( VAR psg:equipe; VAR manC:equipe; VAR manU:equipe; VAR barca :equipe; VAR roma:equipe; VAR liv:equipe;VAR besiktas:equipe; VAR totenam :equipe;VAR bale:equipe; VAR munich:equipe; VAR chelsea :equipe; VAR juve:equipe; VAR seville:equipe; VAR donetsk:equipe; VAR porto:equipe; VAR rma: equipe);
	PROCEDURE initChapeaux(VAR chap1,chap2 : chapeau);
	PROCEDURE initEVide (VAR eVide : equipe); // permet de remplacer les cases des equipes utilisees par un element vide
	FUNCTION copierEq (team : equipe) : equipe;
	PROCEDURE initListeAdv(VAR t : listeAdv);


	IMPLEMENTATION 
	
	//initialisation  des equipes 
	PROCEDURE initEquipes( VAR psg:equipe; VAR manC:equipe; VAR manU:equipe; VAR barca :equipe; VAR roma:equipe; VAR liv:equipe;VAR besiktas:equipe; VAR totenam :equipe; VAR bale:equipe; VAR munich:equipe; VAR chelsea :equipe; VAR juve:equipe; VAR seville:equipe; VAR donetsk:equipe; VAR porto:equipe; VAR rma: equipe);
	BEGIN
		// equipes 1ere de gp
		manU.nom := 'Man.United';
		manU.grp := 'A';
		manU.rg := 1;
		manU.pays := 'UK';
		
		psg.nom := 'PSG';
		psg.grp := 'B';
		psg.rg := 1;
		psg.pays := 'Fr';
		
		roma.nom := 'AS Rome';
		roma.grp := 'C';
		roma.rg := 1;
		roma.pays := 'Italie';
		
		barca.nom := 'FC Barcelone';
		barca.grp := 'D';
		barca.rg := 1;
		barca.pays := 'Esp';
		
		liv.nom := 'Liverpool';
		liv.grp := 'E';
		liv.rg := 1;
		liv.pays := 'UK';
		
		manC.nom := 'Man. City';
		manC.grp := 'F';
		manC.rg := 1;
		manC.pays := 'UK';
		
		besiktas.nom := 'Besiktas';
		besiktas.grp := 'G';
		besiktas.rg := 1;
		besiktas.pays := 'Turquie';
		
		totenam.nom := 'Tottenham';
		totenam.grp := 'H';
		totenam.rg := 1;
		totenam.pays := 'UK';
		
		besiktas.nom := 'Besiktas';
		besiktas.grp := 'G';
		besiktas.rg := 1;
		besiktas.pays := 'Turquie';
		
		// equipes 2eme de gpe 
		bale.nom := 'FC Bale';
		bale.grp := 'A';
		bale.rg := 2;
		bale.pays := 'Suisse';
		
		munich.nom := 'Bayern Munich';
		munich.grp := 'B';
		munich.rg := 2;
		munich.pays := 'All'; // allemagne
		
		chelsea.nom := 'Chelsea';
		chelsea.grp := 'C';
		chelsea.rg := 2;
		chelsea.pays := 'UK';
		
		juve.nom := 'Juventus';
		juve.grp := 'D';
		juve.rg := 2; 
		juve.pays := 'Italie';
		
		seville.nom := 'FC Seville';
		seville.grp := 'E';
		seville.rg := 2;
		seville.pays := 'Esp';
		
		donetsk.nom := 'Chaktior Donetsk';
		donetsk.grp := 'F';
		donetsk.rg := 2;
		donetsk.pays := 'Ukr'; // Ukraine
		
		porto.nom := 'FC Porto';
		porto.grp := 'G';
		porto.rg := 2; 
		porto.pays := 'Port'; // Portugal
		
		rma.nom := 'Real Madrid';
		rma.grp := 'H';
		rma.rg := 2;
		rma.pays := 'Esp';
	END;
	
	//rempli les chapeaux avec les équipes 
	PROCEDURE initChapeaux(VAR chap1,chap2 : chapeau);
	VAR psg,manC,manU,barca,roma,liv,besiktas,totenam : equipe;
		bale,munich,chelsea,juve,seville,donetsk,porto,rma : equipe;
	BEGIN
		initEquipes(psg,manC,manU,barca,roma,liv,besiktas,totenam,bale,munich,chelsea,juve,seville,donetsk,porto,rma);
		
		chap1[1] := manU;
		chap1[2] := psg;
		chap1[3] := roma;
		chap1[4] := barca;
		chap1[5] := liv;
		chap1[6] := manC;
		chap1[7] := besiktas;
		chap1[8] := totenam;
		
		chap2[1] := bale;
		chap2[2] := munich;
		chap2[3] := chelsea;
		chap2[4] := juve;
		chap2[5] := seville;
		chap2[6] := donetsk;
		chap2[7] := porto;
		chap2[8] := rma;
	END;
	
	PROCEDURE initEVide (VAR eVide : equipe); // permet de remplacer les cases des équipes utilisées par un element vide
	BEGIN
		eVide.nom := 'V';
		eVide.grp := 'V';
		eVide.rg := 0;
		eVide.pays:= 'V';
	END;
	
	//ciper champ par champ une équipe
	FUNCTION copierEq (team : equipe) : equipe;
	BEGIN
		copierEq.nom := team.nom;
		copierEq.grp:= team.grp;
		copierEq.rg := team.rg;
		copierEq.pays := team.pays;
	END;
	
	PROCEDURE initListeAdv(VAR t : listeAdv);
	VAR i : INTEGER;
	BEGIN
		FOR i := 1 TO 8 DO t[i] := NIL;
	END;

END.
