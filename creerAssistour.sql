DROP DATABASE IF EXISTS Assistour ;
CREATE DATABASE Assistour ;

USE Assistour ;


        
CREATE TABLE Adhérent
(
  numAdherent        INTEGER      NOT NULL,
  nomAdherent        VARCHAR(200) NULL    ,
  prenomAdherent     VARCHAR(200) NULL    ,
  codePostalAdherent VARCHAR(200) NULL    ,
  villeAdherent      VARCHAR(200) NULL    ,
  telephoneAdherent  VARCHAR(200) NULL    ,
  idTypeContrat      INTEGER      NOT NULL,
  PRIMARY KEY (numAdherent)
);

CREATE TABLE CompagnieTransport
(
  idCompagnie  INTEGER      NOT NULL,
  nomCompagnie VARCHAR(200) NOT NULL,
  PRIMARY KEY (idCompagnie)
);

CREATE TABLE contacter
(
  num  INTEGER NOT NULL,
  idTA INTEGER NOT NULL
);

CREATE TABLE EtapeRapatriement
(
  numOrdre        INTEGER      NOT NULL,
  cout            DECIMAL      NULL    ,
  villeDepart     VARCHAR(200) NULL    ,
  villeArrive     VARCHAR(200) NULL    ,
  horaireDepart   DATETIME     NULL    ,
  horaireArrive   DATETIME     NULL    ,
  num             INT          NOT NULL,
  idCompagnie     INTEGER      NOT NULL,
  idModeTransport INTEGER      NOT NULL,
  PRIMARY KEY (numOrdre)
);

CREATE TABLE Garage
(
  num     INTEGER      NOT NULL,
  nom     VARCHAR(200) NULL    ,
  adresse VARCHAR(200) NULL    ,
  tel     VARCHAR(200) NULL    ,
  marque  VARCHAR(200) NULL     DEFAULT NULL,
  prix    DECIMAL      NULL    ,
  avance  BOOLEAN      NULL    ,
  idTA    INTEGER      NOT NULL,
  PRIMARY KEY (num)
);

CREATE TABLE Hotels
(
  numHotel       INTEGER      NOT NULL,
  nomHotel       VARCHAR(200) NULL    ,
  adresseHotel   VARCHAR(200) NULL    ,
  telephoneHotel VARCHAR(200) NULL    ,
  prixNuit       DECIMAL      NULL    ,
  nbNuitAffecte  INTEGER      NULL    ,
  PRIMARY KEY (numHotel)
);

CREATE TABLE loger
(
  numHotel INTEGER NOT NULL,
  num      INT     NOT NULL
);

CREATE TABLE ModeTransport
(
  idModeTransport      INTEGER      NOT NULL,
  libelleModeTransport VARCHAR(200) NULL    ,
  PRIMARY KEY (idModeTransport)
);

CREATE TABLE proposer
(
  idCompagnie     INTEGER NOT NULL,
  idModeTransport INTEGER NOT NULL
);

CREATE TABLE Sinistre
(
  num             INT          NOT NULL,
  date            DATE         NULL    ,
  heure           TIME         NULL    ,
  cause           VARCHAR(200) NULL    ,
  diagnostic      VARCHAR(200) NULL    ,
  nbPersonnes     INT          NULL    ,
  idTA            INTEGER      NOT NULL,
  immatriculation INTEGER      NOT NULL,
  PRIMARY KEY (num)
);

CREATE TABLE TechnicienAssistance
(
  idTA     INTEGER     NOT NULL,
  nomTa    VARCHAR(50) NULL    ,
  prenomTa VARCHAR(50) NULL    ,
  PRIMARY KEY (idTA)
);

CREATE TABLE TypeContrat
(
  idTypeContrat  INTEGER      NOT NULL,
  nomTypeContrat VARCHAR(200) NULL    ,
  PRIMARY KEY (idTypeContrat)
);

CREATE TABLE Vehicule
(
  immatriculation       INTEGER      NOT NULL,
  marque                VARCHAR(200) NULL    ,
  type                  VARCHAR(200) NULL    ,
  modele                VARCHAR(200) NULL    ,
  dateMiseEnCirculation DATE         NULL    ,
  tarif                 DECIMAL      NULL    ,
  dateSouscription      DATE         NULL    ,
  numAdherent           INTEGER      NOT NULL,
  idTypeContrat         INTEGER      NOT NULL,
  PRIMARY KEY (immatriculation)
);

ALTER TABLE Sinistre
  ADD CONSTRAINT FK_TechnicienAssistance_TO_Sinistre
    FOREIGN KEY (idTA)
    REFERENCES TechnicienAssistance (idTA);

ALTER TABLE Vehicule
  ADD CONSTRAINT FK_Adhérent_TO_Vehicule
    FOREIGN KEY (numAdherent)
    REFERENCES Adhérent (numAdherent);

ALTER TABLE Vehicule
  ADD CONSTRAINT FK_TypeContrat_TO_Vehicule
    FOREIGN KEY (idTypeContrat)
    REFERENCES TypeContrat (idTypeContrat);

ALTER TABLE Sinistre
  ADD CONSTRAINT FK_Vehicule_TO_Sinistre
    FOREIGN KEY (immatriculation)
    REFERENCES Vehicule (immatriculation);

ALTER TABLE contacter
  ADD CONSTRAINT FK_Garage_TO_contacter
    FOREIGN KEY (num)
    REFERENCES Garage (num);

ALTER TABLE contacter
  ADD CONSTRAINT FK_TechnicienAssistance_TO_contacter
    FOREIGN KEY (idTA)
    REFERENCES TechnicienAssistance (idTA);

ALTER TABLE loger
  ADD CONSTRAINT FK_Hotels_TO_loger
    FOREIGN KEY (numHotel)
    REFERENCES Hotels (numHotel);

ALTER TABLE loger
  ADD CONSTRAINT FK_Sinistre_TO_loger
    FOREIGN KEY (num)
    REFERENCES Sinistre (num);

ALTER TABLE EtapeRapatriement
  ADD CONSTRAINT FK_Sinistre_TO_EtapeRapatriement
    FOREIGN KEY (num)
    REFERENCES Sinistre (num);

ALTER TABLE EtapeRapatriement
  ADD CONSTRAINT FK_CompagnieTransport_TO_EtapeRapatriement
    FOREIGN KEY (idCompagnie)
    REFERENCES CompagnieTransport (idCompagnie);

ALTER TABLE proposer
  ADD CONSTRAINT FK_CompagnieTransport_TO_proposer
    FOREIGN KEY (idCompagnie)
    REFERENCES CompagnieTransport (idCompagnie);

ALTER TABLE proposer
  ADD CONSTRAINT FK_ModeTransport_TO_proposer
    FOREIGN KEY (idModeTransport)
    REFERENCES ModeTransport (idModeTransport);

ALTER TABLE EtapeRapatriement
  ADD CONSTRAINT FK_ModeTransport_TO_EtapeRapatriement
    FOREIGN KEY (idModeTransport)
    REFERENCES ModeTransport (idModeTransport);

        
      