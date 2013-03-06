-- ------------------------------------------------------------------------------- 
--   Génération des triggers de la base 
--   de données : MCD_FACE
--   (15/12/2009 17:45:54)
-- ------------------------------------------------------------------------------- 

-- ------------------------------------------------------------------------------- 
--   Table : GROUPES
-- ------------------------------------------------------------------------------- 

drop trigger TD_GROUPES;

-- Trigger de suppression ----------------------------------------------
create trigger TD_GROUPES
after delete on GROUPES for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table REJOINDRE_GRPS.

     delete from REJOINDRE_GRPS
     where
          REJOINDRE_GRPS.ID_ACTEUR_GRP = :old.ID_ACTEUR_GRP;

end;
/

drop trigger TU_GROUPES;

-- Trigger de modification ----------------------------------------------
create trigger TU_GROUPES
after update on GROUPES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table GROUPES s'il n'existe pas d'occurrence correspondante de la 
     -- table UTILISATEURS.

     if
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
          select count(*) into numrows
          from UTILISATEURS
          where
               :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "GROUPES" car "UTILISATEURS" n''existe pas.');
          end if;
     end if;
     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table GROUPES s'il n'existe pas d'occurrence correspondante de la 
     -- table CATEGORIES.

     if
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
          select count(*) into numrows
          from CATEGORIES
          where
               :new.ID_CATEGORIE = CATEGORIES.ID_CATEGORIE;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "GROUPES" car "CATEGORIES" n''existe pas.');
          end if;
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- ACTEURS.

     if
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "ACTEURS" interdite.');
     end if;
     -- Répercuter la modification de la clé primaire de GROUPES sur les 
     -- occurrences correspondantes de la table REJOINDRE_GRPS.

     if
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
          update REJOINDRE_GRPS
          set
               REJOINDRE_GRPS.ID_ACTEUR_GRP = :new.ID_ACTEUR_GRP
          where
               REJOINDRE_GRPS.ID_ACTEUR_GRP = :old.ID_ACTEUR_GRP;
     end if;

end;
/

drop trigger TI_GROUPES;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_GROUPES
after insert on GROUPES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de GROUPES 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "GROUPES" car "UTILISATEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de GROUPES 
     -- s'il n'existe pas d'occurrence correspondante dans la table CATEGORIES.

     select count(*) into numrows
     from CATEGORIES
     where
          :new.ID_CATEGORIE = CATEGORIES.ID_CATEGORIE;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "GROUPES" car "CATEGORIES" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de GROUPES 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_GRP = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "GROUPES" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : STATUTS
-- ------------------------------------------------------------------------------- 

drop trigger TU_STATUTS;

-- Trigger de modification ----------------------------------------------
create trigger TU_STATUTS
after update on STATUTS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- MESSAGES.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "MESSAGES" interdite.');
     end if;

end;
/

drop trigger TI_STATUTS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_STATUTS
after insert on STATUTS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de STATUTS 
     -- s'il n'existe pas d'occurrence correspondante dans la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          :new.ID_MSG = MESSAGES.ID_MSG;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "STATUTS" car "MESSAGES" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : MAIL_RCVS
-- ------------------------------------------------------------------------------- 

drop trigger TU_MAIL_RCVS;

-- Trigger de modification ----------------------------------------------
create trigger TU_MAIL_RCVS
after update on MAIL_RCVS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MAIL_RCVS s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MAIL <> :new.ID_MAIL
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MAIL_RCVS" car "ACTEURS" n''existe pas.');
          end if;
     end if;
     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MAIL_RCVS s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MAIL <> :new.ID_MAIL
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MAIL_RCVS" car "ACTEURS" n''existe pas.');
          end if;
     end if;

end;
/

drop trigger TI_MAIL_RCVS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_MAIL_RCVS
after insert on MAIL_RCVS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MAIL_RCVS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MAIL_RCVS" car "ACTEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MAIL_RCVS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MAIL_RCVS" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : DEMANDE_AMIS
-- ------------------------------------------------------------------------------- 

drop trigger TU_DEMANDE_AMIS;

-- Trigger de modification ----------------------------------------------
create trigger TU_DEMANDE_AMIS
after update on DEMANDE_AMIS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table DEMANDE_AMIS s'il n'existe pas d'occurrence correspondante de la 
     -- table UTILISATEURS.

     if
          :old.ID_DEMANDE <> :new.ID_DEMANDE
     then
          select count(*) into numrows
          from UTILISATEURS
          where
               :new.ID_ACTEUR_ENV = UTILISATEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "DEMANDE_AMIS" car "UTILISATEURS" n''existe pas.');
          end if;
     end if;
     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table DEMANDE_AMIS s'il n'existe pas d'occurrence correspondante de la 
     -- table UTILISATEURS.

     if
          :old.ID_DEMANDE <> :new.ID_DEMANDE
     then
          select count(*) into numrows
          from UTILISATEURS
          where
               :new.ID_ACTEUR_RCV = UTILISATEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "DEMANDE_AMIS" car "UTILISATEURS" n''existe pas.');
          end if;
     end if;

end;
/

drop trigger TI_DEMANDE_AMIS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_DEMANDE_AMIS
after insert on DEMANDE_AMIS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de DEMANDE_AMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR_ENV = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "DEMANDE_AMIS" car "UTILISATEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de DEMANDE_AMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR_RCV = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "DEMANDE_AMIS" car "UTILISATEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : LES_PHOTOS
-- ------------------------------------------------------------------------------- 

drop trigger TD_LES_PHOTOS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_LES_PHOTOS
after delete on LES_PHOTOS for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table PHOTOS.

     delete from PHOTOS
     where
          PHOTOS.ID_PHOTO = :old.ID_PHOTO;
     -- Supprimer les occurrences correspondantes de la table ACTEURS.

     delete from ACTEURS
     where
          ACTEURS.ID_PHOTO = :old.ID_PHOTO;

end;
/

drop trigger TU_LES_PHOTOS;

-- Trigger de modification ----------------------------------------------
create trigger TU_LES_PHOTOS
after update on LES_PHOTOS for each row
declare numrows INTEGER;
begin

     -- Répercuter la modification de la clé primaire de LES_PHOTOS sur les 
     -- occurrences correspondantes de la table PHOTOS.

     if
          :old.ID_PHOTO <> :new.ID_PHOTO
     then
          update PHOTOS
          set
               PHOTOS.ID_PHOTO = :new.ID_PHOTO
          where
               PHOTOS.ID_PHOTO = :old.ID_PHOTO;
     end if;
     -- Répercuter la modification de la clé primaire de LES_PHOTOS sur les 
     -- occurrences correspondantes de la table ACTEURS.

     if
          :old.ID_PHOTO <> :new.ID_PHOTO
     then
          update ACTEURS
          set
               ACTEURS.ID_PHOTO = :new.ID_PHOTO
          where
               ACTEURS.ID_PHOTO = :old.ID_PHOTO;
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : ACTEURS
-- ------------------------------------------------------------------------------- 

drop trigger TD_ACTEURS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_ACTEURS
after delete on ACTEURS for each row
declare numrows INTEGER;
begin

     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          MESSAGES.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MESSAGES" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table ALBUM_PHOTOS.

     select count(*) into numrows
     from ALBUM_PHOTOS
     where
          ALBUM_PHOTOS.ID_ACTEUR = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "ALBUM_PHOTOS" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          MESSAGES.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MESSAGES" existent.');
     end if;
     -- Supprimer les occurrences correspondantes de la table UTILISATEURS.

     delete from UTILISATEURS
     where
          UTILISATEURS.ID_ACTEUR = :old.ID_ACTEUR;
     -- Supprimer les occurrences correspondantes de la table GROUPES.

     delete from GROUPES
     where
          GROUPES.ID_ACTEUR_GRP = :old.ID_ACTEUR;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MAIL_RCVS.

     select count(*) into numrows
     from MAIL_RCVS
     where
          MAIL_RCVS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MAIL_RCVS" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MAIL_RCVS.

     select count(*) into numrows
     from MAIL_RCVS
     where
          MAIL_RCVS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MAIL_RCVS" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MAIL_SNDS.

     select count(*) into numrows
     from MAIL_SNDS
     where
          MAIL_SNDS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MAIL_SNDS" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de ACTEURS s'il existe des
     -- occurrences correspondantes de la table MAIL_SNDS.

     select count(*) into numrows
     from MAIL_SNDS
     where
          MAIL_SNDS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "ACTEURS". Des occurrences de "MAIL_SNDS" existent.');
     end if;

end;
/

drop trigger TU_ACTEURS;

-- Trigger de modification ----------------------------------------------
create trigger TU_ACTEURS
after update on ACTEURS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table ACTEURS s'il n'existe pas d'occurrence correspondante de la 
     -- table LES_PHOTOS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          select count(*) into numrows
          from LES_PHOTOS
          where
               :new.ID_PHOTO = LES_PHOTOS.ID_PHOTO;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "ACTEURS" car "LES_PHOTOS" n''existe pas.');
          end if;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MESSAGES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MESSAGES
          set
               MESSAGES.ID_ACTEUR_ENV = :new.ID_ACTEUR
          where
               MESSAGES.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table ALBUM_PHOTOS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update ALBUM_PHOTOS
          set
               ALBUM_PHOTOS.ID_ACTEUR = :new.ID_ACTEUR
          where
               ALBUM_PHOTOS.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MESSAGES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MESSAGES
          set
               MESSAGES.ID_ACTEUR_RCV = :new.ID_ACTEUR
          where
               MESSAGES.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table UTILISATEURS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update UTILISATEURS
          set
               UTILISATEURS.ID_ACTEUR = :new.ID_ACTEUR
          where
               UTILISATEURS.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table GROUPES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update GROUPES
          set
               GROUPES.ID_ACTEUR_GRP = :new.ID_ACTEUR
          where
               GROUPES.ID_ACTEUR_GRP = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MAIL_RCVS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MAIL_RCVS
          set
               MAIL_RCVS.ID_ACTEUR_ENV = :new.ID_ACTEUR
          where
               MAIL_RCVS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MAIL_RCVS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MAIL_RCVS
          set
               MAIL_RCVS.ID_ACTEUR_RCV = :new.ID_ACTEUR
          where
               MAIL_RCVS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MAIL_SNDS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MAIL_SNDS
          set
               MAIL_SNDS.ID_ACTEUR_RCV = :new.ID_ACTEUR
          where
               MAIL_SNDS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de ACTEURS sur les 
     -- occurrences correspondantes de la table MAIL_SNDS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update MAIL_SNDS
          set
               MAIL_SNDS.ID_ACTEUR_ENV = :new.ID_ACTEUR
          where
               MAIL_SNDS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     end if;

end;
/

drop trigger TI_ACTEURS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_ACTEURS
after insert on ACTEURS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de ACTEURS 
     -- s'il n'existe pas d'occurrence correspondante dans la table LES_PHOTOS.

     select count(*) into numrows
     from LES_PHOTOS
     where
          :new.ID_PHOTO = LES_PHOTOS.ID_PHOTO;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "ACTEURS" car "LES_PHOTOS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : CATEGORIES
-- ------------------------------------------------------------------------------- 

drop trigger TD_CATEGORIES;

-- Trigger de suppression ----------------------------------------------
create trigger TD_CATEGORIES
after delete on CATEGORIES for each row
declare numrows INTEGER;
begin

     -- Interdire la suppression d'une occurrence de CATEGORIES s'il existe des
     -- occurrences correspondantes de la table GROUPES.

     select count(*) into numrows
     from GROUPES
     where
          GROUPES.ID_CATEGORIE = :old.ID_CATEGORIE;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "CATEGORIES". Des occurrences de "GROUPES" existent.');
     end if;

end;
/

drop trigger TU_CATEGORIES;

-- Trigger de modification ----------------------------------------------
create trigger TU_CATEGORIES
after update on CATEGORIES for each row
declare numrows INTEGER;
begin

     -- Répercuter la modification de la clé primaire de CATEGORIES sur les 
     -- occurrences correspondantes de la table GROUPES.

     if
          :old.ID_CATEGORIE <> :new.ID_CATEGORIE
     then
          update GROUPES
          set
               GROUPES.ID_CATEGORIE = :new.ID_CATEGORIE
          where
               GROUPES.ID_CATEGORIE = :old.ID_CATEGORIE;
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : MESSAGE_MURS
-- ------------------------------------------------------------------------------- 

drop trigger TU_MESSAGE_MURS;

-- Trigger de modification ----------------------------------------------
create trigger TU_MESSAGE_MURS
after update on MESSAGE_MURS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- MESSAGES.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "MESSAGES" interdite.');
     end if;

end;
/

drop trigger TI_MESSAGE_MURS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_MESSAGE_MURS
after insert on MESSAGE_MURS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MESSAGE_MURS 
     -- s'il n'existe pas d'occurrence correspondante dans la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          :new.ID_MSG = MESSAGES.ID_MSG;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MESSAGE_MURS" car "MESSAGES" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : MESSAGES
-- ------------------------------------------------------------------------------- 

drop trigger TD_MESSAGES;

-- Trigger de suppression ----------------------------------------------
create trigger TD_MESSAGES
after delete on MESSAGES for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table COMMENTAIRES.

     delete from COMMENTAIRES
     where
          COMMENTAIRES.ID_MSG = :old.ID_MSG;
     -- Supprimer les occurrences correspondantes de la table STATUTS.

     delete from STATUTS
     where
          STATUTS.ID_MSG = :old.ID_MSG;
     -- Supprimer les occurrences correspondantes de la table MESSAGE_MURS.

     delete from MESSAGE_MURS
     where
          MESSAGE_MURS.ID_MSG = :old.ID_MSG;
     -- Supprimer les occurrences correspondantes de la table MESSAGE_GRPES.

     delete from MESSAGE_GRPES
     where
          MESSAGE_GRPES.ID_MSG = :old.ID_MSG;

end;
/

drop trigger TU_MESSAGES;

-- Trigger de modification ----------------------------------------------
create trigger TU_MESSAGES
after update on MESSAGES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MESSAGES s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MESSAGES" car "ACTEURS" n''existe pas.');
          end if;
     end if;
     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MESSAGES s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MESSAGES" car "ACTEURS" n''existe pas.');
          end if;
     end if;
     -- Répercuter la modification de la clé primaire de MESSAGES sur les 
     -- occurrences correspondantes de la table COMMENTAIRES.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          update COMMENTAIRES
          set
               COMMENTAIRES.ID_MSG = :new.ID_MSG
          where
               COMMENTAIRES.ID_MSG = :old.ID_MSG;
     end if;
     -- Répercuter la modification de la clé primaire de MESSAGES sur les 
     -- occurrences correspondantes de la table STATUTS.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          update STATUTS
          set
               STATUTS.ID_MSG = :new.ID_MSG
          where
               STATUTS.ID_MSG = :old.ID_MSG;
     end if;
     -- Répercuter la modification de la clé primaire de MESSAGES sur les 
     -- occurrences correspondantes de la table MESSAGE_MURS.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          update MESSAGE_MURS
          set
               MESSAGE_MURS.ID_MSG = :new.ID_MSG
          where
               MESSAGE_MURS.ID_MSG = :old.ID_MSG;
     end if;
     -- Répercuter la modification de la clé primaire de MESSAGES sur les 
     -- occurrences correspondantes de la table MESSAGE_GRPES.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
          update MESSAGE_GRPES
          set
               MESSAGE_GRPES.ID_MSG = :new.ID_MSG
          where
               MESSAGE_GRPES.ID_MSG = :old.ID_MSG;
     end if;

end;
/

drop trigger TI_MESSAGES;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_MESSAGES
after insert on MESSAGES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MESSAGES 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MESSAGES" car "ACTEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MESSAGES 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MESSAGES" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : CENTRE_INTERETS
-- ------------------------------------------------------------------------------- 

drop trigger TD_CENTRE_INTERETS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_CENTRE_INTERETS
after delete on CENTRE_INTERETS for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table REJOINDRE_INTERETS.

     delete from REJOINDRE_INTERETS
     where
          REJOINDRE_INTERETS.ID_CINT = :old.ID_CINT;

end;
/

drop trigger TU_CENTRE_INTERETS;

-- Trigger de modification ----------------------------------------------
create trigger TU_CENTRE_INTERETS
after update on CENTRE_INTERETS for each row
declare numrows INTEGER;
begin

     -- Répercuter la modification de la clé primaire de CENTRE_INTERETS sur les 
     -- occurrences correspondantes de la table REJOINDRE_INTERETS.

     if
          :old.ID_CINT <> :new.ID_CINT
     then
          update REJOINDRE_INTERETS
          set
               REJOINDRE_INTERETS.ID_CINT = :new.ID_CINT
          where
               REJOINDRE_INTERETS.ID_CINT = :old.ID_CINT;
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : ETABLISSEMENTS
-- ------------------------------------------------------------------------------- 

drop trigger TD_ETABLISSEMENTS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_ETABLISSEMENTS
after delete on ETABLISSEMENTS for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table CREER_ETABLS.

     delete from CREER_ETABLS
     where
          CREER_ETABLS.ID_ETABL = :old.ID_ETABL;
     -- Supprimer les occurrences correspondantes de la table CURSUSES.

     delete from CURSUSES
     where
          CURSUSES.ID_ETABL = :old.ID_ETABL;

end;
/

drop trigger TU_ETABLISSEMENTS;

-- Trigger de modification ----------------------------------------------
create trigger TU_ETABLISSEMENTS
after update on ETABLISSEMENTS for each row
declare numrows INTEGER;
begin

     -- Répercuter la modification de la clé primaire de ETABLISSEMENTS sur les 
     -- occurrences correspondantes de la table CREER_ETABLS.

     if
          :old.ID_ETABL <> :new.ID_ETABL
     then
          update CREER_ETABLS
          set
               CREER_ETABLS.ID_ETABL = :new.ID_ETABL
          where
               CREER_ETABLS.ID_ETABL = :old.ID_ETABL;
     end if;
     -- Répercuter la modification de la clé primaire de ETABLISSEMENTS sur les 
     -- occurrences correspondantes de la table CURSUSES.

     if
          :old.ID_ETABL <> :new.ID_ETABL
     then
          update CURSUSES
          set
               CURSUSES.ID_ETABL = :new.ID_ETABL
          where
               CURSUSES.ID_ETABL = :old.ID_ETABL;
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : MAIL_SNDS
-- ------------------------------------------------------------------------------- 

drop trigger TU_MAIL_SNDS;

-- Trigger de modification ----------------------------------------------
create trigger TU_MAIL_SNDS
after update on MAIL_SNDS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MAIL_SNDS s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MAIL <> :new.ID_MAIL
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MAIL_SNDS" car "ACTEURS" n''existe pas.');
          end if;
     end if;
     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table MAIL_SNDS s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_MAIL <> :new.ID_MAIL
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "MAIL_SNDS" car "ACTEURS" n''existe pas.');
          end if;
     end if;

end;
/

drop trigger TI_MAIL_SNDS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_MAIL_SNDS
after insert on MAIL_SNDS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MAIL_SNDS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_RCV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MAIL_SNDS" car "ACTEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MAIL_SNDS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR_ENV = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MAIL_SNDS" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : ALBUM_PHOTOS
-- ------------------------------------------------------------------------------- 

drop trigger TD_ALBUM_PHOTOS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_ALBUM_PHOTOS
after delete on ALBUM_PHOTOS for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table PHOTOS.

     delete from PHOTOS
     where
          PHOTOS.ID_ALBUM = :old.ID_ALBUM;

end;
/

drop trigger TU_ALBUM_PHOTOS;

-- Trigger de modification ----------------------------------------------
create trigger TU_ALBUM_PHOTOS
after update on ALBUM_PHOTOS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle, interdire la modification de la clé étrangère de la 
     -- table ALBUM_PHOTOS s'il n'existe pas d'occurrence correspondante de la 
     -- table ACTEURS.

     if
          :old.ID_ALBUM <> :new.ID_ALBUM
     then
          select count(*) into numrows
          from ACTEURS
          where
               :new.ID_ACTEUR = ACTEURS.ID_ACTEUR;
          if 
               (
               numrows = 0 
               )
          then
               raise_application_error(
               -20007,
               'Impossible de mettre à jour "ALBUM_PHOTOS" car "ACTEURS" n''existe pas.');
          end if;
     end if;
     -- Répercuter la modification de la clé primaire de ALBUM_PHOTOS sur les 
     -- occurrences correspondantes de la table PHOTOS.

     if
          :old.ID_ALBUM <> :new.ID_ALBUM
     then
          update PHOTOS
          set
               PHOTOS.ID_ALBUM = :new.ID_ALBUM
          where
               PHOTOS.ID_ALBUM = :old.ID_ALBUM;
     end if;

end;
/

drop trigger TI_ALBUM_PHOTOS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_ALBUM_PHOTOS
after insert on ALBUM_PHOTOS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de ALBUM_PHOTOS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "ALBUM_PHOTOS" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : MESSAGE_GRPES
-- ------------------------------------------------------------------------------- 

drop trigger TU_MESSAGE_GRPES;

-- Trigger de modification ----------------------------------------------
create trigger TU_MESSAGE_GRPES
after update on MESSAGE_GRPES for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- MESSAGES.

     if
          :old.ID_MSG <> :new.ID_MSG
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "MESSAGES" interdite.');
     end if;

end;
/

drop trigger TI_MESSAGE_GRPES;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_MESSAGE_GRPES
after insert on MESSAGE_GRPES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de MESSAGE_GRPES 
     -- s'il n'existe pas d'occurrence correspondante dans la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          :new.ID_MSG = MESSAGES.ID_MSG;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "MESSAGE_GRPES" car "MESSAGES" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : UTILISATEURS
-- ------------------------------------------------------------------------------- 

drop trigger TD_UTILISATEURS;

-- Trigger de suppression ----------------------------------------------
create trigger TD_UTILISATEURS
after delete on UTILISATEURS for each row
declare numrows INTEGER;
begin

     -- Supprimer les occurrences correspondantes de la table CREER_ETABLS.

     delete from CREER_ETABLS
     where
          CREER_ETABLS.ID_ACTEUR = :old.ID_ACTEUR;
     -- Supprimer les occurrences correspondantes de la table REJOINDRE_INTERETS.

     delete from REJOINDRE_INTERETS
     where
          REJOINDRE_INTERETS.ID_ACTEUR = :old.ID_ACTEUR;
     -- Interdire la suppression d'une occurrence de UTILISATEURS s'il existe des
     -- occurrences correspondantes de la table DEMANDE_AMIS.

     select count(*) into numrows
     from DEMANDE_AMIS
     where
          DEMANDE_AMIS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "UTILISATEURS". Des occurrences de "DEMANDE_AMIS" existent.');
     end if;
     -- Supprimer les occurrences correspondantes de la table COMMENTAIRES.

     delete from COMMENTAIRES
     where
          COMMENTAIRES.ID_ACTEUR = :old.ID_ACTEUR;
     -- Supprimer les occurrences correspondantes de la table REJOINDRE_GRPS.

     delete from REJOINDRE_GRPS
     where
          REJOINDRE_GRPS.ID_ACTEUR_USER = :old.ID_ACTEUR;
     -- Interdire la suppression d'une occurrence de UTILISATEURS s'il existe des
     -- occurrences correspondantes de la table GROUPES.

     select count(*) into numrows
     from GROUPES
     where
          GROUPES.ID_ACTEUR = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "UTILISATEURS". Des occurrences de "GROUPES" existent.');
     end if;
     -- Interdire la suppression d'une occurrence de UTILISATEURS s'il existe des
     -- occurrences correspondantes de la table DEMANDE_AMIS.

     select count(*) into numrows
     from DEMANDE_AMIS
     where
          DEMANDE_AMIS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     if (numrows > 0) then
          raise_application_error(
          -20001,
          'Impossible de supprimer "UTILISATEURS". Des occurrences de "DEMANDE_AMIS" existent.');
     end if;
     -- Supprimer les occurrences correspondantes de la table AMIS.

     delete from AMIS
     where
          AMIS.ID_ACTEUR = :old.ID_ACTEUR;
     -- Supprimer les occurrences correspondantes de la table AMIS.

     delete from AMIS
     where
          AMIS.ID_ACTEUR_1 = :old.ID_ACTEUR;
     -- Supprimer les occurrences correspondantes de la table CURSUSES.

     delete from CURSUSES
     where
          CURSUSES.ID_ACTEUR = :old.ID_ACTEUR;

end;
/

drop trigger TU_UTILISATEURS;

-- Trigger de modification ----------------------------------------------
create trigger TU_UTILISATEURS
after update on UTILISATEURS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- ACTEURS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "ACTEURS" interdite.');
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table CREER_ETABLS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update CREER_ETABLS
          set
               CREER_ETABLS.ID_ACTEUR = :new.ID_ACTEUR
          where
               CREER_ETABLS.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table REJOINDRE_INTERETS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update REJOINDRE_INTERETS
          set
               REJOINDRE_INTERETS.ID_ACTEUR = :new.ID_ACTEUR
          where
               REJOINDRE_INTERETS.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table DEMANDE_AMIS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update DEMANDE_AMIS
          set
               DEMANDE_AMIS.ID_ACTEUR_ENV = :new.ID_ACTEUR
          where
               DEMANDE_AMIS.ID_ACTEUR_ENV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table COMMENTAIRES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update COMMENTAIRES
          set
               COMMENTAIRES.ID_ACTEUR = :new.ID_ACTEUR
          where
               COMMENTAIRES.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table REJOINDRE_GRPS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update REJOINDRE_GRPS
          set
               REJOINDRE_GRPS.ID_ACTEUR_USER = :new.ID_ACTEUR
          where
               REJOINDRE_GRPS.ID_ACTEUR_USER = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table GROUPES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update GROUPES
          set
               GROUPES.ID_ACTEUR = :new.ID_ACTEUR
          where
               GROUPES.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table DEMANDE_AMIS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update DEMANDE_AMIS
          set
               DEMANDE_AMIS.ID_ACTEUR_RCV = :new.ID_ACTEUR
          where
               DEMANDE_AMIS.ID_ACTEUR_RCV = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table AMIS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update AMIS
          set
               AMIS.ID_ACTEUR = :new.ID_ACTEUR
          where
               AMIS.ID_ACTEUR = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table AMIS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update AMIS
          set
               AMIS.ID_ACTEUR_1 = :new.ID_ACTEUR
          where
               AMIS.ID_ACTEUR_1 = :old.ID_ACTEUR;
     end if;
     -- Répercuter la modification de la clé primaire de UTILISATEURS sur les 
     -- occurrences correspondantes de la table CURSUSES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR
     then
          update CURSUSES
          set
               CURSUSES.ID_ACTEUR = :new.ID_ACTEUR
          where
               CURSUSES.ID_ACTEUR = :old.ID_ACTEUR;
     end if;

end;
/

drop trigger TI_UTILISATEURS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_UTILISATEURS
after insert on UTILISATEURS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de UTILISATEURS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ACTEURS.

     select count(*) into numrows
     from ACTEURS
     where
          :new.ID_ACTEUR = ACTEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "UTILISATEURS" car "ACTEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : PHOTOS
-- ------------------------------------------------------------------------------- 

drop trigger TU_PHOTOS;

-- Trigger de modification ----------------------------------------------
create trigger TU_PHOTOS
after update on PHOTOS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- LES_PHOTOS.

     if
          :old.ID_PHOTO <> :new.ID_PHOTO or 
          :old.ID_ALBUM <> :new.ID_ALBUM or 
          :old.ID_COUNTERPHOTOS <> :new.ID_COUNTERPHOTOS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "LES_PHOTOS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- ALBUM_PHOTOS.

     if
          :old.ID_PHOTO <> :new.ID_PHOTO or 
          :old.ID_ALBUM <> :new.ID_ALBUM or 
          :old.ID_COUNTERPHOTOS <> :new.ID_COUNTERPHOTOS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "ALBUM_PHOTOS" interdite.');
     end if;

end;
/

drop trigger TI_PHOTOS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_PHOTOS
after insert on PHOTOS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de PHOTOS 
     -- s'il n'existe pas d'occurrence correspondante dans la table LES_PHOTOS.

     select count(*) into numrows
     from LES_PHOTOS
     where
          :new.ID_PHOTO = LES_PHOTOS.ID_PHOTO;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "PHOTOS" car "LES_PHOTOS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de PHOTOS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ALBUM_PHOTOS.

     select count(*) into numrows
     from ALBUM_PHOTOS
     where
          :new.ID_ALBUM = ALBUM_PHOTOS.ID_ALBUM;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "PHOTOS" car "ALBUM_PHOTOS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : CREER_ETABLS
-- ------------------------------------------------------------------------------- 

drop trigger TU_CREER_ETABLS;

-- Trigger de modification ----------------------------------------------
create trigger TU_CREER_ETABLS
after update on CREER_ETABLS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- ETABLISSEMENTS.

     if
          :old.ID_ETABL <> :new.ID_ETABL or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_CREATE_ETABL <> :new.ID_CREATE_ETABL
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "ETABLISSEMENTS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ETABL <> :new.ID_ETABL or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_CREATE_ETABL <> :new.ID_CREATE_ETABL
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;

end;
/

drop trigger TI_CREER_ETABLS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_CREER_ETABLS
after insert on CREER_ETABLS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de CREER_ETABLS 
     -- s'il n'existe pas d'occurrence correspondante dans la table ETABLISSEMENTS.

     select count(*) into numrows
     from ETABLISSEMENTS
     where
          :new.ID_ETABL = ETABLISSEMENTS.ID_ETABL;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "CREER_ETABLS" car "ETABLISSEMENTS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de CREER_ETABLS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "CREER_ETABLS" car "UTILISATEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : REJOINDRE_INTERETS
-- ------------------------------------------------------------------------------- 

drop trigger TU_REJOINDRE_INTERETS;

-- Trigger de modification ----------------------------------------------
create trigger TU_REJOINDRE_INTERETS
after update on REJOINDRE_INTERETS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- CENTRE_INTERETS.

     if
          :old.ID_CINT <> :new.ID_CINT or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_REJOINDRE_INTERETS <> :new.ID_REJOINDRE_INTERETS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "CENTRE_INTERETS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_CINT <> :new.ID_CINT or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_REJOINDRE_INTERETS <> :new.ID_REJOINDRE_INTERETS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;

end;
/

drop trigger TI_REJOINDRE_INTERETS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_REJOINDRE_INTERETS
after insert on REJOINDRE_INTERETS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de REJOINDRE_INTERETS 
     -- s'il n'existe pas d'occurrence correspondante dans la table CENTRE_INTERETS.

     select count(*) into numrows
     from CENTRE_INTERETS
     where
          :new.ID_CINT = CENTRE_INTERETS.ID_CINT;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "REJOINDRE_INTERETS" car "CENTRE_INTERETS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de REJOINDRE_INTERETS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "REJOINDRE_INTERETS" car "UTILISATEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : COMMENTAIRES
-- ------------------------------------------------------------------------------- 

drop trigger TU_COMMENTAIRES;

-- Trigger de modification ----------------------------------------------
create trigger TU_COMMENTAIRES
after update on COMMENTAIRES for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_MSG <> :new.ID_MSG or 
          :old.ID_COMMENT <> :new.ID_COMMENT
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- MESSAGES.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_MSG <> :new.ID_MSG or 
          :old.ID_COMMENT <> :new.ID_COMMENT
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "MESSAGES" interdite.');
     end if;

end;
/

drop trigger TI_COMMENTAIRES;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_COMMENTAIRES
after insert on COMMENTAIRES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de COMMENTAIRES 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "COMMENTAIRES" car "UTILISATEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de COMMENTAIRES 
     -- s'il n'existe pas d'occurrence correspondante dans la table MESSAGES.

     select count(*) into numrows
     from MESSAGES
     where
          :new.ID_MSG = MESSAGES.ID_MSG;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "COMMENTAIRES" car "MESSAGES" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : REJOINDRE_GRPS
-- ------------------------------------------------------------------------------- 

drop trigger TU_REJOINDRE_GRPS;

-- Trigger de modification ----------------------------------------------
create trigger TU_REJOINDRE_GRPS
after update on REJOINDRE_GRPS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ACTEUR_USER <> :new.ID_ACTEUR_USER or 
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- GROUPES.

     if
          :old.ID_ACTEUR_USER <> :new.ID_ACTEUR_USER or 
          :old.ID_ACTEUR_GRP <> :new.ID_ACTEUR_GRP
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "GROUPES" interdite.');
     end if;

end;
/

drop trigger TI_REJOINDRE_GRPS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_REJOINDRE_GRPS
after insert on REJOINDRE_GRPS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de REJOINDRE_GRPS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR_USER = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "REJOINDRE_GRPS" car "UTILISATEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de REJOINDRE_GRPS 
     -- s'il n'existe pas d'occurrence correspondante dans la table GROUPES.

     select count(*) into numrows
     from GROUPES
     where
          :new.ID_ACTEUR_GRP = GROUPES.ID_ACTEUR_GRP;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "REJOINDRE_GRPS" car "GROUPES" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : AMIS
-- ------------------------------------------------------------------------------- 

drop trigger TU_AMIS;

-- Trigger de modification ----------------------------------------------
create trigger TU_AMIS
after update on AMIS for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_ACTEUR_1 <> :new.ID_ACTEUR_1 or 
          :old.ID_AMI <> :new.ID_AMI
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_ACTEUR_1 <> :new.ID_ACTEUR_1 or 
          :old.ID_AMI <> :new.ID_AMI
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;

end;
/

drop trigger TI_AMIS;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_AMIS
after insert on AMIS for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de AMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "AMIS" car "UTILISATEURS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de AMIS 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR_1 = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "AMIS" car "UTILISATEURS" n''existe pas.');
     end if;

end;
/



-- ------------------------------------------------------------------------------- 
--   Table : CURSUSES
-- ------------------------------------------------------------------------------- 

drop trigger TU_CURSUSES;

-- Trigger de modification ----------------------------------------------
create trigger TU_CURSUSES
after update on CURSUSES for each row
declare numrows INTEGER;
begin

     -- Interdire la modification de la clé étrangère référençant la table 
     -- ETABLISSEMENTS.

     if
          :old.ID_ETABL <> :new.ID_ETABL or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_CURSUS <> :new.ID_CURSUS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "ETABLISSEMENTS" interdite.');
     end if;
     -- Interdire la modification de la clé étrangère référençant la table 
     -- UTILISATEURS.

     if
          :old.ID_ETABL <> :new.ID_ETABL or 
          :old.ID_ACTEUR <> :new.ID_ACTEUR or 
          :old.ID_CURSUS <> :new.ID_CURSUS
     then
               raise_application_error(
               -20008,
               'Modification de la clé étrangère référençant "UTILISATEURS" interdite.');
     end if;

end;
/

drop trigger TI_CURSUSES;

-- Trigger d'insertion ----------------------------------------------
create trigger TI_CURSUSES
after insert on CURSUSES for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de CURSUSES 
     -- s'il n'existe pas d'occurrence correspondante dans la table ETABLISSEMENTS.

     select count(*) into numrows
     from ETABLISSEMENTS
     where
          :new.ID_ETABL = ETABLISSEMENTS.ID_ETABL;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "CURSUSES" car "ETABLISSEMENTS" n''existe pas.');
     end if;
     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de CURSUSES 
     -- s'il n'existe pas d'occurrence correspondante dans la table UTILISATEURS.

     select count(*) into numrows
     from UTILISATEURS
     where
          :new.ID_ACTEUR = UTILISATEURS.ID_ACTEUR;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "CURSUSES" car "UTILISATEURS" n''existe pas.');
     end if;

end;
/

/* Auto-Increment de Acteur */
create sequence S_ACTEURS start with 1 increment by 1;;
select S_ACTEURS.nextval from dual;

create or replace trigger TIB_ACTEURS
before insert on ACTEURS
for each row
begin
		select S_ACTEURS.NEXTVAL into :NEW.id_acteur from DUAL;
end; 
/


/* Auto-Increment de Message */
create sequence S_MESSAGES start with 1 increment by 1;;
select S_MESSAGES.nextval from dual;

create or replace trigger TIB_MESSAGES
before insert on MESSAGES
for each row
begin
		select S_MESSAGES.NEXTVAL into :NEW.id_msg from DUAL;
end; 
/

/* Auto-Increment de Amis */
create sequence S_AMIS start with 1 increment by 1;;
select S_AMIS.nextval from dual;

create or replace trigger TIB_AMIS
before insert on AMIS
for each row
begin
		select S_AMIS.NEXTVAL into :NEW.id_ami from DUAL;
end;
/

/* Auto-Increment de Demande_Amis */
create sequence S_DEMANDE_AMIS start with 1 increment by 1;;
select S_DEMANDE_AMIS.nextval from dual;

create or replace trigger TIB_DEMANDE_AMIS
before insert on DEMANDE_AMIS
for each row
begin
		select S_DEMANDE_AMIS.NEXTVAL into :NEW.id_demande from DUAL;
end; 
/