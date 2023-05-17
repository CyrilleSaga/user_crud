# Application de gestion d'utilisateurs

## Introduction
Cette application est conçue pour permettre au apprenant de flutter de comprendre comment fonctionne les base de données en local.

## Fonctionnalités
- Ajouter un utilisateur
- Lire les informations d'un utilisateur
- Mettre à jour les informations d'un utilisateur
- Supprimer un utilisateur 

## Dépendances
Les dépendances suivantes ont été utilisées pour développer cette application :

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.2.8+3
  path_provider: ^2.0.15
  get: ^4.6.5
```
- **sqflite** est utilisé pour la gestion de la base de données SQLite.
- **path_provider** est utilisé pour accéder aux emplacements des fichiers locaux.
- **get** est utilisé pour la gestion de l'état, pour la navigation entre les pages et pour afficher des messages d'informations.

## Screenshots

### Écran d'accueil
![Accueil](/assets/5.png)

### Ajout d'un utilisateur
<div style="display: flex;">
    <img src="/assets/6.png" style="width: 50%;" />
    <img src="/assets/1.png" style="width: 50%;" />
</div>

### Lecture de l'utilisateur
![Lecture de l'utilisateur](/assets/8.png)
![Lecture de l'utilisateur](/assets/2.png)

### Mise à jour de l'utilisateur
![Mise à jour de l'utilisateur](/assets/7.png)
![Mise à jour de l'utilisateur](/assets/3.png)

### Suppression de l'utilisateur
![Suppression de l'utilisateur](/assets/4.png)

## Conclusion
Cette application offre une solution simple et efficace pour gérer les utilisateurs.
