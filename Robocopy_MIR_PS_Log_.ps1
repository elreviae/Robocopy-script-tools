<# 
FR : Script PowerShell pour copier des dossiers, sous-dossiers et fichiers 
de "source" vers "destination" en utilisant la commande "robocopy" avec sortie de log.

NOTE : Version utilisant l'option /MIR pour une copie en mode MIRoir.
------------------------
EN : PowerShell script to copy folders, subfolders and files from "source" to "destination" using the "robocopy" command with log output.

NOTE : Version using the /MIR option for a MIRror-mode copy.

Maxime DES TOUCHES - 2025 | https://github.com/elreviae ------------
#>

# Source et destination avec noms de partage ou chemin direct "D:\MY-FOLER\DATA\"
$source = "\\SRV-NAME-01\Shared-Folder\"
$destination = "\\SRV-NAME-02\Shared-Folder\"

# Timestamp pour le nom du fichier
$timeStamp = $(Get-Date -format dd-MM-yyyy-HHmm)

# Chemin fichier de log
$logFile = "$PSScriptRoot\RobocopyLog_$timeStamp.txt"  # $PSScriptRoot pointe vers le répertoire du script

# Créer le dossier de log si nécessaire
if (!(Test-Path (Split-Path $logFile))) {
    New-Item -ItemType Directory -Path (Split-Path $logFile) -Force
}

# Utilisation de transcript pour capturer la sortie de la session dans le fichier de log
Start-Transcript -Path $logFile

# Exécuter robocopy avec les options suivantes :
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
robocopy $source $destination /MIR /SEC /B /R:3 /W:5 /LOG:$logFile /NP /NJH /NJS

Stop-Transcript

# Afficher un message de confirmation
Write-Host "Copie terminée. Vérifiez le log à l'emplacement : $logFile"