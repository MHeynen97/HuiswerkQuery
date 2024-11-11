CREATE TABLE IF NOT EXISTS gebruiker
(
	username VARCHAR PRIMARY KEY,
	password VARCHAR, 
	adres VARCHAR,
	functie VARCHAR,
	loonchaal int,
	vakantiedagen int
);

INSERT INTO public.gebruiker(
	username, password, adres, functie, loonchaal, vakantiedagen)
	VALUES ('PietjePuk', 1958, 'Van de PetteFlat', 'Postbode', 12, 180);

INSERT INTO public.gebruiker(
	username, password, adres, functie, loonchaal, vakantiedagen)
	VALUES ('Merel', '123456789', 'Rotterdam', 'Student', 0, 356);

INSERT INTO public.gebruiker(
	username, password, adres, functie, loonchaal, vakantiedagen)
	VALUES ('Nugget', 'The goodest boy', 'Rotterdam', 'Hond', 0, 356);


CREATE TABLE IF NOT EXISTS Product
(
	productID bigint NOT NULL,
	name VARCHAR, 
	brand VARCHAR,
	price FLOAT,
	currentStock int,
	sold int,
	dateSold DATE,
	type VARCHAR,
	CONSTRAINT product_pkey PRIMARY KEY (productID)
);

INSERT INTO public.product(
	productID, name, brand, price, currentstock, sold, datesold, type)
	VALUES (1,'SA729W1', 'Samsung', 3957, 99, 1, '2024-11-11' , 'Flatscreen');

INSERT INTO public.product(
	productID, name, brand, price, currentstock, sold, datesold, type)
	VALUES (2,'LGnueinf&37jnf', 'LG', 9587, 10, 5, '2024-07-11' , 'Flatscreen');

INSERT INTO public.product(
	productID, name, brand, price, currentstock, sold, datesold, type)
	VALUES (3,'PHnfiyge673', 'PHILLIPS', 1457, 80, 1, '2024-01-11' , 'Flatscreen');


DROP TABLE IF EXISTS Television;
CREATE TABLE Television
(
	tvID BIGINT PRIMARY KEY,
	height FLOAT,
	width FLOAT, 
	schermKwaliteit VARCHAR,
	schermType VARCHAR,
	wifi BOOL,
	smarTV BOOL,
	VoiceControl BOOL,
	HDR BOOL,
	FOREIGN KEY (tvID) REFERENCES Product (productID)
);

INSERT INTO public.television(
	tvID, height, width, schermkwaliteit, schermtype, wifi, smartv, voicecontrol, hdr)
	VALUES (1, 19, 25, '40K', 'LCD', True, True, True, True);

INSERT INTO public.television(
	tvID, height, width, schermkwaliteit, schermtype, wifi, smartv, voicecontrol, hdr)
	VALUES (2, 75, 90, '720p', 'LCD', False, True, False, False);

INSERT INTO public.television(
	tvID, height, width, schermkwaliteit, schermtype, wifi, smartv, voicecontrol, hdr)
	VALUES (3, 78, 35, '10K', 'LCD', True, False, True, True);

DROP TABLE IF EXISTS RemoteController;
CREATE TABLE RemoteController
(
	controllerID BIGINT PRIMARY KEY,
	smart BOOL,
	batteryType VARCHAR,
	FOREIGN KEY (controllerID) REFERENCES Product (productID)
);

INSERT INTO public.remotecontroller(
	controllerID, smart, batterytype)
	VALUES (1, True, 'AA');

INSERT INTO public.remotecontroller(
	controllerID, smart, batterytype)
	VALUES (2, False, 'AAA');

INSERT INTO public.remotecontroller(
	controllerID, smart, batterytype)
	VALUES (3, True, 'D');


DROP TABLE IF EXISTS CIModule;
CREATE TABLE CIModule
(
	moduleID BIGINT PRIMARY KEY,
	provider VARCHAR,
	encoding VARCHAR,
	FOREIGN KEY (moduleID) REFERENCES Product (productID)
);

INSERT INTO public.cimodule(
	moduleID, provider, encoding)
	VALUES (1, 'KPN', 'UTF:8');

INSERT INTO public.cimodule(
	moduleID, provider, encoding)
	VALUES (2, 'ODIDO', 'UTF:8');

INSERT INTO public.cimodule(
	moduleID, provider, encoding)
	VALUES (3, 'Ziggo', 'UTF:8');

DROP TABLE IF EXISTS WallBracket;
CREATE TABLE WallBracket
(
	bracketID BIGINT PRIMARY KEY,
	adjustable BOOL,
	bevestigingsmethode VARCHAR,
	height FLOAT,
	width FLOAT,
	FOREIGN KEY (bracketID) REFERENCES Product (productID)
);

INSERT INTO public.wallbracket(
	bracketID, adjustable, bevestigingsmethode, height, width)
	VALUES (1, True, 'Muur Beugel', 35, 40);

INSERT INTO public.wallbracket(
	bracketID, adjustable, bevestigingsmethode, height, width)
	VALUES (2, False, 'Schuif', 70, 90);

INSERT INTO public.wallbracket(
	bracketID, adjustable, bevestigingsmethode, height, width)
	VALUES (3, True, 'Arm', 814, 913);

--! Tabellen aangemaakt voor de relaties !--
CREATE TABLE Television_WallBracket (
    tvID BIGINT,
    bracketID BIGINT,
    PRIMARY KEY (tvID, bracketID),
    FOREIGN KEY (tvID) REFERENCES Television(tvID),
    FOREIGN KEY (bracketID) REFERENCES WallBracket(bracketID)
);

INSERT INTO public.television_WallBracket(
	tvid, bracketID)
	VALUES (2, 1);

INSERT INTO public.television_WallBracket(
	tvid, bracketID)
	VALUES (3, 3);

INSERT INTO public.television_WallBracket(
	tvid, bracketID)
	VALUES (1, 2);

CREATE TABLE Television_RemoteController (
    tvID BIGINT,
    controllerID BIGINT,
    PRIMARY KEY (tvID, controllerID),
    FOREIGN KEY (tvID) REFERENCES Television(tvID),
    FOREIGN KEY (controllerID) REFERENCES RemoteController(controllerID)
);

INSERT INTO public.television_remotecontroller(
	tvid, controllerid)
	VALUES (1, 2);

INSERT INTO public.television_remotecontroller(
	tvid, controllerid)
	VALUES (3, 3);

INSERT INTO public.television_remotecontroller(
	tvid, controllerid)
	VALUES (2, 1);


CREATE TABLE Television_CIModule (
    tvID BIGINT,
    moduleID BIGINT,
    PRIMARY KEY (tvID, moduleID),
    FOREIGN KEY (tvID) REFERENCES Television(tvID),
    FOREIGN KEY (moduleID) REFERENCES CIModule(moduleID)
);

INSERT INTO public.television_cimodule(
	tvid, moduleid)
	VALUES (2, 3);

INSERT INTO public.television_cimodule(
	tvid, moduleid)
	VALUES (1, 1);

INSERT INTO public.television_cimodule(
	tvid, moduleid)
	VALUES (1, 3);

INSERT INTO public.television_cimodule(
	tvid, moduleid)
	VALUES (3, 2);