--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-04-26 01:05:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


-- ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 33005)
-- Name: operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation (
    id integer NOT NULL,
    title character varying(255),
    label character varying(255),
    key_letter character varying(100),
    coeff numeric(4,2)
);


ALTER TABLE public.operation OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33027)
-- Name: operation_param; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operation_param (
    id integer NOT NULL,
    id_operation integer,
    id_question_answer integer
);


ALTER TABLE public.operation_param OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33012)
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    label character varying(100)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33017)
-- Name: question_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_answer (
    id integer NOT NULL,
    id_question integer,
    label character varying(100)
);


ALTER TABLE public.question_answer OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24591)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    password character varying(100)
);

--
-- TOC entry 4712 (class 2606 OID 33031)
-- Name: operation_param operation_param_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_param
    ADD CONSTRAINT operation_param_pkey PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 33011)
-- Name: operation operation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 33021)
-- Name: question_answer question_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answer
    ADD CONSTRAINT question_answer_pkey PRIMARY KEY (id);


--
-- TOC entry 4708 (class 2606 OID 33016)
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 24595)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 33032)
-- Name: operation_param operation_param_id_operation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_param
    ADD CONSTRAINT operation_param_id_operation_fkey FOREIGN KEY (id_operation) REFERENCES public.operation(id);


--
-- TOC entry 4715 (class 2606 OID 33037)
-- Name: operation_param operation_param_id_question_answer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operation_param
    ADD CONSTRAINT operation_param_id_question_answer_fkey FOREIGN KEY (id_question_answer) REFERENCES public.question_answer(id);


--
-- TOC entry 4713 (class 2606 OID 33017)
-- Name: question_answer question_answer_id_question_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answer
    ADD CONSTRAINT question_answer_id_question_fkey FOREIGN KEY (id_question) REFERENCES public.question(id);

-- Assurez-vous que les ID utilisés ici ne sont pas déjà en usage dans votre base de données actuelle.
INSERT INTO public.operation (id, title, label, key_letter, coeff) VALUES 
(3, 'Réeducation dans le cadre de la prise en charge de la lombalgie commune', 'AMS', 'RAM', 7.49),
(4, 'Réeducation des conséquences d''une affection du rachis lombo-sacré hors référentiel sans chirurgie', 'AMS', 'RAM', 7.51),
(5, 'Réeducation des conséquences d''une affection du rachis lombo-sacré hors référentiel avec chirurgie', 'AMS', 'RAO', 7.49),
(6, 'Réeducation des conséquences d''une affection du rachis dorsal hors référentiel sans chirurgie', 'AMS', 'RAM', 7.50),
(7, 'Réeducation des conséquences d''une affection du rachis dorsal hors référentiel avec chirurgie', 'AMS', 'RAO', 7.48),
(8, 'Rééducation dans le cadre d''un traumatisme recent d''une cervicalgie sans atteinte neurologique', 'AMS', 'RAM', 7.48),
(9, 'Rééducation des concéquences d''une affection du rachis cervical sans chirurgie', 'AMS', 'RAM', 7.52),
(10, 'Rééducation des concéquences d''une affection du rachis cervical avec chirurgie', 'AMS', 'RAO', 7.50),
(11, 'Rééducation des concéquences d''une affection d''au moins 2 segments du rachis sans chirurgie', 'AMS', 'RAM', 7.53),
(12, 'Rééducation des concéquences d''une affection d''au moins 2 segments du rachis avec chirurgie sur au moins un segment', 'AMS', 'RAO', 7.51),
(14, 'Réeducation après libération du nerf médian au canal carpien', 'AMS', 'RSC', 7.49),
(15, 'Réeducation d''une affection du poignet ou main non opérée', 'AMS', 'VSM', 7.50),
(16, 'Réeducation d''une affection du poignet ou main opérée', 'AMS', 'VSC', 7.51),
(17, 'Réeducation des conséquences d''une fracture de l''extremité distale des deux os de l''avant bras opéré', 'AMS', 'RSC', 7.50),
(18, 'Réeducation des conséquences d''une fracture de l''extremité distale des deux os de l''avant bras non opéré', 'AMS', 'RSM', 7.51),
(19, 'Réeducation des conséquences d''une fracture avec ou sans luxation, non opérée du coude chez un adulte', 'AMS', 'RSM', 7.52),
(20, 'Réeducation des conséquences d''une fracture avec ou sans luxation, opérée du coude chez un adulte', 'AMS', 'RSC', 7.52),
(21, 'Réeducation des conséquences d''une affection du coude ou avant-bras non-opéré', 'AMS', 'VSM', 7.49),
(22, 'Réeducation des conséquences d''une affection du coude ou avant-bras opéré', 'AMS', 'VSC', 7.49),
(23, 'Réeducation dans le cadre d''une tendinopathie de la coiffe des rotateurs non opérée', 'AMS', 'RSM', 7.49),
(24, 'Réeducation après reinsertion et/ou suture d''un ou de plusieurs tendons de la coiffe des rotateurs de l''épaule, par arthroscopie ou abord direct', 'AMS', 'RSC', 7.51),
(25, 'Réeducation des conséquences d''une fracture non opérée de l''eextrémitée proximale de l''humérus', 'AMS', 'RSM', 7.50),
(26, 'Réeducation des conséquences d''une affection de l''épaule ou du bras non opéré', 'AMS', 'VSM', 7.48),
(27, 'Réeducation des conséquences d''une affection de l''épaule ou du bras opérée', 'AMS', 'VSC', 7.50),
(28, 'Réducation secondaire à l''affection d''au moins deux segments du même membre supérieur sans chirurgie', 'AMS', 'VSM', 7.51),
(29, 'Réducation secondaire à l''affection d''au moins deux segments du même membre supérieur avec chirurgie sur au moins un segment', 'AMS', 'VSC', 7.52),
(31, 'Réeducation des conséquences d''une entorse externe récente de cheville-pied opérée', 'AMS', 'RIC', 7.51),
(32, 'Réeducation des conséquences d''une entorse externe récente de cheville-pied non opérée', 'AMS', 'RIM', 7.50),
(33, 'Réeducation des conséquences d''une affection de cheville ou pied non opérée', 'AMS', 'VIM', 7.50),
(34, 'Réeducation des conséquences d''une affection de cheville ou pied opérée', 'AMS', 'VIC', 7.51),
(35, 'Réeducation après arthroplastie du genou par prothèse totale ou unicompartementaire', 'AMS', 'RIC', 7.52),
(36, 'Réducation après reconstruction du ligament croisé anthérieur du genou', 'AMS', 'RIC', 7.48),
(37, 'Réeducation après minesectomie, isolée, totale, ou sub-totale par arthrosopie', 'AMS', 'RIC', 7.49),
(38, 'Rééducation des conséquences d''une affection du genou ou de la jambe non opéré', 'AMS', 'VIM', 7.51),
(39, 'Rééducation des conséquences d''une affection du genou ou de la jambe opéré', 'AMS', 'VIC', 7.50),
(40, 'Réeducation après arthroplastie de hanche par prothèse totale', 'AMS', 'RIC', 7.50),
(41, 'Réeducation des conséquences d''une affection de la hanche ou de la cuisse non opéré', 'AMS', 'VIM', 7.49),
(42, 'Réeducation secondaire à affection de la hanche ou de la cuisse opéré', 'AMS', 'VIC', 7.49),
(43, 'Rééducation secondaire à l''affection d''au moins 2 segments du même membre inferieur sans chirurgie', 'AMS', 'VIM', 7.52),
(44, 'Rééducation secondaire à l''affection d''au moins 2 segments du même membre inferieur avec chirurgie sur au moins un segment', 'AMS', 'VIC', 7.52),
(46, 'Rééducation secondaire à l''affection d''au moins 2 territoires lésées sans chirurgie', 'AMS', 'TER', 9.49),
(47, 'Rééducation secondaire à l''affection d''au moins 2 territoires lésées avec chirurgie sur au moinsun territoire', 'AMS', 'TER', 9.51),
(49, 'Rééducation pour déviation du rachis lombo-sacré', 'AMS', 'DRA', 7.49),
(50, 'Rééducation pour déviation du rachis dorsal', 'AMS', 'DRA', 7.48),
(51, 'Rééducation pour déviation du rachis cervical', 'AMS', 'DRA', 7.51),
(52, 'Rééducation pour déviation portant sur au moins 2 segments rachis', 'AMS', 'DRA', 7.50),
(54, 'Rééducation d''une amputation d''un membre supérieur', 'AMS', 'APM', 7.51),
(55, 'Rééducation d''une amputation d''un membre inférieur', 'AMS', 'APM', 7.50),
(56, 'Rééducation d''une amputation d''au moins 2 membres', 'AMS', 'APM', 9.50),
(58, 'Atteinte localisée à un membre ou le tronc', 'AMK ou AMC', 'NMI', 8),
(59, 'Atteinte de plusieurs membres ou du tronc et d''un ou plusieurs membres', 'AMK ou AMC', 'NMI', 9.01),
(60, 'Rééducation abdominale pré-opératoire ou post-opératoire', 'AMK ou AMC', 'RAB', 8.01),
(61, 'Rééducation abdominale post-partum', 'AMK ou AMC', 'RAB', 8),
(62, 'Atteinte localisée à un membre ou à la face', 'AMK ou AMC', 'NMI', 8.5),
(63, 'Atteinte intéressant plusieurs membres', 'AMK ou AMC', 'NMI', 10.01),
(64, 'Rééducation de l''hémiplégie', 'AMK ou AMC', 'NMI', 9),
(65, 'Rééducation de la paraplégie et de la tétraplégie', 'AMK ou AMC', 'NMI', 11.01),
(66, 'Localisation des déficiences à un membre et sa racine', 'AMK ou AMC', 'NMI', 8.51),
(67, 'Localisation des déficiences à 2 membres ou plus, ou d''un membre et à tout ou partie du tronc et de la face', 'AMK ou AMC', 'NMI', 10),
(68, 'Rééducation des malades atteints de myopathie', 'AMK ou AMC', 'NMI', 10.99),
(69, 'Rééducation des malades atteints d''encéphalopathie, du stade initial aux conséquences à l''âge adulte', 'AMK ou AMC', 'NMI', 11),
(70, 'Rééducation des enfants présentant une paralysie cérébrale ou un polyhandicap', 'label', 'TER', 16),
(71, 'Rééducation des maladies respiratoire avec désencombrement urgent', 'AMK ou AMC', 'ARL', 8.49),
(72, 'Rééducation des maladies respiratoire obstructives, restrictives ou mixtes', 'AMK ou AMC', 'ARL', 8.5),
(73, 'Rééducation respiratoire préopératoire ou post-opératoire', 'AMK ou AMC', 'ARL', 8.51),
(74, 'Prise en charge kinésithérapeuthique du patient atteint de mucoviscidose', 'AMK ou AMC', 'ARL', 10),
(75, 'Rééducation respiratoire kinésithérapique pour les patients atteints de handicap respiratoire chronique', 'AMK ou AMC', 'ARL', 28),
(76, 'Rééducation respiratoire kinésithérapique pour les patients atteints de handicap respiratoire chronique en prise en charge en groupe', 'AMK ou AMC', 'ARL', 20),
(77, 'Rééducation maxilo-faciale en dehors de la paralysie faciale', 'AMK ou AMC', 'ARL', 7.99),
(78, 'Rééducation vestibulaire et des troubles de l''équilibre', 'AMK ou AMC', 'ARL', 8),
(79, 'Rééducation des troubles de la déglutition isolés', 'AMK ou AMC', 'ARL', 8.01),
(80, 'Rééducation pour athériopathie des membres inférieurs', 'AMK ou AMC', 'RAV', 8.01),
(81, 'Rééducation pour insuffisance veineuse des membres inférieurs avec retentissement articulaire et/ou trouble trophiques', 'AMK ou AMC', 'RAV', 7.99),
(82, 'Rééducation pour lymphoedèmes vraies', 'AMK ou AMC', 'RAV', 8),
(83, 'Rééducation pour un lymphoedème du membre supérieur après traitement du cancer du sein, associé à une rééducation de l''épaule', 'label', 'RAV', 15.5),
(84, 'Supplément pour bandage multicouche : un membre', 'AMK ou AMC', 'RAV', 1),
(85, 'Supplément pour bandage multicouche : deux membres', 'AMK ou AMC', 'RAV', 2),
(86, 'Rééducation périnéale active sous contrôle manuel et/ou électrostimulation et/ou biofeedback', 'AMK ou AMC', 'RAB', 8.5),
(87, 'Rééducation analytique et globale, musculo-articulaire des deux membres inférieurs, de la posture, de l''équilibre et de la coordination chez le sujet âgé', 'AMK ou AMC', 'RPE', 8.5),
(88, 'Rééducation de la déambulation dans le cadre du maintien de l''autonomie de la personne âgée', 'AMK ou AMC', 'RPE', 6),
(89, 'Rééducation d''un patient atteint de brûlures localisées à un membre ou à un segment de membre', 'AMK ou AMC', 'RPB', 8),
(90, 'Rééducation d''un patient atteint de brûlures étendues à plusieurs membres et/ou au tronc', 'AMK ou AMC', 'RPB', 9),
(91, 'Prise en charge dans le cadre de soins palliatifs', 'AMK ou AMC', 'PLL', 12),
(92, 'Rééducation de la paroi abdominale', 'AMK ou AMC', 'RAB', 8),
(93, 'Rééducation abominale post-partum', 'AMK ou AMC', 'RAB', 8),
(96, 'Atteinte localisée à un membre ou à la face', 'AMK ou AMC', 'NMI', 8.5),
(97, 'Atteinte intéressant plusieurs membres', 'AMK ou AMC', 'NMI', 10.01),
(98, 'Rééducation de l''hémiplégie', 'AMK ou AMC', 'NMI', 9),
(99, 'Rééducation de la paraplégie et de la tétraplégie', 'AMK ou AMC', 'NMI', 11.01),
(101, 'Localisation des déficiences à un membre et sa racine', 'AMK ou AMC', 'NMI', 8.51),
(102, 'Localisation des déficiences à 2 membres ou plus, ou d''un membre et à tout ou partie du tronc et de la face', 'AMK ou AMC', 'NMI', 10),
(104, 'Rééducation des malades atteints de myopathie', 'AMK ou AMC', 'NMI', 10.99),
(105, 'Rééducation des malades atteints d''encéphalopathie, du stade initial aux conséquences à l''âge adulte', 'AMK ou AMC', 'NMI', 11),
(106, 'Rééducation des enfants présentant une paralysie cérébrale ou un polyhandicap', 'label', 'TER', 16),
(108, 'Rééducation des maladies respiratoire avec désencombrement urgent (bronchiolite du nourrisson, poussée aiguë au cours d''une pathologie respiratoire chronique)', 'AMK ou AMC', 'ARL', 8.49),
(109, 'Rééducation des maladies respiratoire obstructives, restrictives ou mixtes (en dehors des situations d''urgence)', 'AMK ou AMC', 'ARL', 8.5),
(110, 'Rééducation respiratoire préopératoire ou post opératoire', 'AMK ou AMC', 'ARL', 8.51),
(111, 'Prise en charge kinésithérapeuthique du patient atteint de mucoviscidose', 'AMK ou AMC', 'ARL', 10),
(112, 'Rééducation respiratoire kinésithérapique pour les patients atteints de handicap respiratoire chronique et prise en charge individuelle', 'AMK ou AMC', 'ARL', 28),
(113, 'Rééducation respiratoire kinésithérapique pour les patients atteints de handicap respiratoire chronique en prise en charge en groupe de 2 à 4 personnes avec rééducation respiratoire individuelle', 'AMK ou AMC', 'ARL', 20),
(115, 'Rééducation maxilo-faciale en dehors de la paralysie faciale', 'AMK ou AMC', 'ARL', 7.99),
(116, 'Rééducation vestibulaire et des troubles de l''équilibre', 'AMK ou AMC', 'ARL', 8),
(117, 'Rééducation des troubles de la déglutition isolés', 'AMK ou AMC', 'ARL', 8.01),
(119, 'Rééducation pour athériopathie des membres inférieurs (claudication et trouble trophiques)', 'AMK ou AMC', 'RAV', 8.01),
(120, 'Rééducation pour insuffisance veineuse des membres inférieurs avec retentissement articulaire et/ou trouble trophiques', 'AMK ou AMC', 'RAV', 7.99),
(121, 'Rééducation pour lymphoedèmes vraies (après chirurgie et/ou radiothérapie, lymphéodème congénitaux) par drainage manuel pour un membre ou pour le cou et la face', 'AMK ou AMC', 'RAV', 8),
(122, 'Rééducation pour un lymphoedème du membre supérieur après traitement du cancer du sein, associé à une rééducation de l''épaule homolatérale à la phase intensive du traitement du lymphoedème', 'label', 'RAV', 15.5),
(123, 'Supplément pour bandage multicouche : un membre', 'AMK ou AMC', 'RAV', 1),
(124, 'Supplément pour bandage multicouche : deux membres', 'AMK ou AMC', 'RAV', 2),
(126, 'Rééducation périnéale active sous contrôle manuel et/ou électrostimulation et/ou biofeedback', 'AMK ou AMC', 'RAB', 8.5),
(128, 'Rééducation analytique et globale, musculo-articulaire des deux membres inférieurs, de la posture, de l''équilibre et de la coordination chez le sujet âgé', 'AMK ou AMC', 'RPE', 8.5),
(129, 'Rééducation de la déambulation dans le cadre du maintien de l''autonomie de la personne âgée', 'AMK ou AMC', 'RPE', 6),
(131, 'Rééducation d''un patient atteint de brûlures localisées à un membre ou à un segment de membre', 'AMK ou AMC', 'RPB', 8),
(132, 'Rééducation d''un patient atteint de brûlures étendues à plusieurs membres et/ou au tronc', 'AMK ou AMC', 'RPB', 9),
(134, 'Prise en charge dans le cadre de soins palliatifs, comportant les actes nécessaires en fonction des situations cliniques', 'AMK ou AMC', 'PLL', 12);

INSERT INTO public.question (id, label) VALUES
(1, 'Quelle est la région du corps affectée ?'),
(2, 'Y a-t-il eu chirurgie ?'),
(3, 'Quel est le type de chirurgie réalisée ?'),
(4, 'Quelle est la sévérité de l''affection ?'),
(5, 'L''opération est-elle liée à un traumatisme récent ?'),
(6, 'Quelle est la durée prévue du traitement de rééducation ?'),
(7, 'Le traitement est-il conforme à un référentiel établi ?');

INSERT INTO public.question_answer (id, id_question, label) VALUES
(1, 1, 'Rachis'),
(2, 1, 'Membre supérieur'),
(3, 1, 'Membre inférieur'),
(4, 1, 'Coude'),
(5, 1, 'Poignet/Main'),
(6, 2, 'Oui'),
(7, 2, 'Non'),
(8, 3, 'Arthroplastie'),
(9, 3, 'Reconstruction'),
(10, 3, 'Libération nerveuse'),
(11, 3, 'Suture de tendon'),
(12, 4, 'Légère'),
(13, 4, 'Modérée'),
(14, 4, 'Sévère'),
(15, 5, 'Oui'),
(16, 5, 'Non'),
(17, 6, 'Moins de 10 séances'),
(18, 6, '10 à 20 séances'),
(19, 6, 'Plus de 20 séances'),
(20, 7, 'Conforme'),
(21, 7, 'Hors référentiel'),
(22, 1, 'Epaule'),
(23, 1, 'Cheville/Pied'),
(24, 1, 'Genou'),
(25, 1, 'Hanche/Cuisse'),
(26, 1, 'Poumons'),
(27, 1, 'Tronc'),
(28, 1, 'Corps'),
(29, 1, 'Cervical'),
(30, 3, 'Aucune');


-- Insertions pour l'opération 3
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(1, 3, 1),  -- Région du corps
(2, 3, 6),  -- Chirurgie: Oui
(3, 3, 8),  -- Type de chirurgie: Arthroplastie
(4, 3, 12), -- Sévérité: Légère
(5, 3, 15), -- Traumatisme récent: Oui
(6, 3, 17), -- Durée du traitement: Moins de 10 séances
(7, 3, 20); -- Conformité: Conforme

-- Insertions pour l'opération 4
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(8, 4, 2),  -- Région du corps
(9, 4, 7),  -- Chirurgie: Non
(10, 4, 11),-- Type de chirurgie: Suture de tendon (même si chirurgie est non, pour l'exemple)
(11, 4, 13),-- Sévérité: Modérée
(12, 4, 16),-- Traumatisme récent: Non
(13, 4, 18),-- Durée du traitement: 10 à 20 séances
(14, 4, 21);-- Conformité: Hors référentiel


-- Insertions pour l'opération 5
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(15, 5, 3),  -- Région du corps: Cervical
(16, 5, 6),  -- Chirurgie: Oui
(17, 5, 9),  -- Type de chirurgie: Reconstruction
(18, 5, 14), -- Sévérité: Sévère
(19, 5, 15), -- Traumatisme récent: Oui
(20, 5, 19), -- Durée du traitement: Plus de 20 séances
(21, 5, 20); -- Conformité: Conforme

-- Insertions pour l'opération 6
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(22, 6, 2),  -- Région du corps: Membre supérieur
(23, 6, 7),  -- Chirurgie: Non
(24, 6, 30), -- Type de chirurgie: Aucune (cohérent avec chirurgie non)
(25, 6, 12), -- Sévérité: Légère
(26, 6, 16), -- Traumatisme récent: Non
(27, 6, 17), -- Durée du traitement: Moins de 10 séances
(28, 6, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 7
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(29, 7, 3),  -- Région du corps: Cervical
(30, 7, 6),  -- Chirurgie: Oui
(31, 7, 8),  -- Type de chirurgie: Arthroplastie
(32, 7, 13), -- Sévérité: Modérée
(33, 7, 15), -- Traumatisme récent: Oui
(34, 7, 18), -- Durée du traitement: 10 à 20 séances
(35, 7, 20); -- Conformité: Conforme

-- Insertions pour l'opération 8
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(36, 8, 3),  -- Région du corps: Cervical
(37, 8, 7),  -- Chirurgie: Non
(38, 8, 30), -- Type de chirurgie: Aucune
(39, 8, 14), -- Sévérité: Sévère
(40, 8, 16), -- Traumatisme récent: Non
(41, 8, 19), -- Durée du traitement: Plus de 20 séances
(42, 8, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 9
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(43, 9, 3),  -- Région du corps: Cervical
(44, 9, 6),  -- Chirurgie: Oui
(45, 9, 10), -- Type de chirurgie: Suture de tendon
(46, 9, 12), -- Sévérité: Légère
(47, 9, 15), -- Traumatisme récent: Oui
(48, 9, 17), -- Durée du traitement: Moins de 10 séances
(49, 9, 20); -- Conformité: Conforme

-- Insertions pour l'opération 10
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(50, 10, 3), -- Région du corps: Cervical
(51, 10, 6), -- Chirurgie: Oui
(52, 10, 13),-- Type de chirurgie: Reconstruction
(53, 10, 13),-- Sévérité: Modérée
(54, 10, 15),-- Traumatisme récent: Oui
(55, 10, 18),-- Durée du traitement: 10 à 20 séances
(56, 10, 20);-- Conformité: Conforme

-- Insertions pour l'opération 11
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(57, 11, 2),  -- Région du corps: Membre supérieur
(58, 11, 6),  -- Chirurgie: Oui
(59, 11, 8),  -- Type de chirurgie: Arthroplastie
(60, 11, 14), -- Sévérité: Sévère
(61, 11, 15), -- Traumatisme récent: Oui
(62, 11, 17), -- Durée du traitement: Moins de 10 séances
(63, 11, 20); -- Conformité: Conforme

-- Insertions pour l'opération 12
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(64, 12, 3),  -- Région du corps: Cervical
(65, 12, 7),  -- Chirurgie: Non
(66, 12, 30), -- Type de chirurgie: Aucune
(67, 12, 13), -- Sévérité: Modérée
(68, 12, 16), -- Traumatisme récent: Non
(69, 12, 18), -- Durée du traitement: 10 à 20 séances
(70, 12, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 14
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(78, 14, 5),  -- Région du corps: Poignet/Main
(79, 14, 7),  -- Chirurgie: Non
(80, 14, 30), -- Type de chirurgie: Aucune
(81, 14, 12), -- Sévérité: Légère
(82, 14, 16), -- Traumatisme récent: Non
(83, 14, 17), -- Durée du traitement: Moins de 10 séances
(84, 14, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 15
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(85, 15, 5),  -- Région du corps: Poignet/Main
(86, 15, 6),  -- Chirurgie: Oui
(87, 15, 11), -- Type de chirurgie: Suture de tendon
(88, 15, 14), -- Sévérité: Sévère
(89, 15, 15), -- Traumatisme récent: Oui
(90, 15, 19), -- Durée du traitement: Plus de 20 séances
(91, 15, 20); -- Conformité: Conforme

-- Insertions pour l'opération 16
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(92, 16, 5),  -- Région du corps: Poignet/Main
(93, 16, 6),  -- Chirurgie: Oui
(94, 16, 11), -- Type de chirurgie: Suture de tendon
(95, 16, 13), -- Sévérité: Modérée
(96, 16, 15), -- Traumatisme récent: Oui
(97, 16, 18), -- Durée du traitement: 10 à 20 séances
(98, 16, 20); -- Conformité: Conforme

-- Insertions pour l'opération 17
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(99, 17, 5),  -- Région du corps: Poignet/Main
(100, 17, 6), -- Chirurgie: Oui
(101, 17, 11),-- Type de chirurgie: Suture de tendon
(102, 17, 12),-- Sévérité: Légère
(103, 17, 15),-- Traumatisme récent: Oui
(104, 17, 17),-- Durée du traitement: Moins de 10 séances
(105, 17, 20);-- Conformité: Conforme

-- Insertions pour l'opération 18
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(106, 18, 5),  -- Région du corps: Poignet/Main
(107, 18, 7),  -- Chirurgie: Non
(108, 18, 30), -- Type de chirurgie: Aucune
(109, 18, 14), -- Sévérité: Sévère
(110, 18, 16), -- Traumatisme récent: Non
(111, 18, 18), -- Durée du traitement: 10 à 20 séances
(112, 18, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 19
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(113, 19, 4),  -- Région du corps: Coude
(114, 19, 7),  -- Chirurgie: Non
(115, 19, 30), -- Type de chirurgie: Aucune
(116, 19, 13), -- Sévérité: Modérée
(117, 19, 16), -- Traumatisme récent: Non
(118, 19, 19), -- Durée du traitement: Plus de 20 séances
(119, 19, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 20
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(120, 20, 4),  -- Région du corps: Coude
(121, 20, 6),  -- Chirurgie: Oui
(122, 20, 9),  -- Type de chirurgie: Reconstruction
(123, 20, 12), -- Sévérité: Légère
(124, 20, 15), -- Traumatisme récent: Oui
(125, 20, 17), -- Durée du traitement: Moins de 10 séances
(126, 20, 20); -- Conformité: Conforme

-- Insertions pour l'opération 21
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(127, 21, 4),  -- Région du corps: Coude
(128, 21, 7),  -- Chirurgie: Non
(129, 21, 30), -- Type de chirurgie: Aucune
(130, 21, 13), -- Sévérité: Modérée
(131, 21, 16), -- Traumatisme récent: Non
(132, 21, 18), -- Durée du traitement: 10 à 20 séances
(133, 21, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 22
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(134, 22, 4),  -- Région du corps: Coude
(135, 22, 6),  -- Chirurgie: Oui
(136, 22, 9),  -- Type de chirurgie: Reconstruction
(137, 22, 12), -- Sévérité: Légère
(138, 22, 15), -- Traumatisme récent: Oui
(139, 22, 17), -- Durée du traitement: Moins de 10 séances
(140, 22, 20); -- Conformité: Conforme

-- Insertions pour l'opération 23
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(141, 23, 22),  -- Région du corps: Épaule
(142, 23, 7),  -- Chirurgie: Non
(143, 23, 30), -- Type de chirurgie: Aucune
(144, 23, 14), -- Sévérité: Sévère
(145, 23, 16), -- Traumatisme récent: Non
(146, 23, 19), -- Durée du traitement: Plus de 20 séances
(147, 23, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 24
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(148, 24, 22),  -- Région du corps: Épaule
(149, 24, 6),  -- Chirurgie: Oui
(150, 24, 10), -- Type de chirurgie: Suture de tendon
(151, 24, 12), -- Sévérité: Légère
(152, 24, 15), -- Traumatisme récent: Oui
(153, 24, 17), -- Durée du traitement: Moins de 10 séances
(154, 24, 20); -- Conformité: Conforme

-- Insertions pour l'opération 25
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(155, 25, 22),  -- Région du corps: Épaule
(156, 25, 7),  -- Chirurgie: Non
(157, 25, 30), -- Type de chirurgie: Aucune
(158, 25, 14), -- Sévérité: Sévère
(159, 25, 16), -- Traumatisme récent: Non
(160, 25, 19), -- Durée du traitement: Plus de 20 séances
(161, 25, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 26
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(162, 26, 22),  -- Région du corps: Épaule
(163, 26, 6),  -- Chirurgie: Oui
(164, 26, 9),  -- Type de chirurgie: Reconstruction
(165, 26, 13), -- Sévérité: Modérée
(166, 26, 15), -- Traumatisme récent: Oui
(167, 26, 17), -- Durée du traitement: Moins de 10 séances
(168, 26, 20); -- Conformité: Conforme

-- Insertions pour l'opération 27
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(169, 27, 22),  -- Région du corps: Épaule
(170, 27, 6),  -- Chirurgie: Oui
(171, 27, 10), -- Type de chirurgie: Suture de tendon
(172, 27, 12), -- Sévérité: Légère
(173, 27, 15), -- Traumatisme récent: Oui
(174, 27, 17), -- Durée du traitement: Moins de 10 séances
(175, 27, 20); -- Conformité: Conforme

-- Insertions pour l'opération 28
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(176, 28, 22),  -- Région du corps: Épaule
(177, 28, 6),  -- Chirurgie: Oui
(178, 28, 8),  -- Type de chirurgie: Arthroplastie
(179, 28, 14), -- Sévérité: Sévère
(180, 28, 15), -- Traumatisme récent: Oui
(181, 28, 18), -- Durée du traitement: 10 à 20 séances
(182, 28, 20); -- Conformité: Conforme

-- Insertions pour l'opération 29
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(183, 29, 22),  -- Région du corps: Épaule
(184, 29, 7),  -- Chirurgie: Non
(185, 29, 30), -- Type de chirurgie: Aucune
(186, 29, 13), -- Sévérité: Modérée
(187, 29, 16), -- Traumatisme récent: Non
(188, 29, 19), -- Durée du traitement: Plus de 20 séances
(189, 29, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 31
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(197, 31, 23),  -- Région du corps: Cheville/Pied
(198, 31, 6),  -- Chirurgie: Oui
(199, 31, 9),  -- Type de chirurgie: Reconstruction
(200, 31, 14), -- Sévérité: Sévère
(201, 31, 15), -- Traumatisme récent: Oui
(202, 31, 17), -- Durée du traitement: Moins de 10 séances
(203, 31, 20); -- Conformité: Conforme

-- Insertions pour l'opération 32
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(204, 32, 23),  -- Région du corps: Cheville/Pied
(205, 32, 7),  -- Chirurgie: Non
(206, 32, 30), -- Type de chirurgie: Aucune
(207, 32, 13), -- Sévérité: Modérée
(208, 32, 16), -- Traumatisme récent: Non
(209, 32, 18), -- Durée du traitement: 10 à 20 séances
(210, 32, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 33
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(211, 33, 23),  -- Région du corps: Cheville/Pied
(212, 33, 7),  -- Chirurgie: Non
(213, 33, 30), -- Type de chirurgie: Aucune
(214, 33, 12), -- Sévérité: Légère
(215, 33, 16), -- Traumatisme récent: Non
(216, 33, 17), -- Durée du traitement: Moins de 10 séances
(217, 33, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 34
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(218, 34, 23),  -- Région du corps: Cheville/Pied
(219, 34, 6),  -- Chirurgie: Oui
(220, 34, 11), -- Type de chirurgie: Suture de tendon
(221, 34, 14), -- Sévérité: Sévère
(222, 34, 15), -- Traumatisme récent: Oui
(223, 34, 18), -- Durée du traitement: 10 à 20 séances
(224, 34, 20); -- Conformité: Conforme

-- Insertions pour l'opération 35
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(225, 35, 24),  -- Région du corps: Genou
(226, 35, 6),  -- Chirurgie: Oui
(227, 35, 8),  -- Type de chirurgie: Arthroplastie
(228, 35, 13), -- Sévérité: Modérée
(229, 35, 15), -- Traumatisme récent: Oui
(230, 35, 19), -- Durée du traitement: Plus de 20 séances
(231, 35, 20); -- Conformité: Conforme

-- Insertions pour l'opération 36
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(232, 36, 24),  -- Région du corps: Genou
(233, 36, 6),  -- Chirurgie: Oui
(234, 36, 13), -- Type de chirurgie: Reconstruction
(235, 36, 13), -- Sévérité: Modérée
(236, 36, 15), -- Traumatisme récent: Oui
(237, 36, 18), -- Durée du traitement: 10 à 20 séances
(238, 36, 20); -- Conformité: Conforme

-- Insertions pour l'opération 37
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(239, 37, 24),  -- Région du corps: Genou
(240, 37, 7),  -- Chirurgie: Non
(241, 37, 30), -- Type de chirurgie: Aucune
(242, 37, 14), -- Sévérité: Sévère
(243, 37, 16), -- Traumatisme récent: Non
(244, 37, 19), -- Durée du traitement: Plus de 20 séances
(245, 37, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 38
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(246, 38, 24),  -- Région du corps: Genou
(247, 38, 7),  -- Chirurgie: Non
(248, 38, 30), -- Type de chirurgie: Aucune
(249, 38, 12), -- Sévérité: Légère
(250, 38, 16), -- Traumatisme récent: Non
(251, 38, 17), -- Durée du traitement: Moins de 10 séances
(252, 38, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 39
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(253, 39, 24),  -- Région du corps: Genou
(254, 39, 6),  -- Chirurgie: Oui
(255, 39, 9),  -- Type de chirurgie: Reconstruction
(256, 39, 13), -- Sévérité: Modérée
(257, 39, 15), -- Traumatisme récent: Oui
(258, 39, 18), -- Durée du traitement: 10 à 20 séances
(259, 39, 20); -- Conformité: Conforme

-- Insertions pour l'opération 40
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(260, 40, 24),  -- Région du corps: Genou
(261, 40, 6),  -- Chirurgie: Oui
(262, 40, 8),  -- Type de chirurgie: Arthroplastie
(263, 40, 14), -- Sévérité: Sévère
(264, 40, 15), -- Traumatisme récent: Oui
(265, 40, 17), -- Durée du traitement: Moins de 10 séances
(266, 40, 20); -- Conformité: Conforme

-- Insertions pour l'opération 41
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(267, 41, 25),  -- Région du corps: Hanche/Cuisse
(268, 41, 7),  -- Chirurgie: Non
(269, 41, 30), -- Type de chirurgie: Aucune
(270, 41, 13), -- Sévérité: Modérée
(271, 41, 16), -- Traumatisme récent: Non
(272, 41, 18), -- Durée du traitement: 10 à 20 séances
(273, 41, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 42
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(274, 42, 25),  -- Région du corps: Hanche/Cuisse
(275, 42, 6),  -- Chirurgie: Oui
(276, 42, 8),  -- Type de chirurgie: Arthroplastie
(277, 42, 14), -- Sévérité: Sévère
(278, 42, 15), -- Traumatisme récent: Oui
(279, 42, 17), -- Durée du traitement: Moins de 10 séances
(280, 42, 20); -- Conformité: Conforme

-- Insertions pour l'opération 43
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(281, 43, 25),  -- Région du corps: Hanche/Cuisse
(282, 43, 7),  -- Chirurgie: Non
(283, 43, 30), -- Type de chirurgie: Aucune
(284, 43, 12), -- Sévérité: Légère
(285, 43, 16), -- Traumatisme récent: Non
(286, 43, 19), -- Durée du traitement: Plus de 20 séances
(287, 43, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 44
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(288, 44, 25),  -- Région du corps: Hanche/Cuisse
(289, 44, 6),  -- Chirurgie: Oui
(290, 44, 11), -- Type de chirurgie: Suture de tendon
(291, 44, 13), -- Sévérité: Modérée
(292, 44, 15), -- Traumatisme récent: Oui
(293, 44, 17), -- Durée du traitement: Moins de 10 séances
(294, 44, 20); -- Conformité: Conforme

-- Insertions pour l'opération 46
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(295, 46, 25),  -- Région du corps: Hanche/Cuisse
(296, 46, 7),  -- Chirurgie: Non
(297, 46, 30), -- Type de chirurgie: Aucune
(298, 46, 12), -- Sévérité: Légère
(299, 46, 16), -- Traumatisme récent: Non
(300, 46, 17), -- Durée du traitement: Moins de 10 séances
(301, 46, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 47
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(302, 47, 25),  -- Région du corps: Hanche/Cuisse
(303, 47, 6),  -- Chirurgie: Oui
(304, 47, 9),  -- Type de chirurgie: Reconstruction
(305, 47, 14), -- Sévérité: Sévère
(306, 47, 15), -- Traumatisme récent: Oui
(307, 47, 18), -- Durée du traitement: 10 à 20 séances
(308, 47, 20); -- Conformité: Conforme

-- Insertions pour l'opération 49
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(316, 49, 1),  -- Région du corps: Rachis
(317, 49, 7),  -- Chirurgie: Non
(318, 49, 30), -- Type de chirurgie: Aucune
(319, 49, 14), -- Sévérité: Sévère
(320, 49, 16), -- Traumatisme récent: Non
(321, 49, 18), -- Durée du traitement: 10 à 20 séances
(322, 49, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 50
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(323, 50, 1),  -- Région du corps: Rachis
(324, 50, 6),  -- Chirurgie: Oui
(325, 50, 11), -- Type de chirurgie: Suture de tendon
(326, 50, 12), -- Sévérité: Légère
(327, 50, 15), -- Traumatisme récent: Oui
(328, 50, 17), -- Durée du traitement: Moins de 10 séances
(329, 50, 20); -- Conformité: Conforme

-- Insertions pour l'opération 51
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(330, 51, 29),  -- Région du corps: Cervical
(331, 51, 6),  -- Chirurgie: Oui
(332, 51, 13), -- Type de chirurgie: Reconstruction
(333, 51, 14), -- Sévérité: Sévère
(334, 51, 15), -- Traumatisme récent: Oui
(335, 51, 18), -- Durée du traitement: 10 à 20 séances
(336, 51, 20); -- Conformité: Conforme

-- Insertions pour l'opération 52
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(337, 52, 29),  -- Région du corps: Cervical
(338, 52, 7),  -- Chirurgie: Non
(339, 52, 30), -- Type de chirurgie: Aucune
(340, 52, 13), -- Sévérité: Modérée
(341, 52, 16), -- Traumatisme récent: Non
(342, 52, 19), -- Durée du traitement: Plus de 20 séances
(343, 52, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 54
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(351, 54, 2),  -- Région du corps: Membre supérieur
(352, 54, 6),  -- Chirurgie: Oui
(353, 54, 8),  -- Type de chirurgie: Arthroplastie
(354, 54, 14), -- Sévérité: Sévère
(355, 54, 15), -- Traumatisme récent: Oui
(356, 54, 17), -- Durée du traitement: Moins de 10 séances
(357, 54, 20); -- Conformité: Conforme

-- Insertions pour l'opération 55
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(358, 55, 2),  -- Région du corps: Membre supérieur
(359, 55, 7),  -- Chirurgie: Non
(360, 55, 30), -- Type de chirurgie: Aucune
(361, 55, 12), -- Sévérité: Légère
(362, 55, 16), -- Traumatisme récent: Non
(363, 55, 18), -- Durée du traitement: 10 à 20 séances
(364, 55, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 56
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(365, 56, 2),  -- Région du corps: Membre supérieur
(366, 56, 6),  -- Chirurgie: Oui
(367, 56, 11), -- Type de chirurgie: Suture de tendon
(368, 56, 13), -- Sévérité: Modérée
(369, 56, 15), -- Traumatisme récent: Oui
(370, 56, 18), -- Durée du traitement: 10 à 20 séances
(371, 56, 20); -- Conformité: Conforme

-- Insertions pour l'opération 58
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(379, 58, 2), -- Région du corps: Membre supérieur
(380, 58, 6), -- Chirurgie: Oui
(381, 58, 8), -- Type de chirurgie: Arthroplastie
(382, 58, 12), -- Sévérité: Légère
(383, 58, 15), -- Traumatisme récent: Oui
(384, 58, 17), -- Durée du traitement: Moins de 10 séances
(385, 58, 20); -- Conformité: Conforme

-- Insertions pour l'opération 59
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(386, 59, 2), -- Région du corps: Membre supérieur
(387, 59, 7), -- Chirurgie: Non
(388, 59, 30), -- Type de chirurgie: Aucune
(389, 59, 14), -- Sévérité: Sévère
(390, 59, 16), -- Traumatisme récent: Non
(391, 59, 18), -- Durée du traitement: 10 à 20 séances
(392, 59, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 60
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(393, 60, 2), -- Région du corps: Membre supérieur
(394, 60, 6), -- Chirurgie: Oui
(395, 60, 11), -- Type de chirurgie: Suture de tendon
(396, 60, 13), -- Sévérité: Modérée
(397, 60, 15), -- Traumatisme récent: Oui
(398, 60, 17), -- Durée du traitement: Moins de 10 séances
(399, 60, 20); -- Conformité: Conforme

-- Insertions pour l'opération 61
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(400, 61, 2),  -- Région du corps: Membre supérieur
(401, 61, 7),  -- Chirurgie: Non
(402, 61, 30), -- Type de chirurgie: Aucune
(403, 61, 13), -- Sévérité: Modérée
(404, 61, 16), -- Traumatisme récent: Non
(405, 61, 19), -- Durée du traitement: Plus de 20 séances
(406, 61, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 62
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(407, 62, 2),  -- Région du corps: Membre supérieur
(408, 62, 6),  -- Chirurgie: Oui
(409, 62, 11), -- Type de chirurgie: Suture de tendon
(410, 62, 14), -- Sévérité: Sévère
(411, 62, 15), -- Traumatisme récent: Oui
(412, 62, 17), -- Durée du traitement: Moins de 10 séances
(413, 62, 20); -- Conformité: Conforme

-- Insertions pour l'opération 63
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(414, 63, 2),  -- Région du corps: Membre supérieur
(415, 63, 7),  -- Chirurgie: Non
(416, 63, 30), -- Type de chirurgie: Aucune
(417, 63, 12), -- Sévérité: Légère
(418, 63, 16), -- Traumatisme récent: Non
(419, 63, 17), -- Durée du traitement: Moins de 10 séances
(420, 63, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 64
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(421, 64, 2),  -- Région du corps: Membre supérieur
(422, 64, 6),  -- Chirurgie: Oui
(423, 64, 8),  -- Type de chirurgie: Arthroplastie
(424, 64, 13), -- Sévérité: Modérée
(425, 64, 15), -- Traumatisme récent: Oui
(426, 64, 18), -- Durée du traitement: 10 à 20 séances
(427, 64, 20); -- Conformité: Conforme

-- Insertions pour l'opération 65
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(428, 65, 2),  -- Région du corps: Membre supérieur
(429, 65, 7),  -- Chirurgie: Non
(430, 65, 30), -- Type de chirurgie: Aucune
(431, 65, 14), -- Sévérité: Sévère
(432, 65, 16), -- Traumatisme récent: Non
(433, 65, 18), -- Durée du traitement: 10 à 20 séances
(434, 65, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 66
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(435, 66, 2),  -- Région du corps: Membre supérieur
(436, 66, 6),  -- Chirurgie: Oui
(437, 66, 9),  -- Type de chirurgie: Reconstruction
(438, 66, 12), -- Sévérité: Légère
(439, 66, 15), -- Traumatisme récent: Oui
(440, 66, 17), -- Durée du traitement: Moins de 10 séances
(441, 66, 20); -- Conformité: Conforme

-- Insertions pour l'opération 67
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(442, 67, 2),  -- Région du corps: Membre supérieur
(443, 67, 7),  -- Chirurgie: Non
(444, 67, 30), -- Type de chirurgie: Aucune
(445, 67, 13), -- Sévérité: Modérée
(446, 67, 16), -- Traumatisme récent: Non
(447, 67, 19), -- Durée du traitement: Plus de 20 séances
(448, 67, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 68
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(449, 68, 2),  -- Région du corps: Membre supérieur
(450, 68, 6),  -- Chirurgie: Oui
(451, 68, 10), -- Type de chirurgie: Suture de tendon
(452, 68, 14), -- Sévérité: Sévère
(453, 68, 15), -- Traumatisme récent: Oui
(454, 68, 17), -- Durée du traitement: Moins de 10 séances
(455, 68, 20); -- Conformité: Conforme

-- Insertions pour l'opération 69
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(456, 69, 2),  -- Région du corps: Membre supérieur
(457, 69, 7),  -- Chirurgie: Non
(458, 69, 30), -- Type de chirurgie: Aucune
(459, 69, 13), -- Sévérité: Modérée
(460, 69, 16), -- Traumatisme récent: Non
(461, 69, 18), -- Durée du traitement: 10 à 20 séances
(462, 69, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 70
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(463, 70, 2),  -- Région du corps: Membre supérieur
(464, 70, 6),  -- Chirurgie: Oui
(465, 70, 11), -- Type de chirurgie: Suture de tendon
(466, 70, 12), -- Sévérité: Légère
(467, 70, 15), -- Traumatisme récent: Oui
(468, 70, 18), -- Durée du traitement: 10 à 20 séances
(469, 70, 20); -- Conformité: Conforme

-- Insertions pour l'opération 71
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(470, 71, 26),  -- Région du corps: Poumon
(471, 71, 7),  -- Chirurgie: Non
(472, 71, 30), -- Type de chirurgie: Aucune
(473, 71, 14), -- Sévérité: Sévère
(474, 71, 16), -- Traumatisme récent: Non
(475, 71, 18), -- Durée du traitement: 10 à 20 séances
(476, 71, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 72
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(477, 72, 26),  -- Région du corps: Poumon
(478, 72, 7),  -- Chirurgie: Non
(479, 72, 30), -- Type de chirurgie: Aucune
(480, 72, 13), -- Sévérité: Modérée
(481, 72, 16), -- Traumatisme récent: Non
(482, 72, 18), -- Durée du traitement: 10 à 20 séances
(483, 72, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 73
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(484, 73, 26),  -- Région du corps: Poumon
(485, 73, 7),  -- Chirurgie: Non
(486, 73, 30), -- Type de chirurgie: Aucune
(487, 73, 12), -- Sévérité: Légère
(488, 73, 16), -- Traumatisme récent: Non
(489, 73, 17), -- Durée du traitement: Moins de 10 séances
(490, 73, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 74
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(491, 74, 26),  -- Région du corps: Poumon
(492, 74, 7),  -- Chirurgie: Non
(493, 74, 30), -- Type de chirurgie: Aucune
(494, 74, 14), -- Sévérité: Sévère
(495, 74, 16), -- Traumatisme récent: Non
(496, 74, 19), -- Durée du traitement: Plus de 20 séances
(497, 74, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 75
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(498, 75, 26),  -- Région du corps: Poumon
(499, 75, 6),  -- Chirurgie: Oui
(500, 75, 11), -- Type de chirurgie: Suture de tendon
(501, 75, 13), -- Sévérité: Modérée
(502, 75, 15), -- Traumatisme récent: Oui
(503, 75, 17), -- Durée du traitement: Moins de 10 séances
(504, 75, 20); -- Conformité: Conforme

-- Insertions pour l'opération 76
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(505, 76, 26),  -- Région du corps: Poumon
(506, 76, 6),  -- Chirurgie: Oui
(507, 76, 8),  -- Type de chirurgie: Arthroplastie
(508, 76, 12), -- Sévérité: Légère
(509, 76, 15), -- Traumatisme récent: Oui
(510, 76, 18), -- Durée du traitement: 10 à 20 séances
(511, 76, 20); -- Conformité: Conforme

-- Insertions pour l'opération 77
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(512, 77, 26),  -- Région du corps: Poumon
(513, 77, 7),  -- Chirurgie: Non
(514, 77, 30), -- Type de chirurgie: Aucune
(515, 77, 14), -- Sévérité: Sévère
(516, 77, 16), -- Traumatisme récent: Non
(517, 77, 19), -- Durée du traitement: Plus de 20 séances
(518, 77, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 78
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(519, 78, 26),  -- Région du corps: Poumon
(520, 78, 6),  -- Chirurgie: Oui
(521, 78, 9),  -- Type de chirurgie: Reconstruction
(522, 78, 13), -- Sévérité: Modérée
(523, 78, 15), -- Traumatisme récent: Oui
(524, 78, 17), -- Durée du traitement: Moins de 10 séances
(525, 78, 20); -- Conformité: Conforme

-- Insertions pour l'opération 79
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(526, 79, 26),  -- Région du corps: Poumon
(527, 79, 7),  -- Chirurgie: Non
(528, 79, 30), -- Type de chirurgie: Aucune
(529, 79, 12), -- Sévérité: Légère
(530, 79, 16), -- Traumatisme récent: Non
(531, 79, 18), -- Durée du traitement: 10 à 20 séances
(532, 79, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 80
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(533, 80, 26),  -- Région du corps: Poumon
(534, 80, 6),  -- Chirurgie: Oui
(535, 80, 10), -- Type de chirurgie: Suture de tendon
(536, 80, 14), -- Sévérité: Sévère
(537, 80, 15), -- Traumatisme récent: Oui
(538, 80, 18), -- Durée du traitement: 10 à 20 séances
(539, 80, 20); -- Conformité: Conforme

-- Insertions pour l'opération 81
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(540, 81, 23),  -- Région du corps: Cheville/Pied
(541, 81, 7),  -- Chirurgie: Non
(542, 81, 30), -- Type de chirurgie: Aucune
(543, 81, 13), -- Sévérité: Modérée
(544, 81, 16), -- Traumatisme récent: Non
(545, 81, 19), -- Durée du traitement: Plus de 20 séances
(546, 81, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 82
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(547, 82, 23),  -- Région du corps: Cheville/Pied
(548, 82, 6),  -- Chirurgie: Oui
(549, 82, 9),  -- Type de chirurgie: Reconstruction
(550, 82, 14), -- Sévérité: Sévère
(551, 82, 15), -- Traumatisme récent: Oui
(552, 82, 17), -- Durée du traitement: Moins de 10 séances
(553, 82, 20); -- Conformité: Conforme

-- Insertions pour l'opération 83
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(554, 83, 23),  -- Région du corps: Cheville/Pied
(555, 83, 7),  -- Chirurgie: Non
(556, 83, 30), -- Type de chirurgie: Aucune
(557, 83, 12), -- Sévérité: Légère
(558, 83, 16), -- Traumatisme récent: Non
(559, 83, 17), -- Durée du traitement: Moins de 10 séances
(560, 83, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 84
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(561, 84, 23),  -- Région du corps: Cheville/Pied
(562, 84, 6),  -- Chirurgie: Oui
(563, 84, 11), -- Type de chirurgie: Suture de tendon
(564, 84, 13), -- Sévérité: Modérée
(565, 84, 15), -- Traumatisme récent: Oui
(566, 84, 18), -- Durée du traitement: 10 à 20 séances
(567, 84, 20); -- Conformité: Conforme

-- Insertions pour l'opération 85
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(568, 85, 23),  -- Région du corps: Cheville/Pied
(569, 85, 7),  -- Chirurgie: Non
(570, 85, 30), -- Type de chirurgie: Aucune
(571, 85, 14), -- Sévérité: Sévère
(572, 85, 16), -- Traumatisme récent: Non
(573, 85, 18), -- Durée du traitement: 10 à 20 séances
(574, 85, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 86
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(575, 86, 24),  -- Région du corps: Genou
(576, 86, 6),  -- Chirurgie: Oui
(577, 86, 8),  -- Type de chirurgie: Arthroplastie
(578, 86, 12), -- Sévérité: Légère
(579, 86, 15), -- Traumatisme récent: Oui
(580, 86, 17), -- Durée du traitement: Moins de 10 séances
(581, 86, 20); -- Conformité: Conforme

-- Insertions pour l'opération 87
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(582, 87, 24),  -- Région du corps: Genou
(583, 87, 7),  -- Chirurgie: Non
(584, 87, 30), -- Type de chirurgie: Aucune
(585, 87, 13), -- Sévérité: Modérée
(586, 87, 16), -- Traumatisme récent: Non
(587, 87, 19), -- Durée du traitement: Plus de 20 séances
(588, 87, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 88
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(589, 88, 24),  -- Région du corps: Genou
(590, 88, 6),  -- Chirurgie: Oui
(591, 88, 9),  -- Type de chirurgie: Reconstruction
(592, 88, 14), -- Sévérité: Sévère
(593, 88, 15), -- Traumatisme récent: Oui
(594, 88, 17), -- Durée du traitement: Moins de 10 séances
(595, 88, 20); -- Conformité: Conforme

-- Insertions pour l'opération 89
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(596, 89, 24),  -- Région du corps: Genou
(597, 89, 7),  -- Chirurgie: Non
(598, 89, 30), -- Type de chirurgie: Aucune
(599, 89, 12), -- Sévérité: Légère
(600, 89, 16), -- Traumatisme récent: Non
(601, 89, 18), -- Durée du traitement: 10 à 20 séances
(602, 89, 21); -- Conformité: Hors référentiel

-- Insertions pour l'opération 90
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(603, 90, 24),  -- Région du corps: Genou
(604, 90, 6),  -- Chirurgie: Oui
(605, 90, 11), -- Type de chirurgie: Suture de tendon
(606, 90, 13), -- Sévérité: Modérée
(607, 90, 15), -- Traumatisme récent: Oui
(608, 90, 17), -- Durée du traitement: Moins de 10 séances
(609, 90, 20); -- Conformité: Conforme

-- Insertions for Operation 91
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(610, 91, 27),  -- Region of body: Trunk
(611, 91, 7),   -- Surgery: No
(612, 91, 16),  -- Type of surgery: None
(613, 91, 14),  -- Severity: Severe
(614, 91, 16),  -- Recent trauma: No
(615, 91, 19),  -- Duration of treatment: More than 20 sessions
(616, 91, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 92
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(617, 92, 27),  -- Region of body: Trunk
(618, 92, 7),   -- Surgery: No
(619, 92, 16),  -- Type of surgery: None
(620, 92, 12),  -- Severity: Light
(621, 92, 16),  -- Recent trauma: No
(622, 92, 17),  -- Duration of treatment: Less than 10 sessions
(623, 92, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 93
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(624, 93, 27),  -- Region of body: Trunk
(625, 93, 6),   -- Surgery: Yes
(626, 93, 8),   -- Type of surgery: Arthroplasty
(627, 93, 13),  -- Severity: Moderate
(628, 93, 15),  -- Recent trauma: Yes
(629, 93, 17),  -- Duration of treatment: Less than 10 sessions
(630, 93, 20);  -- Compliance: Compliant

-- Insertions for Operation 96
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(645, 96, 27),  -- Region of body: Trunk
(646, 96, 7),   -- Surgery: No
(647, 96, 16),  -- Type of surgery: None
(648, 96, 13),  -- Severity: Moderate
(649, 96, 16),  -- Recent trauma: No
(650, 96, 19),  -- Duration of treatment: More than 20 sessions
(651, 96, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 97
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(652, 97, 27),  -- Region of body: Trunk
(653, 97, 6),   -- Surgery: Yes
(654, 97, 11),  -- Type of surgery: Suture of tendon
(655, 97, 12),  -- Severity: Light
(656, 97, 15),  -- Recent trauma: Yes
(657, 97, 17),  -- Duration of treatment: Less than 10 sessions
(658, 97, 20);  -- Compliance: Compliant

-- Insertions for Operation 98
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(659, 98, 27),  -- Region of body: Trunk
(660, 98, 7),   -- Surgery: No
(661, 98, 16),  -- Type of surgery: None
(662, 98, 14),  -- Severity: Severe
(663, 98, 16),  -- Recent trauma: No
(664, 98, 18),  -- Duration of treatment: 10 to 20 sessions
(665, 98, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 99
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(666, 99, 27),  -- Region of body: Trunk
(667, 99, 6),   -- Surgery: Yes
(668, 99, 8),   -- Type of surgery: Arthroplasty
(669, 99, 13),  -- Severity: Moderate
(670, 99, 15),  -- Recent trauma: Yes
(671, 99, 18),  -- Duration of treatment: 10 to 20 sessions
(672, 99, 20);  -- Compliance: Compliant

-- Insertions for Operation 101
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(680, 101, 3),  -- Region of body: Lower Limb
(681, 101, 7),   -- Surgery: No
(682, 101, 16),  -- Type of surgery: None
(683, 101, 14),  -- Severity: Severe
(684, 101, 16),  -- Recent trauma: No
(685, 101, 19),  -- Duration of treatment: More than 20 sessions
(686, 101, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 102
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(687, 102, 3),  -- Region of body: Lower Limb
(688, 102, 6),   -- Surgery: Yes
(689, 102, 11),  -- Type of surgery: Suture of tendon
(690, 102, 13),  -- Severity: Moderate
(691, 102, 15),  -- Recent trauma: Yes
(692, 102, 17),  -- Duration of treatment: Less than 10 sessions
(693, 102, 20);  -- Compliance: Compliant

-- Insertions for Operation 104
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(701, 104, 3),  -- Region of body: Lower Limb
(702, 104, 6),   -- Surgery: Yes
(703, 104, 8),   -- Type of surgery: Arthroplasty
(704, 104, 14),  -- Severity: Severe
(705, 104, 15),  -- Recent trauma: Yes
(706, 104, 18),  -- Duration of treatment: 10 to 20 sessions
(707, 104, 20);  -- Compliance: Compliant

-- Insertions for Operation 105
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(708, 105, 3),  -- Region of body: Lower Limb
(709, 105, 7),   -- Surgery: No
(710, 105, 16),  -- Type of surgery: None
(711, 105, 13),  -- Severity: Moderate
(712, 105, 16),  -- Recent trauma: No
(713, 105, 19),  -- Duration of treatment: More than 20 sessions
(714, 105, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 106
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(715, 106, 28),  -- Region of body: Entire Body
(716, 106, 6),   -- Surgery: Yes
(717, 106, 9),   -- Type of surgery: Reconstruction
(718, 106, 13),  -- Severity: Moderate
(719, 106, 15),  -- Recent trauma: Yes
(720, 106, 17),  -- Duration of treatment: Less than 10 sessions
(721, 106, 20);  -- Compliance: Compliant

-- Insertions for Operation 108
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(729, 108, 28),  -- Region of body: Entire Body
(730, 108, 6),   -- Surgery: Yes
(731, 108, 11),  -- Type of surgery: Suture of tendon
(732, 108, 12),  -- Severity: Light
(733, 108, 15),  -- Recent trauma: Yes
(734, 108, 18),  -- Duration of treatment: 10 to 20 sessions
(735, 108, 20);  -- Compliance: Compliant

-- Insertions for Operation 109
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(736, 109, 28),  -- Region of body: Entire Body
(737, 109, 7),   -- Surgery: No
(738, 109, 16),  -- Type of surgery: None
(739, 109, 13),  -- Severity: Moderate
(740, 109, 16),  -- Recent trauma: No
(741, 109, 17),  -- Duration of treatment: Less than 10 sessions
(742, 109, 21);  -- Compliance: Off-guideline

-- Insertions for Operation 110
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(743, 110, 28),  -- Region of body: Entire Body
(744, 110, 6),   -- Surgery: Yes
(745, 110, 8),   -- Type of surgery: Arthroplasty
(746, 110, 14),  -- Severity: Severe
(747, 110, 15),  -- Recent trauma: Yes
(748, 110, 17),  -- Duration of treatment: Less than 10 sessions
(749, 110, 20);  -- Compliance: Compliant

-- Insertions for Operation 111
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(750, 111, 26),  -- Region of body: Poumon
(751, 111, 6),  -- Surgery: Yes
(752, 111, 9),  -- Type of surgery: Reconstruction
(753, 111, 12), -- Severity: Light
(754, 111, 15), -- Recent trauma: Yes
(755, 111, 17), -- Duration of treatment: Less than 10 sessions
(756, 111, 20); -- Compliance: Compliant

-- Insertions for Operation 112
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(757, 112, 26),  -- Region of body: Poumon
(758, 112, 7),  -- Surgery: No
(759, 112, 16), -- Type of surgery: None
(760, 112, 13), -- Severity: Moderate
(761, 112, 16), -- Recent trauma: No
(762, 112, 19), -- Duration of treatment: More than 20 sessions
(763, 112, 21); -- Compliance: Off-guideline

-- Insertions for Operation 113
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(764, 113, 26),  -- Region of body: Poumon
(765, 113, 6),  -- Surgery: Yes
(766, 113, 11), -- Type of surgery: Suture of tendon
(767, 113, 14), -- Severity: Severe
(768, 113, 15), -- Recent trauma: Yes
(769, 113, 17), -- Duration of treatment: Less than 10 sessions
(770, 113, 20); -- Compliance: Compliant

-- Insertions for Operation 115
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(778, 115, 26),  -- Region of body: Poumon
(779, 115, 6),  -- Surgery: Yes
(780, 115, 8),  -- Type of surgery: Arthroplasty
(781, 115, 13), -- Severity: Moderate
(782, 115, 15), -- Recent trauma: Yes
(783, 115, 17), -- Duration of treatment: Less than 10 sessions
(784, 115, 20); -- Compliance: Compliant

-- Insertions for Operation 116
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(785, 116, 26),  -- Region of body: Poumon
(786, 116, 7),  -- Surgery: No
(787, 116, 16), -- Type of surgery: None
(788, 116, 12), -- Severity: Light
(789, 116, 16), -- Recent trauma: No
(790, 116, 18), -- Duration of treatment: 10 to 20 sessions
(791, 116, 21); -- Compliance: Off-guideline

-- Insertions for Operation 117
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(792, 117, 26),  -- Region of body: Poumon
(793, 117, 6),  -- Surgery: Yes
(794, 117, 11), -- Type of surgery: Suture of tendon
(795, 117, 13), -- Severity: Moderate
(796, 117, 15), -- Recent trauma: Yes
(797, 117, 17), -- Duration of treatment: Less than 10 sessions
(798, 117, 20); -- Compliance: Compliant

-- Insertions for Operation 119
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(806, 119, 26),  -- Region of body: Poumon
(807, 119, 6),  -- Surgery: Yes
(808, 119, 8),  -- Type of surgery: Arthroplasty
(809, 119, 12), -- Severity: Light
(810, 119, 15), -- Recent trauma: Yes
(811, 119, 18), -- Duration of treatment: 10 to 20 sessions
(812, 119, 20); -- Compliance: Compliant

-- Insertions for Operation 120
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(813, 120, 26),  -- Region of body: Poumon
(814, 120, 7),  -- Surgery: No
(815, 120, 16), -- Type of surgery: None
(816, 120, 13), -- Severity: Moderate
(817, 120, 16), -- Recent trauma: No
(818, 120, 17), -- Duration of treatment: Less than 10 sessions
(819, 120, 21); -- Compliance: Off-guideline

-- Insertions for Operation 121
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(820, 121, 26),  -- Region of body: Poumon
(821, 121, 6),  -- Surgery: Yes
(822, 121, 9),  -- Type of surgery: Reconstruction
(823, 121, 14), -- Severity: Severe
(824, 121, 15), -- Recent trauma: Yes
(825, 121, 17), -- Duration of treatment: Less than 10 sessions
(826, 121, 20); -- Compliance: Compliant

-- Insertions for Operation 122
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(827, 122, 26),  -- Region of body: Poumon
(828, 122, 7),  -- Surgery: No
(829, 122, 16), -- Type of surgery: None
(830, 122, 13), -- Severity: Moderate
(831, 122, 16), -- Recent trauma: No
(832, 122, 19), -- Duration of treatment: More than 20 sessions
(833, 122, 21); -- Compliance: Off-guideline

-- Insertions for Operation 123
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(834, 123, 26),  -- Region of body: Poumon
(835, 123, 6),  -- Surgery: Yes
(836, 123, 11), -- Type of surgery: Suture of tendon
(837, 123, 12), -- Severity: Light
(838, 123, 15), -- Recent trauma: Yes
(839, 123, 18), -- Duration of treatment: 10 to 20 sessions
(840, 123, 20); -- Compliance: Compliant

-- Insertions for Operation 124
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(841, 124, 26),  -- Region of body: Poumon
(842, 124, 7),  -- Surgery: No
(843, 124, 16), -- Type of surgery: None
(844, 124, 14), -- Severity: Severe
(845, 124, 16), -- Recent trauma: No
(846, 124, 18), -- Duration of treatment: 10 to 20 sessions
(847, 124, 21); -- Compliance: Off-guideline

-- Insertions for Operation 126
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(855, 126, 26),  -- Region of body: Poumon
(856, 126, 7),  -- Surgery: No
(857, 126, 16), -- Type of surgery: None
(858, 126, 12), -- Severity: Light
(859, 126, 16), -- Recent trauma: No
(860, 126, 18), -- Duration of treatment: 10 to 20 sessions
(861, 126, 21); -- Compliance: Off-guideline

-- Insertions for Operation 128
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(869, 128, 26),  -- Region of body: Poumon
(870, 128, 7),  -- Surgery: No
(871, 128, 16), -- Type of surgery: None
(872, 128, 14), -- Severity: Severe
(873, 128, 16), -- Recent trauma: No
(874, 128, 19), -- Duration of treatment: More than 20 sessions
(875, 128, 21); -- Compliance: Off-guideline

-- Insertions for Operation 129
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(876, 129, 26),  -- Region of body: Poumon
(877, 129, 6),  -- Surgery: Yes
(878, 129, 8),  -- Type of surgery: Arthroplasty
(879, 129, 12), -- Severity: Light
(880, 129, 15), -- Recent trauma: Yes
(881, 129, 18), -- Duration of treatment: 10 to 20 sessions
(882, 129, 20); -- Compliance: Compliant

-- Insertions for Operation 131
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(890, 131, 26),  -- Region of body: Poumon
(891, 131, 6),  -- Surgery: Yes
(892, 131, 9),  -- Type of surgery: Reconstruction
(893, 131, 14), -- Severity: Severe
(894, 131, 15), -- Recent trauma: Yes
(895, 131, 17), -- Duration of treatment: Less than 10 sessions
(896, 131, 20); -- Compliance: Compliant

-- Insertions for Operation 132
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(897, 132, 26),  -- Region of body: Poumon
(898, 132, 7),  -- Surgery: No
(899, 132, 16), -- Type of surgery: None
(900, 132, 13), -- Severity: Moderate
(901, 132, 16), -- Recent trauma: No
(902, 132, 19), -- Duration of treatment: More than 20 sessions
(903, 132, 21); -- Compliance: Off-guideline

-- Insertions for Operation 134
INSERT INTO public.operation_param (id, id_operation, id_question_answer) VALUES
(911, 134, 26),  -- Region of body: Poumon
(912, 134, 7),  -- Surgery: No
(913, 134, 16), -- Type of surgery: None
(914, 134, 14), -- Severity: Severe
(915, 134, 16), -- Recent trauma: No
(916, 134, 18), -- Duration of treatment: 10 to 20 sessions
(917, 134, 21); -- Compliance: Off-guideline
