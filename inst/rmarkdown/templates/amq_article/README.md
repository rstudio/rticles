# Comment utiliser l'extension `amq_article`?

## Ajouter des packages

Vous pouvez ajouter des packages utiles pour vous dans le fichier `authorpackages.tex`. Vous pouvez laisser le fichier vide si vous n'avez aucun package à ajouter.

Voici quelques exemples de packages que vous pouvez ajouter:

```
\usepackage{pstricks}
\usepackage{enumitem}
```


## Ajouter des commandes

Vous pouvez ajouter des commandes utiles pour vous dans le fichier `authorcommands.tex`. Vous pouvez laisser le fichier vide si vous n'avez aucune commande à ajouter.

Voici quelques exemples de commandes que vous pouvez ajouter:

```
\newcommand{\lr}[1]{\left(#1\right)}
\newcommand{\abs}[1]{\left\vert#1\right\vert}
```

## Bibliographie

Le bulletin de l'AMQ ne vous permet pas d'utiliser `Bibtex` pour votre bibliographie. Vous devez donc entrer vos bibliographies dans le fichiers `mybibliography.tex`.

La liste des références apparaîtra entre les commandes `\begin{thebibliography}{10}` et `\end{thebibliography}{10}`, par ordre alphabétique du premier auteur.

Toutes les références bibliographiques apparaissant dans la liste des références devraient être citées dans le corps du texte. Réciproquement, toutes les références citées dans le corps du texte devraient apparaître en fin de texte dans la liste des 
références.

Chaque item de cette liste sera entré grâce à la commande `\bibitem`.

- Pour un livre: `\bibitem{étiquette} Nom de l'auteur, Initiale. (année de publication). {\em Titre du livre} (Numéro d'édition Éd.) (vol. numéro de volume) (Nom du traducteur trad.). Ville, Pays (sauf pour les USA où on mettra Ville, abr. postale de l'État): Éditeur.`

- Pour un article publié dans une revue: `\bibitem{étiquette} Nom de l'auteur, Initiale. (année de publication). Titre de l'article, {\em Nom de la revue, Numéro du volume} (no. numéro de fascicule), numéro de la première page--numéro de la dernière page.`

- Pour un chapitre dans un ouvrage collectif (plusieurs auteurs): `\bibitem{étiquette} Nom de l'auteur, Initiale. (année de publication). Titre du chapitre, Dans Initiale. Nom du directeur (dir.) {\em Titre de l'ouvrage}, (numéro d'édition ou de chapitre, p. numéro de la première page--numéro de la dernière page), Ville, Pays: Éditeur.`

- Pour un document en ligne: `\bibitem{étiquette} Nom de l'auteur, Initiale. (date de création, ou année de création mise à jour date de mise à jour). Titre du document (pour une section d'un document long, traiter comme pour un chapitre de livre en remplaçant les numéros de pages par le numéro de chapitre ou de section)`.

Pour invoquer une référence dans le texte, utiliser la commande `\cite{étiquette}`

Pour plus de renseignements, consultez [normes](http://benhur.teluq.uqam.ca/~mcouture/apa/normes_apa_francais.pdf). Pour les informations de localisation, consulter le même document
