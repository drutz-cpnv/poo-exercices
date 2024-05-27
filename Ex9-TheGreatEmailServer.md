# TheGreatEmailServer

Il s'agit de l'implémentation simpliste d'un serveur mail. Il est capable de recevoir des mails à travers le protocole SMTP.

Les mails reçus sont d'abord contrôlés puis soit rejetés selons plusieurs critères,
soit stockés dans un fichier texte dans un répertoire ayant comme nom l'adresse email du destinataire.

En plus le serveur tient des statistiques qui sont stockées dans un fichier texte.

## Exécution

Pour tester ce logiciel, vous pouvez utiliser votre client mail préféré en indiquant le serveur `localhost` sur le port `3325`.

Vous pouvez aussi utiliser le script `mini_send_mail` dans le répertoire `test` qui permet d'envoyer un mail.
Il y a également une batterie de test dans le script `run_suite_1`.

## Exigences

Voici les nouvelles contraintes, attention vous ne devez **pas les implémenter**,
simplement les prendre en compte comme indications pour ré-usiner le code **existant**.

Vous pouvez le faire en suivant toujour le même but: **réduire le couplage**. Ceci soit de manière intuitive,
en appliquant SOLID ou avec des Design Patterns.

### gestionnaire SMTP 

Je veux pouvoir facilement changer de gestionnaire SMTP (remplacer Dumster/Rumbster par un autre composant).

### statistiques

Indépendamment des statistiques actuelles, je veux un nouveau fichier de stats pour les données suivantes:
 - volume (taille en byte) des mails rejetés.
 - volume (taille en byte) des mails stockés.

### critères de blocage

Je veux ajouter le critère de blocage suivant:
 - les pièces jointes dont l'extension est `.rar`

Et je veux pouvoir choisir les critères de blocage depuis un fichier de config. Je peux spécifier le nombre
de critère et leurs noms pour ce choix.

## Retour d'expérience

Afin de "prouver" que votre ré-usinage atteint les objectifs, dessinez un graphe de couplage entre toutes
les classes de votre projet.

Déterminez pour chaque arc du graphe si celui-ci est _bien_ ou _pas bien_.
