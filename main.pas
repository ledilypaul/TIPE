PROGRAM main;
USES UStructures, UEquipes,UPointeurs, UFonctions,UAffichage,UBackTracking,UTirage;

VAR	c1,c2:chapeau;
	ptrTab,Blacklist : listeAdv;
	t:tirage;


BEGIN
	// je teste un tirage
	initChapeaux(c1,c2);
	initListeAdv(Blacklist);
	Tirage(c1,c2,1,ptrTab,Blacklist,t);
	writeln;
	writeln;
	writeln('Tirage :'); 
	afficherTirage(t);

END.


//A l'initialisation ptrTab et BL tableau de Nil (déjà testé
