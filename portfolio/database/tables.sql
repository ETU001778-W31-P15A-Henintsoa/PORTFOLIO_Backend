-- DATABASE : PORTFOLIO
-- UTILISATEUR
CREATE TABLE IF NOT EXISTS utilisateur (
    idutilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(90) NOT NULL,
    prenom VARCHAR(60) NOT NULL,
    adresse VARCHAR(60) NOT NULL,
    dtn DATE UNIQUE NOT NULL,
    mail VARCHAR(30) UNIQUE NOT NULL,
    tel VARCHAR(90) NOT NULL,
    mdp VARCHAR(15) NOT NULL,
    etat INT default 0,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- PHOTOPROFILS
CREATE TABLE IF NOT EXISTS photoprofil (
    idphotoprofil SERIAL PRIMARY KEY,
    lien VARCHAR(60) NOT NULL,
    idutilisateur INT NOT NULL,
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur)
);

-- TYPEPOSTE
CREATE TABLE IF NOT EXISTS typeposte (
    idtypeposte SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EXPERIENCE
CREATE TABLE IF NOT EXISTS experience (
    idexperience SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    idtypeposte INT NOT NULL,
    description TEXT NOT NULL,
    etablissement VARCHAR(60) NOT NULL,
    dtnd DATE NOT NULL,
    dtnf DATE NOT NULL,
    idutilisateur INT NOT NULL, 
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur),
    FOREIGN KEY (idtypeposte) REFERENCES typeposte(idtypeposte)
);

-- TECHNOLOGIE
CREATE TABLE IF NOT EXISTS technologie (
    idtechnologie SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- HCOMPETENCE
CREATE TABLE IF NOT EXISTS hcompetence (
    idhcompetence SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    pourcentage FLOAT NOT NULL,
    idutilisateur INT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur)
);

-- SCOMPETENCE
CREATE TABLE IF NOT EXISTS scompetence (
    idscompetence SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    pourcentage FLOAT NOT NULL,
    idutilisateur INT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur)
);

-- FORMATION
CREATE TABLE IF NOT EXISTS formation (
    idformation SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    dtnd DATE NOT NULL,
    dtnf DATE NOT NULL,
    Etablissement VARCHAR(60) NOT NULL,
    idutilisateur INT NOT NULL,
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur)
);

-- TYPETECHNO 
CREATE TABLE IF NOT EXISTS typetechno (
    idtypetechno SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--  EXPTECHNO 
CREATE TABLE IF NOT EXISTS exptechno (
    idexptechno SERIAL PRIMARY KEY,
    idexperience INT NOT NULL,
    idtechnologie INT NOT NULL,
    idtypetechno INT NOT NULL,
    FOREIGN KEY (idexperience) REFERENCES experience(idexperience),
    FOREIGN KEY (idtechnologie) REFERENCES technologie(idtechnologie)
);

-- PROJET
CREATE TABLE IF NOT EXISTS projet (
    idprojet SERIAL PRIMARY KEY,
    libelle VARCHAR(60) NOT NULL,
    description TEXT NOT NULL,
    liengit VARCHAR(60) NOT NULL,
    lienweb VARCHAR(60) NOT NULL,
    realisation INT NOT NULL,
    nbdev INT NOT NULL,
    idutilisateur INT NOT NULL,
    etat INT NOT NULL,
    cd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idutilisateur) REFERENCES utilisateur(idutilisateur)
);

-- PROJETTECHNO
CREATE TABLE IF NOT EXISTS projettechno (
    idprojettechno SERIAL PRIMARY KEY,
    idprojet INT NOT NULL,
    idtechnologie INT NOT NULL,
    idtypetechno INT NOT NULL,
    FOREIGN KEY (idprojet) REFERENCES projet(idprojet),
    FOREIGN KEY (idtechnologie) REFERENCES technologie(idtechnologie)
);

-- IMGPROJET
CREATE TABLE IF NOT EXISTS imgprojet (
    idimgprojet SERIAL PRIMARY KEY,
    lien VARCHAR(60) NOT NULL,
    idprojet INT NOT NULL,
    FOREIGN KEY (idprojet) REFERENCES projet(idprojet)
);

-- FONCTIONNALITE
CREATE TABLE IF NOT EXISTS fonctionnalite ( 
    idfonctionnalite SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    idprojet INT NOT NULL,
    FOREIGN KEY (idprojet) REFERENCES projet(idprojet)
);

-- VIDPROJET
CREATE TABLE IF NOT EXISTS vidprojet (  
    idvidprojet SERIAL PRIMARY KEY,
    lien VARCHAR(30) NOT NULL,
    idprojet INT NOT NULL,
    FOREIGN KEY (idprojet) REFERENCES projet(idprojet)
);

