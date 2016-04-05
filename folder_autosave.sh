# folder_autosave by Salamafet

#Script de  sauvegarde autonome
#Entete vide pour eviter les erreur bash/sh


# On recupere nom du dossier dans les options de lancement
chemin_origine=$1;
chemin_destination=$2;

# On recupere juste le nom du dossier 
dossier_origine=$(basename "${chemin_origine}")

# On recupere la ou ce trouve l'archive
emplacement_origine=$(dirname "${chemin_origine}")


# Verifiaction que le script a ete lance avec un nom de dossier
# Si aucun nom n'a ete entre, on affiche un message et on arrete l'execution du script
if [ -z "${chemin_origine}" ] || [ -z "${chemin_destination}" ]; then
	echo ""
	echo "Vous devez entrer le nom du dossier que vous voulez sauvegarder ainsi que la destination"
	echo "Exemple: ./folder_autosave.sh /home/user/Musiques /home/user/sauvegarde"
	echo ""
	echo "Attention aux respects des majuscules"
	echo ""
	exit
fi

# On stock la date actuelle dans une variable (format jour mois annee)
date=$(date +%y-%m-%d)
nom_archive=$date"-"${dossier_origine}
#date=$(date +%Hh%M) #dev

echo ""


# On verifie que le dossier de sauvergade existe
if [ ! -d "${chemin_destination}" ]; then
	mkdir "${chemin_destination}"
	echo "Creation d'un dossier "${chemin_destination}" pour les sauvegardes"
fi
# Si il n'existe pas alors on le creer


# On lance une compression du dossier
echo "Creation d'une archive de "${dossier_origine}" en cours..."
tar -cjf "${chemin_destination}/${nom_archive}.tar" -C "${emplacement_origine}" "${dossier_origine}"
echo "Termine !"

# j = compression bzip2 (moins de place, plus long)
# z = compression gzip  (plus de place, moins long)

#On supprime les dossiers qui ont plus de 31 jours mais on garde chaque fichier de début de mois
echo "Suppression des sauvegarde ayant plus de 31 jours..."
echo "(les sauvegarde datant du premier de chaque moi seront concervé)"
find "${chemin_destination}" ! -name '01-*-*-*.tar' -mtime +31 -type f -exec rm -rf {} \;
#find /SAVE/$chemin_origine/ -mmin +15 -type d -exec rm -rf {} \; #dev
echo "Termine"

echo ""
