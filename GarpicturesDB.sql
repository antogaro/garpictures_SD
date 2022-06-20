CREATE SCHEMA IF NOT EXISTS Garpictures;
use Garpictures;

CREATE TABLE IF NOT EXISTS Garpictures.utente(
    Id int NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(30) NOT NULL,
   Cognome VARCHAR(30) NOT NULL,
   Nome_Utente VARCHAR(30) NOT NULL,
   Password VARCHAR(50) NOT NULL,
   Indirizzo VARCHAR(50) ,
   Provincia  VARCHAR(2),
  Telefono  VARCHAR(10) ,
   Città  VARCHAR(30),
   Amministratore Boolean NOT NULL,
   email VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id)
    );
    
CREATE TABLE IF NOT EXISTS Garpictures.prodotto(
     Id int NOT NULL AUTO_INCREMENT,
     Nome VARCHAR(100),
     Src VARCHAR(50),
     Prezzo float,
	  Descrizione VARCHAR(200),
     primary key(Id)
);

CREATE TABLE IF NOT EXISTS Garpictures.tag(
      Nome_tag VARCHAR(50),
      primary key(Nome_tag)
);

CREATE TABLE IF NOT EXISTS Garpictures.tag_prodotto(
	Id INT NOT NULL AUTO_INCREMENT,
    Nome_tag VARCHAR(50),
    Id_prodotto INT,
    PRIMARY KEY(Id),
    FOREIGN KEY(Nome_tag) REFERENCES Garpictures.tag(Nome_tag) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(Id_prodotto) REFERENCES Garpictures.prodotto(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

    

CREATE TABLE IF NOT EXISTS Garpictures.carrello(
   entry INT NOT NULL AUTO_INCREMENT,
   utente_id INT NOT NULL,
  prodotto_id INT NOT NULL,
  data VARCHAR(45) NULL DEFAULT NULL,
  FOREIGN KEY(utente_id) REFERENCES Garpictures.utente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(prodotto_id) REFERENCES garpictures.prodotto(Id) ON UPDATE CASCADE ON DELETE CASCADE,
  PRIMARY KEY(entry)
);

INSERT INTO utente(Nome, Cognome, Nome_Utente, Password, Indirizzo, Provincia, Telefono, Città,Amministratore,email) VALUES
("Antonio","Garofalo","Antgar","Antgar","via de regio", "SA", "3515815151", "Battipaglia",true,"garofalo.antonio1995@gmail.com"),
("Cosimo","Maio","Cosmai","Cosmai","Via Carli", "BN","3948534965","Benevento",false,"maio.cosimo1995@gmail.com"),
("Carmine","Furecchi","Carfur","Carfur","Via Barletta", "BN","3648231915","S.Giorgio del Sannio",false,"furecchi.carmine@gmail.com"),
("Ugo","Dan","Ugodan","Ugodan","Via Bar", "NA","3983231265","Napoli",false,"dan.ugo@gmail.com"),
("Giuseppe","Esuli","Giuesu","Giuesu","Via Morossi", "SA","3394725482","Salerno",false,"esuli.giuseppe@gmail.com"),
("Galileo","Eravolo","Galera","Galera","Via Giesenne", "BN","2283746123","Benevento",false,"eravolo.galileo@gmail.com"),
("Davide","Olobano","Davolo","Davolo","Via Erpi", "NA","3948327182","Napoli",false,"daviolo@unisa.it"),
("Luigi","Gilardi","Luigil","Luigil","Via Mario Rossi", "NA","3384736273","Napoli",false,"luigi@libero.com"),
("Sofia","Banni","Sofban","Sofban","Via Bartolo", "SA","2281738123","Battipaglia",false,"sofia.banni@studenti.unisa.it"),
("Cosimo","Imola","Cosimo","Cosimo","Via Coipe", "SA","2343756223","Salerno",false,"cosimola@gmail.com"),
("Ester","Atevola","Estate","Estate","Via del Sole", "BN","3392847382","Benevento",false,"estervola@email.it"),
("Gianfranco","Bellarosse","Giabel","Giabel","via Sansa", "SA", "3215415761", "Salerno",false,"gianfraco.bellarosse@pec.it");

INSERT INTO tag(Nome_tag) VALUES("cibo"),("acqua"),("paesaggio"),("musica"),("studio"),("persone"),("notte"),("luminoso"), ("animali"),("primo piano"),("prato");

INSERT INTO prodotto(Nome, Src, Prezzo, Descrizione) VALUES
("Gatto soriano", "animal1.png",15.50, "Primo piano di un simpatico gatto."),
("Leonessa","animal2.png",12,"Una leonessa che beve."),
("Leone e leonessa","animal3.png",18.50,"Un leone e una leonessa che interagiscono."),
("Cucciolo","animal4.png",7,"Un simpatico cucciolo di pastore tedesco che corre su un prato"),
("Coccordillo","animal5.png",16,"Un coccodrillo che si aggira minaccioso sulla superfice dell'acqua"),
("Cane al sole","animal6.png",9,"Un pastore tedesco che prende il sole sul prato."),
("Cane che gioca","animal7.png",6,"Un cane che si diverte"),
("Luci","bright1.png",13,"Delle luci che provocano un piacevole effetto ottico."),
("Riflesso","bright2.png",15,"Il sole che provoca un piacevole riflesso sulla carrozzeria."),
("Gabbiani al tramonto","bright3.png",11.50,"Dei gabbiani si aggirano nel cielo durante il tramonto."),
("Gabbiani stanchi","bright4.png",8,"Dei gabbiani si riposano sui tronchi."),
("Cielo con nuvole","bright5.png",10,"Un immenso cielo."),
("Nuvola","bright6.png",7,"Una nuvola a forma di cuore."),
("Panino","food1.png",7,"Primo piano di un panino."),
("Sushi","food2.png",5,"Un gustoso piatto di sushi"),
("Prateria autunnale","landscape1.png",17.50,"Una prateria con sfumature di colori autunnali."),
("Adansonia","landscape2.png",9,"Un baobab in tutta la sua magnificenza"),
("Tundra","landscape3.png",15,"Una foresta ricoperta dalla neve."),
("Prateria","landscape4.png",12,"Una prateria piena di colori."),
("Dolomiti","landscape5.png",16.50,"Una maestosa montagna specchiata sul lago."),
("Pentagramma","music1.png",8,"Primo piano di un pentagramma."),
("Concerto","music2.png",5,"Dei signori anziani che suonano."),
("Flauto","music3.png",10,"Un flauto adagiato sul pentagramma."),
("Porto","night2.png",7,"Un porto durante la notte."),
("Big ben","night3.png",7.90,"La magnifica Londra che mostra i suoi colori notturni."),
("Città su mare","night4.png",4,"La vista di una città che si rispecchia sul mare notturno."),
("Tempio","night5.png",6.55,"Un tempio illuminato da luci artificiali."),
("Ragazza","people1.png",7.40,"Primo piano di una ragazza che probabilmente non ha passato basi di dati"),
("Gioia","people2.png",3,"Tre ragazzi che saltellano contenti."),
("Signora","people3.png",2,"Una signora anziana passeggia in un parco."),
("Nonno","people4.png",7,"Un nonno che tiene in braccio sua nipote."),
("Madre e figlia","people5.png",6,"Una madre nativa americana e sua figlia su una collina."),
("Pub","people6.png",4,"Dei giovani che trascorrono del tempo in un pub."),
("Anatomia","study1.png",5.50,"Un libro di anatomia."),
("Studio","study2.png",4,"Confusionari appunti di matematica.");

INSERT INTO tag_prodotto(Nome_tag,Id_prodotto) VALUES
("animali",1),("primo piano",1),("animali",2),("animali",3),("animali",4),("prato",4),("animali",5),("notte",5),
("animali",6),("prato",6),("luminoso",6),("animali",7),("luminoso",8),("luminoso",9),("luminoso",10),("animali",10),
("luminoso",11),("animali",11),("luminoso",12),("paesaggio",12),("luminoso",13),("cibo",14),("primo piano",14),
("cibo",15),("paesaggio",16),("luminoso",16),("paesaggio",17),("acqua",17),("paesaggio",18),("paesaggio",19),
("paesaggio",20),("acqua",20),("musica",21),("musica",22),("primo piano",21),("persone",22),("musica",23),
("notte",24),("notte",25),("notte",26),("notte",27),("luminoso",27),("luminoso",25),
("persone",28),("primo piano",28),("persone",29),("persone",30),("persone",31),("persone",32),("prato",32),("persone",33),("notte",33),
("studio",34),("primo piano",34),("studio",35);
