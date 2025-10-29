![image](https://img.shields.io/badge/powershell-5391FE?style=for-the-badge&logo=powershell&logoColor=white) 

# Robocopy-script-tools
Simple and powerful RoboCopy PowerShell scripts.

* Official Microsoft reference : https://learn.microsoft.com/fr-fr/windows-server/administration/windows-commands/robocopy


## Robocopy_PS_Log_.ps1
* FR : Script PowerShell pour copier des dossiers, sous-dossiers et fichiers 
de "source" vers "destination" en utilisant la commande "robocopy" avec sortie de log.

* EN : PowerShell script to copy folders, subfolders and files from "source" to "destination" using the "robocopy" command with log output.
----------------------------------
### Script is using these options :
```bash
# /E : Copie les sous-répertoires, y compris les vides
# /Z : Utilise le mode de redémarrage pour les copies réseau (reprise en cas d'interruption, sans nécessiter de droits de sauvegarde)
# /R:3 : Nombre de tentatives en cas d'échec (3 tentatives)
# /W:5 : Temps d'attente entre tentatives (5 secondes)
# /LOG: : Spécifie le fichier de log
# /NP : Ne pas afficher la progression (utile pour les logs)
# /NJH : Pas d'en-tête de tâche dans le log
# /NJS : Pas de résumé de tâche dans le log
```

## Robocopy_MIR_PS_Log_.ps1

* FR : Script PowerShell pour copier des dossiers, sous-dossiers et fichiers 
de "source" vers "destination" en utilisant la commande "robocopy" avec sortie de log.
* NOTE : Version utilisant l'option /MIR pour une copie en mode MIRoir.
--------------
* EN : PowerShell script to copy folders, subfolders and files from "source" to "destination" using the "robocopy" command with log output.
* NOTE : Version using the /MIR option for a mirror-mode copy.
----------------------------------
### Script is using these options :
```bash
# /MIR : Met en MIRoir une arborescence. Si un fichier est créé sur la source il va être copié vers la cible. Si un fichier est supprimé sur la source, il le sera également sur la cible.
# /SEC : Permet de migrer les droits NTFS
# /B : Mode de sauvegarde, qui utilise les privilèges SeBackupprivilege et SesestorePrivilege pour sauvegarder les fichiers qui nécessitent normalement les droits administratifs.
# /Z : Utilise le mode de redémarrage pour les copies réseau (reprise en cas d'interruption, sans nécessiter de droits de sauvegarde)
# /R:3 : Nombre de tentatives en cas d'échec (3 tentatives)
# /W:5 : Temps d'attente entre tentatives (5 secondes)
# /LOG: : Spécifie le fichier de log
# /NP : Ne pas afficher la progression (utile pour les logs)
# /NJH : Pas d'en-tête de tâche dans le log
# /NJS : Pas de résumé de tâche dans le log
```
