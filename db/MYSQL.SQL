DROP DATABASE IF EXISTS FACEBOOK;

CREATE DATABASE IF NOT EXISTS FACEBOOK;
USE FACEBOOK;
# -----------------------------------------------------------------------------
#       TABLE : GROUPES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GROUPES
 (
   ID_ACTEUR_GRP INT NOT NULL  ,
   ID_CATEGORIE INT NOT NULL  ,
   ID_ACTEUR INT NOT NULL  ,
   NOM VARCHAR(128) NOT NULL  ,
   DESCRIPTION TEXT NULL  ,
   DATE_CREATION DATE NOT NULL  
   , PRIMARY KEY (ID_ACTEUR_GRP) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE GROUPES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_GROUPES_UTILISATEURS
     ON GROUPES (ID_ACTEUR ASC);

CREATE  INDEX I_FK_GROUPES_CATEGORIES
     ON GROUPES (ID_CATEGORIE ASC);

# -----------------------------------------------------------------------------
#       TABLE : STATUTS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STATUTS
 (
   ID_MSG INT NOT NULL  ,
   STATUT VARCHAR(255) NOT NULL  ,
   DATE_HEURE_ENVOI DATE NOT NULL  
   , PRIMARY KEY (ID_MSG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MAIL_RCVS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MAIL_RCVS
 (
   ID_MAIL INT NOT NULL  ,
   ID_ACTEUR_ENV INT NOT NULL  ,
   ID_ACTEUR_RCV INT NOT NULL  ,
   OBJET VARCHAR(128) NULL  ,
   DATE_HEURE DATE NULL  ,
   MESSAGE TEXT NULL  
   , PRIMARY KEY (ID_MAIL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MAIL_RCVS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MAIL_RCVS_ACTEURS
     ON MAIL_RCVS (ID_ACTEUR_ENV ASC);

CREATE  INDEX I_FK_MAIL_RCVS_ACTEURS2
     ON MAIL_RCVS (ID_ACTEUR_RCV ASC);

# -----------------------------------------------------------------------------
#       TABLE : DEMANDE_AMIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEMANDE_AMIS
 (
   ID_DEMANDE INT NOT NULL  ,
   ID_ACTEUR_ENV INT NOT NULL  ,
   ID_ACTEUR_RCV INT NOT NULL  ,
   DATE_DEMANDE DATE NOT NULL  ,
   ETAT DECIMAL(1) NULL  
   , PRIMARY KEY (ID_DEMANDE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DEMANDE_AMIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DEMANDE_AMIS_UTILISATEURS
     ON DEMANDE_AMIS (ID_ACTEUR_ENV ASC);

CREATE  INDEX I_FK_DEMANDE_AMIS_UTILISATEURS1
     ON DEMANDE_AMIS (ID_ACTEUR_RCV ASC);

# -----------------------------------------------------------------------------
#       TABLE : LES_PHOTOS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LES_PHOTOS
 (
   ID_PHOTO INT NOT NULL  ,
   CHEMIN VARCHAR(255) NOT NULL  ,
   LIBELLE VARCHAR(30) NULL  ,
   DATE_AJOUT DATE NOT NULL  ,
   LEGENDE VARCHAR(128) NULL  
   , PRIMARY KEY (ID_PHOTO) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ACTEURS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ACTEURS
 (
   ID_ACTEUR INT NOT NULL  ,
   ID_PHOTO INT NOT NULL  
   , PRIMARY KEY (ID_ACTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ACTEURS
# -----------------------------------------------------------------------------


CREATE UNIQUE INDEX I_FK_ACTEURS_LES_PHOTOS
     ON ACTEURS (ID_PHOTO ASC);

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIES
 (
   ID_CATEGORIE INT NOT NULL  ,
   NOM VARCHAR(30) NOT NULL  
   , PRIMARY KEY (ID_CATEGORIE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MESSAGE_MURS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MESSAGE_MURS
 (
   ID_MSG INT NOT NULL  ,
   MSG_MUR TEXT NOT NULL  ,
   DATE_HEURE_ENVOI DATE NOT NULL  
   , PRIMARY KEY (ID_MSG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MESSAGES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MESSAGES
 (
   ID_MSG INT NOT NULL  ,
   ID_ACTEUR_ENV INT NOT NULL  ,
   ID_ACTEUR_RCV INT NOT NULL  
   , PRIMARY KEY (ID_MSG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MESSAGES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MESSAGES_ACTEURS
     ON MESSAGES (ID_ACTEUR_ENV ASC);

CREATE  INDEX I_FK_MESSAGES_ACTEURS1
     ON MESSAGES (ID_ACTEUR_RCV ASC);

# -----------------------------------------------------------------------------
#       TABLE : CENTRE_INTERETS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CENTRE_INTERETS
 (
   NOM VARCHAR(30) NOT NULL  ,
   DESCRIPTION TEXT NULL  ,
   ID_CINT INT NOT NULL  
   , PRIMARY KEY (ID_CINT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETABLISSEMENTS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETABLISSEMENTS
 (
   ID_ETABL INT NOT NULL  ,
   VILLE VARCHAR(20) NULL  ,
   NO_RUE DECIMAL(3) NULL  ,
   ADRESSE VARCHAR(30) NULL  ,
   CP DECIMAL(5) NULL  
   , PRIMARY KEY (ID_ETABL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MAIL_SNDS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MAIL_SNDS
 (
   ID_MAIL INT NOT NULL  ,
   ID_ACTEUR_RCV INT NOT NULL  ,
   ID_ACTEUR_ENV INT NOT NULL  ,
   OBJET VARCHAR(128) NULL  ,
   DATE_HEURE DATE NULL  ,
   MESSAGE TEXT NULL  
   , PRIMARY KEY (ID_MAIL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MAIL_SNDS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MAIL_SNDS_ACTEURS
     ON MAIL_SNDS (ID_ACTEUR_RCV ASC);

CREATE  INDEX I_FK_MAIL_SNDS_ACTEURS2
     ON MAIL_SNDS (ID_ACTEUR_ENV ASC);

# -----------------------------------------------------------------------------
#       TABLE : ALBUM_PHOTOS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ALBUM_PHOTOS
 (
   ID_ALBUM INT NOT NULL  ,
   ID_ACTEUR INT NOT NULL  ,
   NOM_ALBUM VARCHAR(30) NOT NULL  ,
   DATE_AJOUT DATE NOT NULL  
   , PRIMARY KEY (ID_ALBUM) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ALBUM_PHOTOS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ALBUM_PHOTOS_ACTEURS
     ON ALBUM_PHOTOS (ID_ACTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : MESSAGE_GRPES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MESSAGE_GRPES
 (
   ID_MSG INT NOT NULL  ,
   MSG_GRP TEXT NOT NULL  ,
   DATE_HEURE_ENVOI DATE NOT NULL  
   , PRIMARY KEY (ID_MSG) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : UTILISATEURS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEURS
 (
   ID_ACTEUR INT NOT NULL  ,
   ADR_MAIL VARCHAR(100) NOT NULL  ,
   MDP VARCHAR(50) NOT NULL  ,
   NOM VARCHAR(20) NOT NULL  ,
   PRENOM VARCHAR(20) NOT NULL  ,
   DATE_NAISS DATE NOT NULL  ,
   VILLE VARCHAR(30) NULL  ,
   CP DECIMAL(5) NULL  ,
   ADRESSE VARCHAR(30) NULL  ,
   NO_RUE DECIMAL(3) NULL  ,
   REGION VARCHAR(30) NULL  
   , PRIMARY KEY (ID_ACTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PHOTOS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PHOTOS
 (
   ID_PHOTO INT NOT NULL  ,
   ID_ALBUM INT NOT NULL  ,
   ID_COUNTERPHOTOS INT NOT NULL  
   , PRIMARY KEY (ID_PHOTO,ID_ALBUM,ID_COUNTERPHOTOS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PHOTOS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PHOTOS_LES_PHOTOS
     ON PHOTOS (ID_PHOTO ASC);

CREATE  INDEX I_FK_PHOTOS_ALBUM_PHOTOS
     ON PHOTOS (ID_ALBUM ASC);

# -----------------------------------------------------------------------------
#       TABLE : CREER_ETABLS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CREER_ETABLS
 (
   ID_ETABL INT NOT NULL  ,
   ID_ACTEUR INT NOT NULL  ,
   DATE_CREATION DATE NOT NULL  ,
   ID_CREATE_ETABL INT NOT NULL  
   , PRIMARY KEY (ID_ETABL,ID_ACTEUR,ID_CREATE_ETABL) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CREER_ETABLS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CREER_ETABLS_ETABLISSEMENTS
     ON CREER_ETABLS (ID_ETABL ASC);

CREATE  INDEX I_FK_CREER_ETABLS_UTILISATEURS
     ON CREER_ETABLS (ID_ACTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : REJOINDRE_INTERETS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REJOINDRE_INTERETS
 (
   ID_CINT INT NOT NULL  ,
   ID_ACTEUR INT NOT NULL  ,
   ID_REJOINDRE_INTERETS INT NOT NULL  
   , PRIMARY KEY (ID_CINT,ID_ACTEUR,ID_REJOINDRE_INTERETS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REJOINDRE_INTERETS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REJOINDRE_INTERETS_CENTRE_INTERETS
     ON REJOINDRE_INTERETS (ID_CINT ASC);

CREATE  INDEX I_FK_REJOINDRE_INTERETS_UTILISATEURS
     ON REJOINDRE_INTERETS (ID_ACTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMMENTAIRES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMENTAIRES
 (
   ID_ACTEUR INT NOT NULL  ,
   ID_MSG INT NOT NULL  ,
   COMMENTAIRE TEXT NOT NULL  ,
   DATE_HEURE DATE NOT NULL  ,
   ID_COMMENT INT NOT NULL  
   , PRIMARY KEY (ID_ACTEUR,ID_MSG,ID_COMMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMMENTAIRES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMMENTAIRES_UTILISATEURS
     ON COMMENTAIRES (ID_ACTEUR ASC);

CREATE  INDEX I_FK_COMMENTAIRES_MESSAGES
     ON COMMENTAIRES (ID_MSG ASC);

# -----------------------------------------------------------------------------
#       TABLE : REJOINDRE_GRPS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS REJOINDRE_GRPS
 (
   ID_ACTEUR_USER INT NOT NULL  ,
   ID_ACTEUR_GRP INT NOT NULL  
   , PRIMARY KEY (ID_ACTEUR_USER,ID_ACTEUR_GRP) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE REJOINDRE_GRPS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_REJOINDRE_GRPS_UTILISATEURS
     ON REJOINDRE_GRPS (ID_ACTEUR_USER ASC);

CREATE  INDEX I_FK_REJOINDRE_GRPS_GROUPES
     ON REJOINDRE_GRPS (ID_ACTEUR_GRP ASC);

# -----------------------------------------------------------------------------
#       TABLE : AMIS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AMIS
 (
   ID_ACTEUR INT NOT NULL  ,
   ID_ACTEUR_1 INT NOT NULL  ,
   ID_AMI INT NOT NULL  
   , PRIMARY KEY (ID_ACTEUR,ID_ACTEUR_1,ID_AMI) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AMIS
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AMIS_UTILISATEURS
     ON AMIS (ID_ACTEUR ASC);

CREATE  INDEX I_FK_AMIS_UTILISATEURS1
     ON AMIS (ID_ACTEUR_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : CURSUSES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CURSUSES
 (
   ID_ETABL INT NOT NULL  ,
   ID_ACTEUR INT NOT NULL  ,
   ANNEE INT NOT NULL  ,
   CLASSE VARCHAR(10) NOT NULL  ,
   ID_CURSUS INT NOT NULL  
   , PRIMARY KEY (ID_ETABL,ID_ACTEUR,ID_CURSUS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CURSUSES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CURSUSES_ETABLISSEMENTS
     ON CURSUSES (ID_ETABL ASC);

CREATE  INDEX I_FK_CURSUSES_UTILISATEURS
     ON CURSUSES (ID_ACTEUR ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE GROUPES 
  ADD FOREIGN KEY FK_GROUPES_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE GROUPES 
  ADD FOREIGN KEY FK_GROUPES_CATEGORIES (ID_CATEGORIE)
      REFERENCES CATEGORIES (ID_CATEGORIE) ;


ALTER TABLE GROUPES 
  ADD FOREIGN KEY FK_GROUPES_ACTEURS (ID_ACTEUR_GRP)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE STATUTS 
  ADD FOREIGN KEY FK_STATUTS_MESSAGES (ID_MSG)
      REFERENCES MESSAGES (ID_MSG) ;


ALTER TABLE MAIL_RCVS 
  ADD FOREIGN KEY FK_MAIL_RCVS_ACTEURS (ID_ACTEUR_ENV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE MAIL_RCVS 
  ADD FOREIGN KEY FK_MAIL_RCVS_ACTEURS2 (ID_ACTEUR_RCV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE DEMANDE_AMIS 
  ADD FOREIGN KEY FK_DEMANDE_AMIS_UTILISATEURS (ID_ACTEUR_ENV)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE DEMANDE_AMIS 
  ADD FOREIGN KEY FK_DEMANDE_AMIS_UTILISATEURS1 (ID_ACTEUR_RCV)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE ACTEURS 
  ADD FOREIGN KEY FK_ACTEURS_LES_PHOTOS (ID_PHOTO)
      REFERENCES LES_PHOTOS (ID_PHOTO) ;


ALTER TABLE MESSAGE_MURS 
  ADD FOREIGN KEY FK_MESSAGE_MURS_MESSAGES (ID_MSG)
      REFERENCES MESSAGES (ID_MSG) ;


ALTER TABLE MESSAGES 
  ADD FOREIGN KEY FK_MESSAGES_ACTEURS (ID_ACTEUR_ENV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE MESSAGES 
  ADD FOREIGN KEY FK_MESSAGES_ACTEURS1 (ID_ACTEUR_RCV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE MAIL_SNDS 
  ADD FOREIGN KEY FK_MAIL_SNDS_ACTEURS (ID_ACTEUR_RCV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE MAIL_SNDS 
  ADD FOREIGN KEY FK_MAIL_SNDS_ACTEURS2 (ID_ACTEUR_ENV)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE ALBUM_PHOTOS 
  ADD FOREIGN KEY FK_ALBUM_PHOTOS_ACTEURS (ID_ACTEUR)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE MESSAGE_GRPES 
  ADD FOREIGN KEY FK_MESSAGE_GRPES_MESSAGES (ID_MSG)
      REFERENCES MESSAGES (ID_MSG) ;


ALTER TABLE UTILISATEURS 
  ADD FOREIGN KEY FK_UTILISATEURS_ACTEURS (ID_ACTEUR)
      REFERENCES ACTEURS (ID_ACTEUR) ;


ALTER TABLE PHOTOS 
  ADD FOREIGN KEY FK_PHOTOS_LES_PHOTOS (ID_PHOTO)
      REFERENCES LES_PHOTOS (ID_PHOTO) ;


ALTER TABLE PHOTOS 
  ADD FOREIGN KEY FK_PHOTOS_ALBUM_PHOTOS (ID_ALBUM)
      REFERENCES ALBUM_PHOTOS (ID_ALBUM) ;


ALTER TABLE CREER_ETABLS 
  ADD FOREIGN KEY FK_CREER_ETABLS_ETABLISSEMENTS (ID_ETABL)
      REFERENCES ETABLISSEMENTS (ID_ETABL) ;


ALTER TABLE CREER_ETABLS 
  ADD FOREIGN KEY FK_CREER_ETABLS_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE REJOINDRE_INTERETS 
  ADD FOREIGN KEY FK_REJOINDRE_INTERETS_CENTRE_INTERETS (ID_CINT)
      REFERENCES CENTRE_INTERETS (ID_CINT) ;


ALTER TABLE REJOINDRE_INTERETS 
  ADD FOREIGN KEY FK_REJOINDRE_INTERETS_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE COMMENTAIRES 
  ADD FOREIGN KEY FK_COMMENTAIRES_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE COMMENTAIRES 
  ADD FOREIGN KEY FK_COMMENTAIRES_MESSAGES (ID_MSG)
      REFERENCES MESSAGES (ID_MSG) ;


ALTER TABLE REJOINDRE_GRPS 
  ADD FOREIGN KEY FK_REJOINDRE_GRPS_UTILISATEURS (ID_ACTEUR_USER)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE REJOINDRE_GRPS 
  ADD FOREIGN KEY FK_REJOINDRE_GRPS_GROUPES (ID_ACTEUR_GRP)
      REFERENCES GROUPES (ID_ACTEUR_GRP) ;


ALTER TABLE AMIS 
  ADD FOREIGN KEY FK_AMIS_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE AMIS 
  ADD FOREIGN KEY FK_AMIS_UTILISATEURS1 (ID_ACTEUR_1)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;


ALTER TABLE CURSUSES 
  ADD FOREIGN KEY FK_CURSUSES_ETABLISSEMENTS (ID_ETABL)
      REFERENCES ETABLISSEMENTS (ID_ETABL) ;


ALTER TABLE CURSUSES 
  ADD FOREIGN KEY FK_CURSUSES_UTILISATEURS (ID_ACTEUR)
      REFERENCES UTILISATEURS (ID_ACTEUR) ;

