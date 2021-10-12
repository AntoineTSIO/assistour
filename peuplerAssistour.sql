use Assistour ;

INSERT INTO Adhérent (numAdherent, nomAdherent, prenomAdherent, codePostalAdherent, villeAdherent, telephoneAdherent, idTypeContrat) VALUES
(1,'IVANOVITCH','Sacha','75003','Paris III','06-92-88-29-53',3),
(2,'BELKACEM','Marwan','75016','Paris XVI','06-73-93-99-05',2);

INSERT INTO TypeContrat (idTypeContrat, nomTypeContrat) VALUES
(1,'Tous Risques'),
(2,'Tous Risques ECO'),
(3,'Plénitude');