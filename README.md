Projet : Gmail-like en AJAX

Lien Heroku : https://thpmailzz.herokuapp.com/
  
1. Introduction
Pour ce projet, nous allons te demander de faire un Email Viewer qui n'est ni plus ni moins qu'une version ultra basique de Gmail. Globalement l'appli affichera une seule et unique page avec 2 colonnes :

Une colonne contenant la liste des emails en base ;
Une colonne affichant le contenu de l'email sur lequel l'utilisateur vient de cliquer.
2. Le projet
2.1. Une appli Rails
Pour te simplifier la vie, tu vas continuer sur l'application Rails d'hier (la to do list) : cela t'évitera de refaire les manipulations et branchements habituels (que tu connais à présent par coeur).
Crées un model email ayant des attributs object (string), et body (text). On ira pas tellement plus loin pour le back, après tout on bosse sur AJAX là ! Fais-toi un petit seed pour mettre en base quelques emails.

Maintenant root ton projet sur email#index, et génère le controller et la view qui correspondent. On va pouvoir bosser !

2.2. La view index de base
Pour commencer, tu vas créer un grand tableau sur 2 colonnes :

Une colonne "Liste des emails" qui affichera l'objet de chaque email présent en base ;
Une colonne "Email sélectionné" qui sera vide au chargement de la page mais qui affichera le contenu (à terme) de l'email sélectionné.
N'hésite pas à utiliser Bootstrap pour avoir un visuel pas trop moche sur toute ton app !

2.3. Premier niveau d'AJAX : l'ajout d'un email
On commence par une fonction AJAX que tu connais bien : la création d'un nouvel email. Ici on fait ultra simple :

Tu vas créer un bouton "recevoir un email" juste au dessus de ton tableau ;
Lorsqu'il sera cliqué, ce bouton fera un appel en POST vers une méthode create du controller emails qui va créer un nouvel email en base via Faker (comme ça, pas besoin de saisir toi-même le contenu) ;
Tout cela doit avoir lieu en AJAX pour que le nouvel email s'affiche, à la suite des autres et sans rechargement.
2.4. Deuxième niveau d'AJAX : afficher un email
Maintenant, tu vas changer chaque objet d'email (le texte) en un lien HTML : ce lien doit rediriger vers une page show basique de l'email (affichant l'objet en haut, contenu en dessous).

Une fois cela fait, tu vas passer ce lien en AJAX : au lieu d'ouvrir la page show via une redirection d'URL, je veux que cela exécute un fichier JS qui va afficher le contenu de l'email dans la colonne de droite. Le rendu visuel sera simple :

L'objet de l'email sera en gros, en haut de la colonne de droite ;
Le corps de l'email sera en taille normale, juste en dessous ;
Sous le corps d'email, il y aura 2 boutons (inactifs pour le moment) : "Supprimer" et "Marquer comme non-lu"
2.5. Troisième niveau d'AJAX : la suppression d'un email
Pas besoin de plus d'info, si ? Il faut tout simplement que le bouton "Supprimer" fonctionne bien en AJAX. L'email doit disparaître des 2 colonnes.

2.6. Quatrième niveau d'AJAX : email lu/non-lu
On va à présent gérer la notion de lu/non-lu. Fais une migration qui rajoute l'attribut read à la table emails : c'est un booléen qui vaut false initialement et doit passer à true si l'email est lu. Met à jour ton seed si besoin pour prendre en compte cet attribut.

Voici comment cet attribut doit fonctionner pour l'utilisateur de ton Gmail-like :

Lorsqu'il clique sur l'objet d'un email et que le contenu de celui-ci s'affiche, l'email doit passer en lu à la fois en BDD et visuellement sur le front de la colonne de gauche (par exemple la couleur de fond de l'objet change ou son nom passe de gras à normal).
L'utilisateur peut remettre l'email en "non-lu" grâce au bouton "Marquer comme non-lu". Cela modifie son statut en BDD ainsi que son affichage visuel sur la colonne de gauche (par exemple la couleur de fond de l'objet revient à la normale).
Une fois que tu as fait marcher cela, essaye d'implémenter une fonctionnalité sympa : si on clique sur le bouton "marquer comme non-lu", le bouton devient alors "marquer comme lu" et permet de repasser le statut de l'email à "lu".

2.7 Ultime niveau d'AJAX : l'appel en JQuery/JS
Ton Email-Viewer est ultra-cool si tu as réussi à lui implémenter tout ça. Mais on peut aller encore un niveau au dessus ! En effet, pour afficher un email, tu dois pour le moment cliquer sur un lien qui est le texte de l'objet. Mais Gmail fait mieux : il t'affiche le contenu de ton email si tu cliques n'importe où dans la case qui encadre l'objet de l'email.

Pour faire cela, il faut être capable de mettre un détecteur JS de clic sur la case puis de déclencher, via JavaScript, une requête AJAX. C'est un peu le niveau du dessus de la checkbox qu'on a vu précédemment !

Je vais te laisser chercher comment faire cela, car c'est complètement bonus. Mais voilà déjà plusieurs ressources qui vont te guider :

Cette ressource liste les différents façons de faire une requête HTTP en JavaScript/AJAX ;
Ce thread StackOverflow explique une partie de la syntaxe ;
Ici, on présente la méthode fetch() qui peut être une solution.
Je te laisse chercher comment faire. Rappelle toi simplement que dans notre cas, nous souhaitons avoir du JavaScript en réponse à notre requête AJAX, pas du JSON, ni de l'HTML, ni du texte.

3. Rendu attendu
Un repo GitHub avec une app Rails complète, fonctionnelle et déployée en production sur Heroku.
