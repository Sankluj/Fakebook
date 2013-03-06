-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 9i
--                        (15/12/2009 17:44:33)
-- -----------------------------------------------------------------------------
--      Nom de la base : FACEBOOK
--      Projet : Accueil Win'Design version 9.0.3 DEMO
--      Auteur : BURDAJEWICZ
--      Date de dernière modification : 15/12/2009 17:40:38
-- -----------------------------------------------------------------------------

DROP TABLE GROUPES CASCADE CONSTRAINTS;

DROP TABLE STATUTS CASCADE CONSTRAINTS;

DROP TABLE MAIL_RCVS CASCADE CONSTRAINTS;

DROP TABLE DEMANDE_AMIS CASCADE CONSTRAINTS;

DROP TABLE LES_PHOTOS CASCADE CONSTRAINTS;

DROP TABLE ACTEURS CASCADE CONSTRAINTS;

DROP TABLE CATEGORIES CASCADE CONSTRAINTS;

DROP TABLE MESSAGE_MURS CASCADE CONSTRAINTS;

DROP TABLE MESSAGES CASCADE CONSTRAINTS;

DROP TABLE CENTRE_INTERETS CASCADE CONSTRAINTS;

DROP TABLE ETABLISSEMENTS CASCADE CONSTRAINTS;

DROP TABLE MAIL_SNDS CASCADE CONSTRAINTS;

DROP TABLE ALBUM_PHOTOS CASCADE CONSTRAINTS;

DROP TABLE MESSAGE_GRPES CASCADE CONSTRAINTS;

DROP TABLE UTILISATEURS CASCADE CONSTRAINTS;

DROP TABLE PHOTOS CASCADE CONSTRAINTS;

DROP TABLE CREER_ETABLS CASCADE CONSTRAINTS;

DROP TABLE REJOINDRE_INTERETS CASCADE CONSTRAINTS;

DROP TABLE COMMENTAIRES CASCADE CONSTRAINTS;

DROP TABLE REJOINDRE_GRPS CASCADE CONSTRAINTS;

DROP TABLE AMIS CASCADE CONSTRAINTS;

DROP TABLE CURSUSES CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE FACEBOOK;

-- -----------------------------------------------------------------------------
--       TABLE : GROUPES
-- -----------------------------------------------------------------------------

CREATE TABLE GROUPES
   (
    ID_ACTEUR_GRP NUMBER(4)  NOT NULL,
    ID_CATEGORIE NUMBER(4)  NOT NULL,
    ID_ACTEUR NUMBER(4)  NOT NULL,
    NOM VARCHAR2(128)  NOT NULL,
    DESCRIPTION CLOB  NULL,
    DATE_CREATION DATE  NOT NULL DEFAULT value = CURRENT_DATE
,   CONSTRAINT PK_GROUPES PRIMARY KEY (ID_ACTEUR_GRP)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GROUPES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GROUPES_UTILISATEURS
     ON GROUPES (ID_ACTEUR ASC)
    ;

CREATE  INDEX I_FK_GROUPES_CATEGORIES
     ON GROUPES (ID_CATEGORIE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : STATUTS
-- -----------------------------------------------------------------------------

CREATE TABLE STATUTS
   (
    ID_MSG NUMBER(4)  NOT NULL,
    STATUT VARCHAR2(255)  NOT NULL,
    DATE_HEURE_ENVOI DATE  NOT NULL
,   CONSTRAINT PK_STATUTS PRIMARY KEY (ID_MSG)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : MAIL_RCVS
-- -----------------------------------------------------------------------------

CREATE TABLE MAIL_RCVS
   (
    ID_MAIL NUMBER(4)  NOT NULL,
    ID_ACTEUR_ENV NUMBER(4)  NOT NULL,
    ID_ACTEUR_RCV NUMBER(4)  NOT NULL,
    OBJET VARCHAR2(128)  NULL,
    DATE_HEURE DATE  NULL,
    MESSAGE CLOB  NULL
,   CONSTRAINT PK_MAIL_RCVS PRIMARY KEY (ID_MAIL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MAIL_RCVS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MAIL_RCVS_ACTEURS
     ON MAIL_RCVS (ID_ACTEUR_ENV ASC)
    ;

CREATE  INDEX I_FK_MAIL_RCVS_ACTEURS2
     ON MAIL_RCVS (ID_ACTEUR_RCV ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : DEMANDE_AMIS
-- -----------------------------------------------------------------------------

CREATE TABLE DEMANDE_AMIS
   (
    ID_DEMANDE NUMBER(4)  NOT NULL,
    ID_ACTEUR_ENV NUMBER(4)  NOT NULL,
    ID_ACTEUR_RCV NUMBER(4)  NOT NULL,
    DATE_DEMANDE DATE  NOT NULL,
    ETAT NUMBER(1)  NULL
,   CONSTRAINT PK_DEMANDE_AMIS PRIMARY KEY (ID_DEMANDE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE DEMANDE_AMIS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_DEMANDE_AMIS_UTILISATEURS
     ON DEMANDE_AMIS (ID_ACTEUR_ENV ASC)
    ;

CREATE  INDEX I_FK_DEMANDE_AMIS_UTILISATEUR1
     ON DEMANDE_AMIS (ID_ACTEUR_RCV ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : LES_PHOTOS
-- -----------------------------------------------------------------------------

CREATE TABLE LES_PHOTOS
   (
    ID_PHOTO NUMBER(4)  NOT NULL,
    CHEMIN VARCHAR2(255)  NOT NULL,
    LIBELLE VARCHAR2(30)  NULL,
    DATE_AJOUT DATE  NOT NULL,
    LEGENDE VARCHAR2(128)  NULL
,   CONSTRAINT PK_LES_PHOTOS PRIMARY KEY (ID_PHOTO)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ACTEURS
-- -----------------------------------------------------------------------------

CREATE TABLE ACTEURS
   (
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ID_PHOTO NUMBER(4)  NOT NULL
,   CONSTRAINT PK_ACTEURS PRIMARY KEY (ID_ACTEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ACTEURS
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_ACTEURS_LES_PHOTOS
     ON ACTEURS (ID_PHOTO ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CATEGORIES
-- -----------------------------------------------------------------------------

CREATE TABLE CATEGORIES
   (
    ID_CATEGORIE NUMBER(4)  NOT NULL,
    NOM VARCHAR2(30)  NOT NULL
,   CONSTRAINT PK_CATEGORIES PRIMARY KEY (ID_CATEGORIE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : MESSAGE_MURS
-- -----------------------------------------------------------------------------

CREATE TABLE MESSAGE_MURS
   (
    ID_MSG NUMBER(4)  NOT NULL,
    MSG_MUR CLOB  NOT NULL,
    DATE_HEURE_ENVOI DATE  NOT NULL
,   CONSTRAINT PK_MESSAGE_MURS PRIMARY KEY (ID_MSG)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : MESSAGES
-- -----------------------------------------------------------------------------

CREATE TABLE MESSAGES
   (
    ID_MSG NUMBER(4)  NOT NULL,
    ID_ACTEUR_ENV NUMBER(4)  NOT NULL,
    ID_ACTEUR_RCV NUMBER(4)  NOT NULL
,   CONSTRAINT PK_MESSAGES PRIMARY KEY (ID_MSG)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MESSAGES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MESSAGES_ACTEURS
     ON MESSAGES (ID_ACTEUR_ENV ASC)
    ;

CREATE  INDEX I_FK_MESSAGES_ACTEURS1
     ON MESSAGES (ID_ACTEUR_RCV ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CENTRE_INTERETS
-- -----------------------------------------------------------------------------

CREATE TABLE CENTRE_INTERETS
   (
    NOM VARCHAR2(30)  NOT NULL,
    DESCRIPTION CLOB  NULL,
    ID_CINT NUMBER(4)  NOT NULL
,   CONSTRAINT PK_CENTRE_INTERETS PRIMARY KEY (ID_CINT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ETABLISSEMENTS
-- -----------------------------------------------------------------------------

CREATE TABLE ETABLISSEMENTS
   (
    ID_ETABL NUMBER(4)  NOT NULL,
    VILLE VARCHAR2(20)  NULL,
    NO_RUE NUMBER(3)  NULL,
    ADRESSE VARCHAR2(30)  NULL,
    CP NUMBER(5)  NULL
,   CONSTRAINT PK_ETABLISSEMENTS PRIMARY KEY (ID_ETABL)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : MAIL_SNDS
-- -----------------------------------------------------------------------------

CREATE TABLE MAIL_SNDS
   (
    ID_MAIL NUMBER(4)  NOT NULL,
    ID_ACTEUR_RCV NUMBER(4)  NOT NULL,
    ID_ACTEUR_ENV NUMBER(4)  NOT NULL,
    OBJET VARCHAR2(128)  NULL,
    DATE_HEURE DATE  NULL,
    MESSAGE CLOB  NULL
,   CONSTRAINT PK_MAIL_SNDS PRIMARY KEY (ID_MAIL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE MAIL_SNDS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_MAIL_SNDS_ACTEURS
     ON MAIL_SNDS (ID_ACTEUR_RCV ASC)
    ;

CREATE  INDEX I_FK_MAIL_SNDS_ACTEURS2
     ON MAIL_SNDS (ID_ACTEUR_ENV ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : ALBUM_PHOTOS
-- -----------------------------------------------------------------------------

CREATE TABLE ALBUM_PHOTOS
   (
    ID_ALBUM NUMBER(4)  NOT NULL,
    ID_ACTEUR NUMBER(4)  NOT NULL,
    NOM_ALBUM VARCHAR2(30)  NOT NULL,
    DATE_AJOUT DATE  NOT NULL
,   CONSTRAINT PK_ALBUM_PHOTOS PRIMARY KEY (ID_ALBUM)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ALBUM_PHOTOS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ALBUM_PHOTOS_ACTEURS
     ON ALBUM_PHOTOS (ID_ACTEUR ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : MESSAGE_GRPES
-- -----------------------------------------------------------------------------

CREATE TABLE MESSAGE_GRPES
   (
    ID_MSG NUMBER(4)  NOT NULL,
    MSG_GRP CLOB  NOT NULL,
    DATE_HEURE_ENVOI DATE  NOT NULL
,   CONSTRAINT PK_MESSAGE_GRPES PRIMARY KEY (ID_MSG)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : UTILISATEURS
-- -----------------------------------------------------------------------------

CREATE TABLE UTILISATEURS
   (
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ADR_MAIL VARCHAR2(100)  NOT NULL,
    MDP VARCHAR2(50)  NOT NULL,
    NOM VARCHAR2(20)  NOT NULL,
    PRENOM VARCHAR2(20)  NOT NULL,
    DATE_NAISS DATE  NOT NULL,
    VILLE VARCHAR2(30)  NULL,
    CP NUMBER(5)  NULL,
    ADRESSE VARCHAR2(30)  NULL,
    NO_RUE NUMBER(3)  NULL,
    REGION VARCHAR2(30)  NULL
,   CONSTRAINT PK_UTILISATEURS PRIMARY KEY (ID_ACTEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : PHOTOS
-- -----------------------------------------------------------------------------

CREATE TABLE PHOTOS
   (
    ID_PHOTO NUMBER(4)  NOT NULL,
    ID_ALBUM NUMBER(4)  NOT NULL,
    ID_COUNTERPHOTOS NUMBER(4)  NOT NULL
,   CONSTRAINT PK_PHOTOS PRIMARY KEY (ID_PHOTO, ID_ALBUM, ID_COUNTERPHOTOS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PHOTOS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PHOTOS_LES_PHOTOS
     ON PHOTOS (ID_PHOTO ASC)
    ;

CREATE  INDEX I_FK_PHOTOS_ALBUM_PHOTOS
     ON PHOTOS (ID_ALBUM ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CREER_ETABLS
-- -----------------------------------------------------------------------------

CREATE TABLE CREER_ETABLS
   (
    ID_ETABL NUMBER(4)  NOT NULL,
    ID_ACTEUR NUMBER(4)  NOT NULL,
    DATE_CREATION DATE  NOT NULL,
    ID_CREATE_ETABL NUMBER(4)  NOT NULL
,   CONSTRAINT PK_CREER_ETABLS PRIMARY KEY (ID_ETABL, ID_ACTEUR, ID_CREATE_ETABL)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CREER_ETABLS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CREER_ETABLS_ETABLISSEMEN
     ON CREER_ETABLS (ID_ETABL ASC)
    ;

CREATE  INDEX I_FK_CREER_ETABLS_UTILISATEURS
     ON CREER_ETABLS (ID_ACTEUR ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REJOINDRE_INTERETS
-- -----------------------------------------------------------------------------

CREATE TABLE REJOINDRE_INTERETS
   (
    ID_CINT NUMBER(4)  NOT NULL,
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ID_REJOINDRE_INTERETS NUMBER(4)  NOT NULL
,   CONSTRAINT PK_REJOINDRE_INTERETS PRIMARY KEY (ID_CINT, ID_ACTEUR, ID_REJOINDRE_INTERETS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REJOINDRE_INTERETS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REJOINDRE_INTERETS_CENTRE
     ON REJOINDRE_INTERETS (ID_CINT ASC)
    ;

CREATE  INDEX I_FK_REJOINDRE_INTERETS_UTILIS
     ON REJOINDRE_INTERETS (ID_ACTEUR ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : COMMENTAIRES
-- -----------------------------------------------------------------------------

CREATE TABLE COMMENTAIRES
   (
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ID_MSG NUMBER(4)  NOT NULL,
    COMMENTAIRE CLOB  NOT NULL,
    DATE_HEURE DATE  NOT NULL,
    ID_COMMENT NUMBER(4)  NOT NULL
,   CONSTRAINT PK_COMMENTAIRES PRIMARY KEY (ID_ACTEUR, ID_MSG, ID_COMMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE COMMENTAIRES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_COMMENTAIRES_UTILISATEURS
     ON COMMENTAIRES (ID_ACTEUR ASC)
    ;

CREATE  INDEX I_FK_COMMENTAIRES_MESSAGES
     ON COMMENTAIRES (ID_MSG ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : REJOINDRE_GRPS
-- -----------------------------------------------------------------------------

CREATE TABLE REJOINDRE_GRPS
   (
    ID_ACTEUR_USER NUMBER(4)  NOT NULL,
    ID_ACTEUR_GRP NUMBER(4)  NOT NULL
,   CONSTRAINT PK_REJOINDRE_GRPS PRIMARY KEY (ID_ACTEUR_USER, ID_ACTEUR_GRP)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REJOINDRE_GRPS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REJOINDRE_GRPS_UTILISATEU
     ON REJOINDRE_GRPS (ID_ACTEUR_USER ASC)
    ;

CREATE  INDEX I_FK_REJOINDRE_GRPS_GROUPES
     ON REJOINDRE_GRPS (ID_ACTEUR_GRP ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : AMIS
-- -----------------------------------------------------------------------------

CREATE TABLE AMIS
   (
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ID_ACTEUR_1 NUMBER(4)  NOT NULL,
    ID_AMI NUMBER(4)  NOT NULL
,   CONSTRAINT PK_AMIS PRIMARY KEY (ID_ACTEUR, ID_ACTEUR_1, ID_AMI)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE AMIS
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_AMIS_UTILISATEURS
     ON AMIS (ID_ACTEUR ASC)
    ;

CREATE  INDEX I_FK_AMIS_UTILISATEURS1
     ON AMIS (ID_ACTEUR_1 ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CURSUSES
-- -----------------------------------------------------------------------------

CREATE TABLE CURSUSES
   (
    ID_ETABL NUMBER(4)  NOT NULL,
    ID_ACTEUR NUMBER(4)  NOT NULL,
    ANNEE NUMBER(4)  NOT NULL,
    CLASSE VARCHAR2(10)  NOT NULL,
    ID_CURSUS NUMBER(4)  NOT NULL
,   CONSTRAINT PK_CURSUSES PRIMARY KEY (ID_ETABL, ID_ACTEUR, ID_CURSUS)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CURSUSES
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CURSUSES_ETABLISSEMENTS
     ON CURSUSES (ID_ETABL ASC)
    ;

CREATE  INDEX I_FK_CURSUSES_UTILISATEURS
     ON CURSUSES (ID_ACTEUR ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE GROUPES ADD (
     CONSTRAINT FK_GROUPES_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE GROUPES ADD (
     CONSTRAINT FK_GROUPES_CATEGORIES
          FOREIGN KEY (ID_CATEGORIE)
               REFERENCES CATEGORIES (ID_CATEGORIE))   ;

ALTER TABLE GROUPES ADD (
     CONSTRAINT FK_GROUPES_ACTEURS
          FOREIGN KEY (ID_ACTEUR_GRP)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE STATUTS ADD (
     CONSTRAINT FK_STATUTS_MESSAGES
          FOREIGN KEY (ID_MSG)
               REFERENCES MESSAGES (ID_MSG))   ;

ALTER TABLE MAIL_RCVS ADD (
     CONSTRAINT FK_MAIL_RCVS_ACTEURS
          FOREIGN KEY (ID_ACTEUR_ENV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE MAIL_RCVS ADD (
     CONSTRAINT FK_MAIL_RCVS_ACTEURS2
          FOREIGN KEY (ID_ACTEUR_RCV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE DEMANDE_AMIS ADD (
     CONSTRAINT FK_DEMANDE_AMIS_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR_ENV)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE DEMANDE_AMIS ADD (
     CONSTRAINT FK_DEMANDE_AMIS_UTILISATEURS1
          FOREIGN KEY (ID_ACTEUR_RCV)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE ACTEURS ADD (
     CONSTRAINT FK_ACTEURS_LES_PHOTOS
          FOREIGN KEY (ID_PHOTO)
               REFERENCES LES_PHOTOS (ID_PHOTO))   ;

ALTER TABLE MESSAGE_MURS ADD (
     CONSTRAINT FK_MESSAGE_MURS_MESSAGES
          FOREIGN KEY (ID_MSG)
               REFERENCES MESSAGES (ID_MSG))   ;

ALTER TABLE MESSAGES ADD (
     CONSTRAINT FK_MESSAGES_ACTEURS
          FOREIGN KEY (ID_ACTEUR_ENV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE MESSAGES ADD (
     CONSTRAINT FK_MESSAGES_ACTEURS1
          FOREIGN KEY (ID_ACTEUR_RCV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE MAIL_SNDS ADD (
     CONSTRAINT FK_MAIL_SNDS_ACTEURS
          FOREIGN KEY (ID_ACTEUR_RCV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE MAIL_SNDS ADD (
     CONSTRAINT FK_MAIL_SNDS_ACTEURS2
          FOREIGN KEY (ID_ACTEUR_ENV)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE ALBUM_PHOTOS ADD (
     CONSTRAINT FK_ALBUM_PHOTOS_ACTEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE MESSAGE_GRPES ADD (
     CONSTRAINT FK_MESSAGE_GRPES_MESSAGES
          FOREIGN KEY (ID_MSG)
               REFERENCES MESSAGES (ID_MSG))   ;

ALTER TABLE UTILISATEURS ADD (
     CONSTRAINT FK_UTILISATEURS_ACTEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES ACTEURS (ID_ACTEUR))   ;

ALTER TABLE PHOTOS ADD (
     CONSTRAINT FK_PHOTOS_LES_PHOTOS
          FOREIGN KEY (ID_PHOTO)
               REFERENCES LES_PHOTOS (ID_PHOTO))   ;

ALTER TABLE PHOTOS ADD (
     CONSTRAINT FK_PHOTOS_ALBUM_PHOTOS
          FOREIGN KEY (ID_ALBUM)
               REFERENCES ALBUM_PHOTOS (ID_ALBUM))   ;

ALTER TABLE CREER_ETABLS ADD (
     CONSTRAINT FK_CREER_ETABLS_ETABLISSEMENTS
          FOREIGN KEY (ID_ETABL)
               REFERENCES ETABLISSEMENTS (ID_ETABL))   ;

ALTER TABLE CREER_ETABLS ADD (
     CONSTRAINT FK_CREER_ETABLS_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE REJOINDRE_INTERETS ADD (
     CONSTRAINT FK_REJOINDRE_INTERETS_CENTRE_I
          FOREIGN KEY (ID_CINT)
               REFERENCES CENTRE_INTERETS (ID_CINT))   ;

ALTER TABLE REJOINDRE_INTERETS ADD (
     CONSTRAINT FK_REJOINDRE_INTERETS_UTILISAT
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE COMMENTAIRES ADD (
     CONSTRAINT FK_COMMENTAIRES_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE COMMENTAIRES ADD (
     CONSTRAINT FK_COMMENTAIRES_MESSAGES
          FOREIGN KEY (ID_MSG)
               REFERENCES MESSAGES (ID_MSG))   ;

ALTER TABLE REJOINDRE_GRPS ADD (
     CONSTRAINT FK_REJOINDRE_GRPS_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR_USER)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE REJOINDRE_GRPS ADD (
     CONSTRAINT FK_REJOINDRE_GRPS_GROUPES
          FOREIGN KEY (ID_ACTEUR_GRP)
               REFERENCES GROUPES (ID_ACTEUR_GRP))   ;

ALTER TABLE AMIS ADD (
     CONSTRAINT FK_AMIS_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE AMIS ADD (
     CONSTRAINT FK_AMIS_UTILISATEURS1
          FOREIGN KEY (ID_ACTEUR_1)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;

ALTER TABLE CURSUSES ADD (
     CONSTRAINT FK_CURSUSES_ETABLISSEMENTS
          FOREIGN KEY (ID_ETABL)
               REFERENCES ETABLISSEMENTS (ID_ETABL))   ;

ALTER TABLE CURSUSES ADD (
     CONSTRAINT FK_CURSUSES_UTILISATEURS
          FOREIGN KEY (ID_ACTEUR)
               REFERENCES UTILISATEURS (ID_ACTEUR))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------