-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 04, 2018 at 03:35 PM
-- Server version: 10.0.34-MariaDB-0ubuntu0.16.04.1
-- PHP Version: 7.0.30-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elections`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `candidate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `uuid`, `candidate`) VALUES
(1, 'D4F638199E3D4CD6931DD88238A26A01', 'Mark Kevin Olores'),
(2, '1B4335AFB3074488916C6115B1BF495B', 'Jacinth III Suico'),
(3, 'CDFFB7BC6EF74F9484AB68A063F2D6C5', 'Eugene Bautista'),
(4, 'AC17F85E30AE494F9EA1F667F07C16D8', 'Merlan Bacarisas'),
(5, 'A2D5688B98C1468798FEA1789A6C22FE', 'Merlan Atijano'),
(6, '7FF6D6EF6769462683F1B1C9FBF8ACE0', 'MaryJoy Budiongan'),
(7, 'E29F950C4EB248F2AABC774BD1C0D5E9', 'Archie Rapista'),
(8, 'AA1E0739ABC745BC87FFF60065F00DAF', 'Michelle Dan Sitones'),
(9, '12E8DFFAEDC44AA89D424D544175604D', 'Joseph Dicdican'),
(10, '9E2D7994E89D4765964884099B9A4894', 'Leia Anjelica Mantilla'),
(11, 'E465F8B421E545A685B08DB5B487B3B7', 'Giovanni Aybo'),
(12, '70061B6C20D74F8FB9487B28F78CA52B', 'Elizabeth Rosales');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_position`
--

CREATE TABLE `candidate_position` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidate_position`
--

INSERT INTO `candidate_position` (`id`, `candidate_id`, `position_id`, `vote_count`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 0),
(3, 3, 1, 0),
(4, 4, 1, 0),
(5, 5, 1, 0),
(6, 6, 2, 0),
(7, 7, 2, 0),
(8, 8, 2, 0),
(9, 9, 2, 0),
(10, 10, 3, 0),
(11, 11, 3, 0),
(12, 12, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2018_04_24_073317_create_voters_table', 1),
('2018_04_24_074113_create_candidates_table', 2),
('2018_04_24_074459_create_votes_table', 2),
('2018_04_24_074619_create_positions_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position`, `status`) VALUES
(1, 'president', 'active'),
(2, 'secretary', 'active'),
(3, 'treasurer', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(10) UNSIGNED NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `alumni_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `sent` int(11) NOT NULL,
  `voted` tinyint(1) NOT NULL,
  `user_key` varchar(255) NOT NULL,
  `voted_candidates` varchar(255) NOT NULL,
  `hacker` varchar(255) NOT NULL,
  `expired_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `nickname`, `alumni_name`, `email`, `batch`, `sent`, `voted`, `user_key`, `voted_candidates`, `hacker`, `expired_at`) VALUES
(1, 'anna.marie.l.ebonalo', 'Ebonalo, Ana Marie', 'anna.marie.l.ebonalo@accenture.com', '2012', 0, 0, '4f5b8cb708efc8edc030f8b438900b5339c3d7707819b5981c75923a', '', '', ''),
(2, 'april.j.l.delabrino', 'Delabrino, April Jane', 'april.j.l.delabrino@accenture.com', '2012', 0, 0, '9b65bbd655914f32aeac4d360a40ba2f187f1afa8bc63bbc60235850', '', '', ''),
(3, 'c.b.oliva', 'Oliva, Cherwin', 'c.b.oliva@accenture.com', '2012', 0, 0, '29ba34ae89e45c1ea1eff4701e4b57edb587c64e6a351840603cf15b', '', '', ''),
(4, 'carmina.t.taipan', 'Taipan, Carmina', 'carmina.t.taipan@accenture.com', '2012', 0, 0, 'c08baffbb72f6647269e5821b99cc20ee2b35ad7dd0576dc2082499a', '', '', ''),
(5, 'catey.aldiano', 'Aldiano, Catherine', 'catey.aldiano@gmail.com', '2012', 0, 0, '16fec5dcf2cb3e9f4cbc2f263b9312fc2cddc10f51658ebd39b9f577', '', '', ''),
(6, 'clair.ann.b.lenohan', 'Lenohan, Clair Ann', 'clair.ann.b.lenohan@gmail.com', '2012', 0, 0, '617465f8a62d08beb410d9b06f039f0a0159d293d9b6ff4775e63101', '', '', ''),
(7, 'csnajeff', 'Cogay, Jefferson', 'csnajeff@gmail.com', '2012', 0, 0, 'b5b5799d42785ef2772207524ddbd5081cada5e57682c81615c4f6bd', '', '', ''),
(8, 'ET', 'Torrefranca, Eldridge', ' torrefrancaeldridge@gmail.com', '2012', 0, 0, '9c26f67200c93cb84877cddb142dcb289324c1e462fcd56f21f1ff58', '', '', ''),
(9, 'Emelie Anggoy', 'Anggoy, Emelie', 'emelieanggoy@gmail.com', '2012', 0, 0, 'a2d9c9b460b598c1d9fd6ff6364ba1a9ae3d73320500ff8edfae8a84', '', '', ''),
(10, 'fie.a.m.concepcion', 'Concepcion, Fie Angela', 'fie.a.m.concepcion@accenture.com', '2012', 0, 0, '90f82171256772b416b1b29f8d375cdec09512150729b465e24edffb', '', '', ''),
(11, 'j.d.nepangue', 'Nepangue, Josephine', 'j.d.nepangue@accenture.com', '2012', 0, 0, 'a0957593d2d51cd56bbbd1a69205695a7a93b62e8726a3ccdf7b1eb6', '', '', ''),
(12, 'jaizzly.servant', 'Dela Pena, Jaizzly Jane', 'jaizzly.servant@gmail.com', '2012', 0, 0, 'f4e7bc84e1133cd487e391b0e64ea419e8ad96fbed8b8536bcd87d70', '', '', ''),
(13, 'jennipienunez', 'Pitogo, Jennifer', 'jennipienunez@gmail.com', '2012', 0, 0, '3f91c32e07aa52f0e9fcfb9e108d6f1084fd7232846a95e732bb1072', '', '', ''),
(14, 'kieth.monterola', 'Monterola, Albert Kieth', 'kieth.monterola@gmail.com', '2012', 0, 0, 'af5cc8b177eb8cc0a759fb3744e8410fc0af473703c4c3e9bf941928', '', '', ''),
(15, 'madzcate', 'Madaje, Catherine', 'madzcate@gmail.com', '2012', 0, 0, '8726dece849dbab564dc33776556cb4a49c3f7b9593473257bd80d03', '', '', ''),
(16, 'Mark Bernard Nunez', 'Nuñez, Mark Bernard', 'markbernardnunez@gmail.com', '2012', 0, 0, 'fd3f79081fc5370fa7815ef0081b6311ff89383ca0456f654f7470f1', '', '', ''),
(17, 'nova.vailoces', 'Vailoces, Nova', 'nova.vailoces@gmail.com', '2012', 0, 0, '351e5e525885421c530d4085df3844ed56e1055d8cfe0847d6c3c077', '', '', ''),
(18, 'r.c.son', 'Son, Reizl', 'r.c.son@accenture.com', '2012', 0, 0, '71e32bc14286fbd21c9c8f7cf7b57ebd4daeb003da4cc26c6c6e216a', '', '', ''),
(19, 'ra.laurente', 'Laurente, Rhey Anthony', 'ra.laurente@gmail.com', '2012', 0, 0, 'a250f231ad80e9ff8262d5511301cee0637bb467e6808355780c55b3', '', '', ''),
(20, 'rafols.kenneth', 'Rafols, Kenneth', 'rafols.kenneth@gmail.com', '2012', 0, 0, 'f7a21e7bd62e438b6e5be73b888f4f4475b418086c73141dcef51feb', '', '', ''),
(21, 'recklesslc', 'Canaya, Luisa', 'recklesslc@gmail.com', '2012', 0, 0, 'b9906da994ff697402ec1eed5e1be4056e40ae5720195dd12aae1a78', '', '', ''),
(22, 'ricky.j.c.bagahansol', 'Bagahansol, Ricky Jay', 'ricky.j.c.bagahansol@accenture.com', '2012', 0, 0, '83f6060d897487e7c8698a91f8888dabb5e1989c4e8df100e3da18bc', '', '', ''),
(23, 'teromi.my', 'Tero, Michelle', 'teromi.my@gmail.com', '2012', 0, 0, '8bbf71ebf2495da0a5b40f0c963ca8ff77168227421dfe9b04037b37', '', '', ''),
(24, 'alfiebesin', 'Besin, Alfie', 'alfiebesin@gmail.com', '2013', 0, 0, 'f79e79484149f23336ddc9f440fe7433a7785049d1c72c6857ab1f5c', '', '', ''),
(25, 'cheilamae.magallanes', 'Magallanes, Cheila Mae', 'cheilamae.magallanes@gmail.com', '2013', 0, 0, 'ea1fb3560108d0443cd5280b6366fe22b92972337233da22a4ef6058', '', '', ''),
(26, 'cindy.redira', 'Redira, Cindy', 'cindy.redira@gmail.com', '2013', 0, 0, '7a7bc7ce5109e719b10b885636ed8bd43d2a67ccac13b8e51687ddbe', '', '', ''),
(27, 'cresel.agtong', 'Agtong, Creselda', 'cresel.agtong@gmail.com', '2013', 0, 0, '98ad91e13934b3595ce176cc3681b060992dfe038a8777eb134edc54', '', '', ''),
(28, 'crestelito.cuyno', 'Cuyno, Crestelito', 'crestelito.cuyno@gmail.com', '2013', 0, 0, 'a7c6a6679d7bddc53f29980193c158018527b0fb79637019eed3bf3b', '', '', ''),
(29, 'estares.melrose', 'Estares, Melrose', 'estares.melrose@gmail.com', '2013', 0, 0, '8eb6e170a7cb21ea788876bfdaf129f1495dcd814f6c588c5b184e3c', '', '', ''),
(30, 'gerald.gonzalestang', 'Tang, Gerald', 'gerald.gonzalestang@gmail.com', '2013', 0, 0, '9503f0c6850adae7bd71eb09b78aea41d9cd1c8ca0d56386d1a86cc2', '', '', ''),
(31, 'gerardo.geraldino', 'Geraldino, Gerardo Jr.', 'gerardo.geraldino@gmail.com', '2013', 0, 0, '9861988db505d6a14440c2522c7ab541d359c868f7930d90d63581c6', '', '', ''),
(32, 'gonzaga.jacqueline', 'Gonzaga, Jacqueline', 'gonzaga.jacqueline@gmail.com', '2013', 0, 0, '509e3a7f935bb334f1067de66a4dfbe2cecb9979f4259fce7287ddbc', '', '', ''),
(33, 'harold.gemida', 'Gemida, Harold', 'harold.gemida@gmail.com', '2013', 0, 0, 'bf3737d0f59b9ae7f2e571d754bcf332a17cf0de90f22924d5e41b54', '', '', ''),
(34, 'hilario.deluna', 'De Luna, Hilario', 'hilario.deluna@gmail.com', '2013', 0, 0, '751bfea586346f6300d7938bab8ff08102c29024dacf576633807d07', '', '', ''),
(35, 'honey.lynn.l.morales', 'Morales, Honey Lynn', 'honey.lynn.l.morales@accenture.com', '2013', 0, 0, '3c60c78dbcab504e969f65c47d5b149260ad8d60d834993c4607e993', '', '', ''),
(36, 'hperpo', 'Perpo, Hipolito', 'hperpo@gmail.com', '2013', 0, 0, '566a75e7bb7ba0ebb14822f1e0edcec734d70ffb4899f129d6bbd35d', '', '', ''),
(37, 'jay-ann.b.lim', 'Lim, Jay - Ann', 'jay-ann.b.lim@accenture.com', '2013', 0, 0, '338fbe188439254f810f14bdba215b5a655a2298dccbb0f51d2560bf', '', '', ''),
(38, 'jemina.bonghanoy', 'Bonghanoy, Jemina', 'jemina.bonghanoy@gmail.com', '2013', 0, 0, 'b0901ee54a008ee2aaab9a35ac26f12f082c2fd399563f25fc3e2808', '', '', ''),
(39, 'joan.villariaza', 'Villariaza, Joan', 'joan.villariaza@gmail.com', '2013', 0, 0, '725a8d5e685a9ac6040378180a1c44a0fb533e56b74351f075cd9da7', '', '', ''),
(40, 'johnrey.javelo', 'Javelo, John Rey', 'johnrey.javelo@gmail.com', '2013', 0, 0, '594212f07b5d811509b4e6405047ad35420c341de717737ff14ff38f', '', '', ''),
(41, 'juliet.anggoy', 'Anggoy, Juliet', 'juliet.anggoy@gmail.com', '2013', 0, 0, '573e9958ed04b326880dd0b21393dc96bd931a54daaa7b30a49a85f2', '', '', ''),
(42, 'khristine.censon', 'Censon, Khristine', 'khristine.censon@gmail.com', '2013', 0, 0, '8eee6023acf29eaa52c833feb13de0b517b614716f0f427cb6edebc4', '', '', ''),
(43, 'kriszia.cutamora', 'Cutamora, Kriszia', 'kriszia.cutamora@gmail.com', '2013', 0, 0, 'a5ab8b69df82c181ea8629cbf880b5416d7bda2bf03dbbe5e9ce59f8', '', '', ''),
(44, 'lanny.amaya', 'Amaya, Felomina', 'lanny.amaya@gmail.com', '2013', 0, 0, 'bd5353eae548c88730c2879c086138617c5c265f9c1c1dedcb9b2c95', '', '', ''),
(45, 'libradpeds', 'Libradilla, Pedro', 'libradpeds@gmail.com', '2013', 0, 0, '136a1aa9ecba8853b5ee4f83854507358ecff4ffc8fd6535943216d7', '', '', ''),
(46, 'lymuel.doming', 'Doming, Lymuel', 'lymuel.doming@gmail.com', '2013', 0, 0, '6ee614f40b8dc64f1a89f6e0e8f6e6144ac469b6ba13d5b0f42d0bc6', '', '', ''),
(47, 'mahara.pallo', 'Pallo, Ma. Hara August', 'mahara.pallo@gmail.com', '2013', 0, 0, '86d8631436148ea5f603a1dead0aff99ed5cc6e540ec7969b57ab799', '', '', ''),
(48, 'maricris.cabuguas', 'Cabuguas, Maricris', 'maricris.cabuguas@gmail.com', '2013', 0, 0, '6c0e0353d7cbcd36d69ded8efa2650afaba18a9e3643b2b51c0f0a4c', '', '', ''),
(49, 'markkevinolores', 'Olores, Mark Kevin', 'mark.kevin.olores@gmail.com', '2013', 0, 0, '03f5f99cbc47fb335906d9517471458c2a166a4c9d59dce657e29dc0', '', '', ''),
(50, 'maryjoy.budiongan', 'Budiongan, Mary Joy', 'maryjoy.budiongan@gmail.com', '2013', 0, 0, 'e59f65895e046ce1afa04f79a86107b6a86f56a154b37c199aca3490', '', '', ''),
(51, 'nino.jan.abad', 'Abad, Niño Jan', 'nino.jan.abad@gmail.com', '2013', 0, 0, 'ca4e3307c85e74d6e166136ce3b0ea70ef54af8a54650cd7f0ed416f', '', '', ''),
(52, 'njayson.dane', 'Dane, Neil Jayson', 'njayson.dane@gmail.com', '2013', 0, 0, '0fe73116276c76e8e87acdfdfc52acc9fe37abf4f9a12cc793721209', '', '', ''),
(53, 'rheagrace.beldeniza', 'Beldeniza, Rhea Grace', 'rheagrace.beldeniza@gmail.com', '2013', 0, 0, '797f1dbd2a0aa9d710b4356b41116ac2af0c96a74a437691f69d56e2', '', '', ''),
(54, 'richardcastillo34', 'Castillo, Richard', 'richardcastillo34@gmail.com', '2013', 0, 0, 'ff644f467301cc738294ffedd1227650823c82bd37709b95198f7754', '', '', ''),
(55, 'ronielelemino', 'Elemino, Fritz Roñel Gregory', 'ronielelemino@gmail.com', '2013', 0, 0, '1262227b4947c04acf892d4307cf3d445b7c6dcc01cef85076302ed5', '', '', ''),
(56, 'rutcher.estriba', 'Estriba, Rutcher', 'rutcher.estriba@gmail.com', '2013', 0, 0, 'b62265a0f363af8a6460ed6fc6bbf3a6202598048339d5e804f91448', '', '', ''),
(57, 'shenie.palmes', 'Palmes, Shenie', 'shenie.palmes@gmail.com', '2013', 0, 0, '1c4ab9cb66ed5afe9e9afbed0863799137e46c832ace8aa83b483ea5', '', '', ''),
(58, 'yanser25', 'Serad, Bryan', 'yanser25@gmail.com', '2013', 0, 0, '478ce9b4beb6317faa3113ab50511b7fd46868c33eb378a4b39ce8d9', '', '', ''),
(59, 'aldwin.sayson', 'Sayson, Aldwin', 'aldwin.sayson@gmail.com', '2014', 0, 0, 'c336e253de70ada40f52da6415a60c73c5e12548dbd7110b3d86208d', '', '', ''),
(60, 'aljhonmark.gasal', 'Gasal, Aljhon Mark', 'aljhonmark.gasal@gmail.com', '2014', 0, 0, '6507f1b2f999a5b864691f2d557249542edc4e641180f107677d7b7a', '', '', ''),
(61, 'angeline.ygrubay', 'Ygrubay, Angeline', 'angeline.ygrubay@gmail.com', '2014', 0, 0, 'dda8c6693abda9a57c5e6f9a6e94dca2e9ad53253e875e763538d9bc', '', '', ''),
(62, 'anjanette.abancio', 'Abancio, Anjanette', 'anjanette.abancio@gmail.com', '2014', 0, 0, '0146945ef250f9db0e6896b9dd6ed05a407013d083cfbc207d684c85', '', '', ''),
(63, 'archie.rapista', 'Rapista, Archie', 'archie.rapista@gmail.com', '2014', 0, 0, '6ecd3f21e874499cfc511d347d7dce7f7b25ccb4df19cce2c04e562c', '', '', ''),
(64, 'arnel.lenteria', 'Lenteria, Arnel', 'arnel.lenteria@gmail.com', '2014', 0, 0, '64489525520cd6421682623c26a18d6e793069a946feb8206c7a09da', '', '', ''),
(65, 'cdahuya', 'Dahuya, Cheza Mae', 'cdahuya@gmail.com', '2014', 0, 0, '239a0ed5fec10e975d4e8d67846023fd15d44dd49f18c8ede1c6570b', '', '', ''),
(66, 'Christy Adarna', 'Adarna, Christy', 'chadarna@gmail.com', '2014', 0, 0, '1e38848560e83e8bbe44c16eba8459b4ae159a16f4c091a66df3ad72', '', '', ''),
(67, 'crujido.joelito', 'Crujido, Joelito', 'crujido.joelito@gmail.com', '2014', 0, 0, 'c2fbf8c3199f17b71b0192b75279d75ded0cdbc07057efd87849a1c5', '', '', ''),
(68, 'cybordadora', 'Bordadora, Cristy', 'cybordadora@gmail.com', '2014', 0, 0, '67ff755e485b937cab3fb1381f893a89b761bc9099fd77313aaff3df', '', '', ''),
(69, 'darellegene.pellejera', 'Pellejera, Darelle Gene', 'darellegene.pellejera@gmail.com', '2014', 0, 0, '86a8d9b18ecaf0c08b65203712ef0c73008f2750a52610a9d44675fe', '', '', ''),
(70, 'dialohagan', 'Ohagan, Dial', 'dialohagan@gmail.com', '2014', 0, 0, '6e800e1617d4a5a53a2988fcca157519b2df50b63e64351cf346d32f', '', '', ''),
(71, 'Divina Tangaro', 'Tangaro, Divina', 'divtangaro@gmail.com', '2014', 0, 0, '0e4a3e9c271a1e8c339a3229104d408431d25d4f5fb1df1f93360e79', '', '', ''),
(72, 'edgar.amancio', 'Amancio, Edgar', 'edgar.amancio@gmail.com', '2014', 0, 0, '57665d8c9b946103ec89bdc44d4df3f78f70d3e38163bdc92ab4d214', '', '', ''),
(73, 'ejdabon', 'Dabon, Eric Junard', 'ejdabon@gmail.com', '2014', 0, 0, 'f2eb10c7cfe657694a465afcc381941c709c51595b7f78ab50d1477e', '', '', ''),
(74, 'ejillberth', 'Estillore, Jillberth', 'ejillberth@gmail.com', '2014', 0, 0, '2e302f9bb0c60a876f5c8eb2ad6d3c70d3174910bd02491a0076b584', '', '', ''),
(75, 'enolagaytero', 'Tero, Enola Gay', 'enolagaytero@gmail.com', '2014', 0, 0, '1ed56f17dc48c9409cab9de304a7c7cdd3b34b63fad5527fbb0041fb', '', '', ''),
(76, 'gerome.hortelano', 'Hortelano, Gerome', 'gerome.hortelano@gmail.com', '2014', 0, 0, '8771dd924b60462bad6d055e69ae11a58d6aa24011643f5db24570ee', '', '', ''),
(77, 'inaki.mateo.ibarra', 'Ibarra, Iñaki', 'inaki.mateo.ibarra@gmail.com', '2014', 0, 0, 'c97147170134c6ca76e136a99cc19a7caafddff8df052c67cfc570d2', '', '', ''),
(78, 'ivan.kirby.colina', 'Colina, Ivan Kirby', 'ivan.kirby.colina@gmail.com', '2014', 0, 0, '246e8b27391ba60808fd25ad09e4972ad8a1b65f8d6bd00dcd77b128', '', '', ''),
(79, 'jacinth.suico', 'Suico, Jacinth III', 'jacinth.suico@gmail.com', '2014', 0, 0, '4100923edc58cb5d77676d969cf0b2f1f35857502ccbdec153403168', '', '', ''),
(80, 'jezrel.bo.oc', 'Booc, Jezrel', 'jezrel.bo.oc@gmail.com', '2014', 0, 0, 'cff2ce6618005f64875f8dc17d2afe3a09fd85339d89cca675e97925', '', '', ''),
(81, 'johnpaul.bareja', 'Bareja, John Paul', 'johnpaul.bareja@gmail.com', '2014', 0, 0, '2a6c282ec53f9bfa0f45246dd1e4c632cbd76043aaefa5614438a01b', '', '', ''),
(82, 'jonathan.luzana', 'Luzana, Jonathan', 'jonathan.luzana@gmail.com', '2014', 0, 0, '529cffc46e0510fed15f502d2dcf574c8681b3795ed1ace78341467a', '', '', ''),
(83, 'Kevin Guevarra', 'Guevarra, Kevin', 'kevin.sushidigital@gmail.com', '2014', 0, 0, '7475ccc437ffe7257fdb0a5b195bf88020f069416bca01139eb513d9', '', '', ''),
(84, 'Leia Anjelica Mantilla', 'Mantilla, Leia Anjelica', 'lanjiemantilla@gmail.com', '2014', 0, 0, 'fc2fb1013165859efd0ec0ecd2d2ce2c0283d6c3857db6202ebdaee4', '', '', ''),
(85, 'lesterpunay', 'Punay, Lester', 'lesterpunay@gmail.com', '2014', 0, 0, '6a9ebf16b2d743fb941df7b60b8f5b7f9ccb2c1fd357cafa6d4ccd8b', '', '', ''),
(86, 'magdadaro.moonyeen', 'Magdadaro, Moonyeen', 'magdadaro.moonyeen@gmail.com', '2014', 0, 0, '5326053eec29734b1b7115c0d64d8eca915bd1e63e57bd0b011cbef0', '', '', ''),
(87, 'marypauline.cabungcag', 'Cabungcag, Mary Pauline', 'marypauline.cabungcag@gmail.com', '2014', 0, 0, 'b00d2bb26145e1494b1d43cdc814681d0aac4949bd8e10e37fa09e2c', '', '', ''),
(88, 'norljoy.escalicas', 'Escalicas, Norlyn Joy', 'norljoy.escalicas@gmail.com', '2014', 0, 0, '84a8050bca18415e4bd88e569849428424d23d381b6d3ddda009019f', '', '', ''),
(89, 'Kathleen Odiong', 'Odiong, Kathleen', 'odiongkathleen38@gmail.com', '2014', 0, 0, '26eb91157da5d397fad11184edf3a672364115801b3110c7cf62a1c3', '', '', ''),
(90, 'pauline.marie.etcuban', 'Etcuban, Pauline Marie', 'pauline.marie.etcuban@gmail.com', '2014', 0, 0, '30836e700a331105d3a949246c77ca257e9e4be70f0240c801a094ff', '', '', ''),
(91, 'ramirez.maria.ramos', 'Ramirez, Maria', 'ramirez.maria.ramos@gmail.com', '2014', 0, 0, '4457e83d6defe356a8802c3d1073f86a6bc066cd70dac8fe8c664e2c', '', '', ''),
(92, 'reverdida', 'Verdida, Reymond', 'reverdida@gmail.com', '2014', 0, 0, '533e18ad1dc88d235db30312ddb87f4c43587c13d12239f10fe97c5d', '', '', ''),
(93, 'rhmahinay', 'Mahinay, Rhina', 'rhmahinay@gmail.com', '2014', 0, 0, 'fcfae4a12caa6b16221cc90f6165a0092e31495c193845a53cb57230', '', '', ''),
(94, 'rhuja.villarba', 'Villarba, Rhuby Jane', 'rhuja.villarba@gmail.com', '2014', 0, 0, '3df2d9e7daa6f853a84049fb0318bea154fb5fd383d1100aca8b9ea7', '', '', ''),
(95, 'saavedra.ted', 'Saavedra, Ted', 'saavedra.ted@gmail.com', '2014', 0, 0, '2157cd107b9129b104ec7bf6658200803f71496af94b24a828821e11', '', '', ''),
(96, 'sarah.jane.sotes', 'Sotes, Sarah Jane', 'sarah.jane.sotes@gmail.com', '2014', 0, 0, '7339f6e2c70dd5b59815dcdaebd71d51c18bcbe27c658f3b2ce21d5d', '', '', ''),
(97, 'thrina.emactao', 'Emactao, Kathrina', 'thrina.emactao@gmail.com', '2014', 0, 0, 'cc7139bdfcfc380b4509a979d5fc2eacae8c9ffaccea7453b065431b', '', '', ''),
(98, 'vergel.arbonida', 'Arbonida, Vergel', 'vergel.arbonida@gmail.com', '2014', 0, 0, '0248a21646d11877991eb7459756c965d2a3344fead97a88f3a967dd', '', '', ''),
(99, 'vincentrey.bengcolita', 'Bengcolita, Vincent Rey', 'vincentrey.bengcolita@gmail.com', '2014', 0, 0, 'd428f75e3eb151761ebb44f46cdbf0eae684cdc6d5435fab191b1c7a', '', '', ''),
(100, 'welnee.asoy', 'Asoy, Welnee', 'welnee.asoy@gmail.com', '2014', 0, 0, '6e2b56451fa58962fa6ba90d9f687b807f22752b40f98ba5bdebd3e1', '', '', ''),
(101, 'Carl Lomer Abia', 'Abia, Carl Lomer', 'abiacarl@gmail.com', '2015', 0, 0, '2ec88029b270e0fd4e005485f5b592e4e6dce24021a23d29d39b0279', '', '', ''),
(102, 'Abrigana, Elvira', 'Abrigana, Elvira', 'abriganaelvira@gmail.com', '2015', 0, 0, '92613258bc3c4e94ce93fd8e0f3b6050953fe65e70f289a53221d708', '', '', ''),
(103, 'Albania, Neil', 'Albania, Neil', 'albania.neil@gmail.com', '2015', 0, 0, '3d9d1ab823dc19b3615f7e00ade4cc7c939e38cabc7b260b8859f4ff', '', '', ''),
(104, 'Bronola, Alladin', 'Bronola, Alladin', 'alladinbronola21@gmail.com', '2015', 0, 0, 'f94dd4ef9e54b15811c178c879ecd3c1eece35a913f1b1a0758490e7', '', '', ''),
(105, 'Baynos, Almera', 'Baynos, Almera', 'almerabaynos@gmail.com', '2015', 0, 0, '73717e3dbf0cc8c5f09bb55d4770218cc86113ab5372975423f1d249', '', '', ''),
(106, 'Amar, Alvie', 'Amar, Alvie', 'alvieamar@gmail.com', '2015', 0, 0, 'e022619153e385554348638c2a724a926cf22a9d82a6fe4cbda86dd9', '', '', ''),
(107, 'Pandac, ana liza', 'Pandac, Ana Liza', 'analizapandac@gmail.com', '2015', 0, 0, '7561075eeee43a76733c59c1d446a4de586044977194d50953307c73', '', '', ''),
(108, 'Bayno, Clifford', 'Bayno, Clifford', 'baynocliffordmariposque17@gmail.com', '2015', 0, 0, '7374b5b386014b9b560217f79f5ee9d0755329f99803a9bdbcd14a7d', '', '', ''),
(109, 'Jessel Mae Becbec', 'Becbec, Jessel Mae', 'becbecjesselmae@gmail.com', '2015', 0, 0, '53b6daf5e983802e3220ee64a405e6c08152089b0c8358b85ed8005e', '', '', ''),
(110, 'Tajor, Blezel', 'Tajor, Blezel', 'blezeltajor@gmail.com', '2015', 0, 0, '19a3eb7862f4bec856b761ba6911d2c60c61ccaa09138fe751a68cb0', '', '', ''),
(111, 'Ramones, Bryan', 'Ramones, Bryan', 'bryan.ramones.05@gmail.com', '2015', 0, 0, '1e1db7df923e8afe81cdd26c2ff89dd3c4f694d6b383dfcb5ec241a1', '', '', ''),
(112, 'ADMIN', 'Cambarijan, Rex', 'cambarijanrex@gmail.com', '2013', 0, 0, 'ed2159a4996d24adea449d8304b0481adf05a7eefb80f97c2e7d1c35', '', '', ''),
(113, 'Basillote, Camellejoy', 'Basillote, Camelle Joy', 'camellejoybasillote@gmail.com', '2015', 0, 0, '8aa263b852aadd6e01f179cbace2c26833fd23ead59a28847cc23567', '', '', ''),
(114, 'Gesta, Charlito', 'Gesta, Charlito', 'charlitogesta17cj@gmail.com', '2015', 0, 0, 'ea5ecbdad46b7b4e2bff7cddc993db06e32636bc75b02fd80fbd3736', '', '', ''),
(115, 'Sayson, Maria Chielo', 'Sayson, Maria Chielo', 'chielo.sayson@gmail.com', '2015', 0, 0, '1e3c7ef50520bafe9f8c802bcbfc95cffee90a505ce456c6bbde4f21', '', '', ''),
(116, 'Duran, Clint Rey', 'Duran, Clint Rey', 'craduran@gmail.com', '2015', 0, 0, 'fce903d4492c6d5b9a6ef0d865f69abb6a6ca5297708099454745d7c', '', '', ''),
(117, 'Dacullo, Jonalyn', 'Dacullo, Jonalyn', 'dacullojonalyn@gmail.com', '2015', 0, 0, 'e50e6199dc0b26a8bb5aa0719b8086f525cdd005f7802b47b45f21cd', '', '', ''),
(118, 'Bejoc, Dange Cris', 'Bejoc, Dange Cris', 'dangecrisbejoc@gmail.com', '2015', 0, 0, '5e762e383c080ffec3c481d22e87393f44b182e9a9be71f35f3bf59e', '', '', ''),
(119, 'Bihag, Elrick', 'Bihag, Elrick', 'elrick.bihag@gmail.com', '2015', 0, 0, '8629621d5f0b10f6ee38225f7db1221a345d6aa27f97ad403a8aed9b', '', '', ''),
(120, 'Desucatan, Ethel May', 'Desucatan, Ethel May', 'ethelmay.desucatan@gmail.com', '2015', 0, 0, 'f372a3ed93c653afc6392718cada6a2d152e8315856cf8d20f944f10', '', '', ''),
(121, 'Fajardo, John Paul', 'Fajardo, John Paul', 'fajardo.johnpaul@gmail.com', '2015', 0, 0, 'fb6628c1483a0697fc5a87e6196839f2feea855e4bcfca0e976875e8', '', '', ''),
(122, 'Fernando, EuNesSa', 'Fernando, Eunessa', 'fernando.eun07@gmail.com', '2015', 0, 0, 'f19fe861e7946a3db77f119fe29f8d9389b80980658572126d2429ab', '', '', ''),
(123, 'Quezon, Geralyn', 'Quezon, Geralyn', 'geralynquezon@gmail.com', '2015', 0, 0, 'a97910af44f9c0688601a5bea2fd58f01a19e425186781e7c91c4dda', '', '', ''),
(124, 'Aybo Giovanni', 'Aybo, Giovanni', 'giovanniaybo16@gmail.com', '2015', 0, 0, 'e7657abac68e6750f4971ce6fd0b6928fbffa5562c854c855ab8fd82', '', '', ''),
(125, 'Glipa, Kimberly', 'Glipa, Kimberly', 'glipa.kimberly@gmail.com', '2015', 0, 0, 'fe079c44a0a4e4eac95a997d1c57c82fae055750625d98841765a9cf', '', '', ''),
(126, 'Penafiel, Guia Rose', 'Penafiel, Guia Rose', 'guiarosepenafiel@gmail.com', '2015', 0, 0, '6ec7e65c01ed62a3e26c0238de7bf92c3c535d0edc3a3bd0a65f0316', '', '', ''),
(127, 'Escosar, Helen', 'Escosar, Helen', 'hescosar@gmail.com', '2015', 0, 0, '5327ef8acff43ec532a6eb96b533ae293b5f98c71bec70cf67098a9c', '', '', ''),
(128, 'Gersano, Harold', 'Gersano, Harold', 'hgersano@gmail.com', '2015', 0, 0, '8c8a9f8467f52edf482d08e0fc4b9cc9efcfb168b39433d69bf27206', '', '', ''),
(129, 'Amban, janry', 'Amban, Janry', 'janry.amban@gmail.com', '2015', 0, 0, 'f340c62691f5ff18a7f2cebf9e07a93229195b06c2b008343b0f1dad', '', '', ''),
(130, 'Gesim, Jayson', 'Gesim, Jayson', 'jaysongesim.el@gmail.com', '2015', 0, 0, '3e1db01d999355ea8c04de3d86a5e42c5ce96fe93633101bc084a0b6', '', '', ''),
(131, 'Gesapine, Jeneriza', 'Gesapine, Jeneriza', 'jenerizagesapine@gmail.com', '2015', 0, 0, '0d94bbee18e6bdd613587d10fc72f1fc2385136f46dc645d13e0bfbc', '', '', ''),
(132, 'Abello, Jeravel', 'Abello, Jeravel', 'jeravelabello@gmail.com', '2015', 0, 0, '50bf8fd414ba4169c98791dac647a61b94cb375a653ae8a003b72916', '', '', ''),
(133, 'Estellore, Jhenise', 'Estellore, Jhenise', 'jhenise.estellore@gmail.com', '2015', 0, 0, '3764537b7a40a908de2b145a4f82c808cf68caada566fb1339adf85a', '', '', ''),
(134, 'Jainar, john rey', 'Jainar, John Rey', 'jjohnrey@gmail.com', '2015', 0, 0, '29a0933fab42243fe73233a38078ac097170f2bc090dd021e8d171d6', '', '', ''),
(135, 'Derecho, John Manuel', 'Derecho, John Manuel', 'jmanuel.derecho@gmail.com', '2015', 0, 0, '7cfb9df62785a1eb4368f18b38cd6a6514e71db80c4b1fe2067e9061', '', '', ''),
(136, 'Ramos, Jonathan', 'Ramos, Jonathan', 'jonathan17.ramos@gmail.com', '2015', 0, 0, '95dbca3beb75c5fc556674e258b9a8f8665a1b971ebb4bd18acee040', '', '', ''),
(137, 'Jurado, Jonnalyn', 'Jurado, Jonnalyn', 'jonnalynjurado.pn@gmail.com', '2015', 0, 0, 'bc6e7b1340dde5d9d8c632a729ddad89daee78a1ed6809f3c00e9d96', '', '', ''),
(138, 'Amaro, Jovil', 'Amaro, Jovil', 'jovilamaro@gmail.com', '2015', 0, 0, 'df1bbc44cc4d819bac4d6c08155631abd444076836f11a943a6c0b6a', '', '', ''),
(139, 'Jet-sun Fernandez', 'Fernandez, Jet-Sun', 'jsunfernandez@gmail.com', '2015', 0, 0, '5af9b204242c6ebe216d96bc03bd3133eacf5c2ec624eac3f8f989fb', '', '', ''),
(140, 'Ylagan, Katherine', 'Ylagan, Katherine', 'kath.rineylagan@gmail.com', '2015', 0, 0, 'e7022362262bcf64165fe1dc071b289aa1fe01fee261c29626f73949', '', '', ''),
(141, 'Olila, elaiza ross', 'Olila, Elaiza Ross', 'laiza.eolila2015@gmail.com', '2015', 0, 0, 'ff35cdecc80952167393fadee9df85f249f2620da8ec263d4b5fff5b', '', '', ''),
(142, 'Largo, Merelyn', 'Largo, Merelyn', 'largomerelyn@gmail.com', '2015', 0, 0, '2f1c520be894ec695a4406327c7c61cf16243877f66ac7a3579bfad5', '', '', ''),
(143, 'Leah Estrella', 'Estrella, Leah', 'leahestrella16@gmail.com', '2015', 0, 0, '72a2bef12e6bde11d91d72d67657fb56e6ddd8cce991ff3d5de7eb54', '', '', ''),
(144, 'Lera, Roxanne', 'Lera, Roxanne', 'lera22roxanne@gmail.com', '2015', 0, 0, '41a5187855995f4159b115f090725939e227b42b8d45886bbf752493', '', '', ''),
(145, 'Destacamento, Ma. Ava', 'Destacamento, Ma. Ava', 'maavadestacamento@gmail.com', '2015', 0, 0, '2dbd08a43d1657f3dbf9348597375e920daea513f175adee0f74dfd3', '', '', ''),
(146, 'BelciÃ±a, Mary Clarette', 'Belciña, Mary Clarette', 'maryclarettebelcina@gmail.com', '2015', 0, 0, 'baa701fb7b2fa7cadc7cb83f333c5f3798ff3ff6b8713a0985177191', '', '', ''),
(147, 'Geolin, Mary Jean', 'Geolin, Mary Jean', 'maryjean29geolin@gmail.com', '2015', 0, 0, '46da5b88743f7e1d9936c6624ce91f65ba6541f5281f800c4ca1c21c', '', '', ''),
(148, 'sanchez, mary Laurice-chan', 'Sanchez, Mary Laurice-Chan', 'marylaurice16sanchez@gmail.com', '2015', 0, 0, 'aa5e1f9e989320a63ef0f53839d12443bcbffd2e7f6717466c8adb18', '', '', ''),
(149, 'Jacinto, Melanie', 'Jacinto, Melanie', 'melanie.jacinto26@gmail.com', '2015', 0, 0, '9b801a0111411e226086ec48fe4c3200f2e0b84efe6ff6f7871e343c', '', '', ''),
(150, 'Melchi Cabasag', 'Cabasag, Melchi', 'melchi.cabasag@gmail.com', '2015', 0, 0, 'addb4a8f90d421c90851e22e54a0651ec4ea9cbdd4ecf5277c0846a8', '', '', ''),
(151, 'Micarsos, Karen', 'Micarsos, Karen', 'micarsosk@gmail.com', '2015', 0, 0, '6918810fe0a0b5c4b46137b16827d41fc247f4a09dca148ae5e3349c', '', '', ''),
(152, 'sayco, mary jane', 'Sayco, Mary Jane', 'mjanesayco@gmail.com', '2015', 0, 0, 'df6f79f8ecc1bc17b7cb3c7e53077254a84068a186f952d22d84202c', '', '', ''),
(153, 'Reyes, Mary Jane', 'Reyes, Mary Jane', 'mjreyes@gmail.com', '2015', 0, 0, '5fe7ab4085c172aa9084405bf60e0f53a0dee73ef955ae55617e1f76', '', '', ''),
(154, 'Sitones, Michelle Dan', 'Sitones, Michelle Dan', 'msitones@gmail.com', '2015', 0, 0, '6365f10c26a52ec7b49a3e836366dfd4d05bc658ccca55988f783e80', '', '', ''),
(155, 'Buenaflor, Ma. Sheila Mae', 'Buenaflor, Ma. Sheila Mae', 'msmbuenaflor@gmail.com', '2015', 0, 0, '264eac264e46df59df1590001f6b138f5bc008ff22f7e0f828d7ddd8', '', '', ''),
(156, 'OcaÃ±a, Jolane', 'Ocaña, Jolane', 'ocanajolane@gmail.com', '2015', 0, 0, '75b6044cab21c2385cb3c7103dfa0a15d0ef852ac865c17a2e9478b7', '', '', ''),
(157, 'Palermo, Sharmain', 'Palermo, Sharmain', 'palermo.sharmain17@gmail.com', '2015', 0, 0, '437f896609b6684a555d5121c5df7e35eb8c380b6aee2ec26aafd6c2', '', '', ''),
(158, 'Fernandez, PINKpearl', 'Fernandez, Rose Pearl', 'pinkpearl29fernandez@gmail.com', '2015', 0, 0, '306316c0a302f3bffca21d9fd818f5b319290a9c4c50a7e9086b00fd', '', '', ''),
(159, 'Bautista, Eugene', 'Bautista, Eugene', 'pneugenebautista17@gmail.com', '2015', 0, 0, 'b7c3f522c8259ede3facbffc2f185eb2cef9a855adff60d191c4b8d9', '', '', ''),
(160, 'Belandres, Rebecca', 'Belandres, Rebecca', 'rebecca.belandres@gmail.com', '2015', 0, 0, 'b05287237d163db99e58cc50930e28c775baed660ca9e96c75c0ec09', '', '', ''),
(161, 'Gempisao, Reynil', 'Gempisao, Reynil', 'rgempisao@gmail.com', '2015', 0, 0, 'b7f2c589ed0c923d210ffb3deacfddb364b13dc3e04228599e557b9d', '', '', ''),
(162, 'Gabunada, Rico', 'Gabunada, Rico', 'ricogabunada@gmail.com', '2015', 0, 0, 'b5457a058a43e5546f277e514d6fbb9c73fcd6aa5b44ac57e10d56bb', '', '', ''),
(163, 'Gulfo, Rocelle', 'Gulfo, Rocelle', 'rocellegulfo@gmail.com', '2015', 0, 0, 'af17cd3dae372574aea7071950463765b1307cfc93d5a2a6879710d8', '', '', ''),
(164, 'Panlubasan, Rossnenita', 'Panlubasan, Rossnenita', 'ross.panlubasan@gmail.com', '2015', 0, 0, '736626ed7df6f5396c39ec5af5cda728da1caacc15518c3c9b2cbd5a', '', '', ''),
(165, 'Dono, Rufa mae', 'Dono, Rufa Mae', 'rufamae.dono@gmail.com', '2015', 0, 0, '49bf6bd3051fcf0379c34544a89b8eeb2d012ab4a6b73932bc06f100', '', '', ''),
(166, 'Alferez, Rutchel', 'Alferez, Rutchel', 'rutchel.alferez@gmail.com', '2015', 0, 0, '2e0b88bce27fdd219df312f29b7676a1f2d7037a084a7365753b27ec', '', '', ''),
(167, 'Salmasan, Orchyl', 'Salmasan, Orchyl', 'salmasan.orchyl@gmail.com', '2015', 0, 0, '02737e752e048027d130d253e3fb934292a8d1ed18ec354b4c3ff2fa', '', '', ''),
(168, 'sarah grace Amarila', 'Amarila, Sarah Grace', 'sarah.amarila@gmail.com', '2015', 0, 0, '47e94a177615b6716c2576bb3cc82b41b63c1ee8bd66b058fcf11882', '', '', ''),
(169, 'Sareno, Catherine', 'Sareno, Catherine', 'sareno.catherine@gmail.com', '2015', 0, 0, 'f61d55a4009f3c16c70a7f7cd69a43b44a3d97130aa0c228bc927f78', '', '', ''),
(170, 'Calvo, Sergio', 'Calvo, Sergio', 'sergiocalvo123@gmail.com', '2015', 0, 0, '7d3c6512a37e0e50bf0639c264a90389f30ffcdeaec1e8427eb35bde', '', '', ''),
(171, 'Cabadon, Sheena Mae', 'Olvina, Sheena Mae', 'sheenamaecabadon@gmail.com', '2015', 0, 0, '1888008da0f533c3a6ea1d04f8b80e21a92e8d60829077c4bc79822a', '', '', ''),
(172, 'Quimbo, Shiela Mae', 'Quimbo, Shiela Mae', 'shielamaequimbo@gmail.com', '2015', 0, 0, 'f8b0a01359cd391b9b86a852be294da76a2024c64e66955b27b9d6f5', '', '', ''),
(173, 'Siarot, Jessa', 'Siarot, Jessa', 'siarot.jessa@gmail.com', '2015', 0, 0, '45bdb59b91b316e9ad5cb0e1ccdf8183ad43f2749a3665ae659cc61c', '', '', ''),
(174, 'Suquib, Hannah Marie', 'Suquib, Hannah Marie', 'suquibhannahmarie19@gmail.com', '2015', 0, 0, '3e8c49b5f2f3f5b37b7ec947aae0a838c61407d6eabdf219043257cf', '', '', ''),
(175, 'Tangpos, Frederick', 'Tangpos, Frederick', 'tangposfred@gmail.com', '2015', 0, 0, 'd7308932a110a03106b9e2956959f4fd615143907471050227885e41', '', '', ''),
(176, 'Velarde, Jocelyn', 'Velarde, Jocelyn', 'velardejocelyn@gmail.com', '2015', 0, 0, '3f9295d18f9fb68644eff3494425c8c9993c8409a5bdb464acbb6d7a', '', '', ''),
(177, 'Dela Victoria, Vivien', 'Dela Victoria, Vivien', 'vivien.delavictoria@gmail.com', '2015', 0, 0, '28bbd49e38693499cfceefd1b1f320f171f2fdf902de139d7f1b0eda', '', '', ''),
(178, 'adalia.judyann', 'Adalia, Judy Ann', 'adalia.judyann@gmail.com', '2016', 0, 0, 'ae9578e830a27e152c700a12d95ab30f6ee744761aebbb035745aca5', '', '', ''),
(179, 'agnes.filosofo31', 'Filosopo, Agnes', 'agnes.filosofo31@gmail.com', '2016', 0, 0, 'a1d78ba52f7ee470c03659db6cc425fde68fdd5061b33761e9a3c089', '', '', ''),
(180, 'ailyn.tiongzon', 'Tiongzon, Ailyn', 'ailyn.tiongzon@gmail.com', '2016', 0, 0, 'b3ec94fc9cbe9901d0528eff62c4bd3c009f20866e7ad09ae9e73f9c', '', '', ''),
(181, 'alera.gera26', 'Gera, Alera', 'alera.gera26@gmail.com', '2016', 0, 0, 'b18518d5ca2c704d2ce6c6cc8ebf63b8f2cb3384fb1beedb032b13d7', '', '', ''),
(182, 'amador.busalanan', 'Busalanan, Amador', 'amador.busalanan@gmail.com', '2016', 0, 0, 'ee7044a5e849604d4dfc627675435359666ce9d5b9ec59f4edbba3ad', '', '', ''),
(183, 'arriesgado.glainess', 'Arriesgado, Glainess', 'arriesgado.glainess@gmail.com', '2016', 0, 0, '55f2e40fa2731a9fd86df8597278e4c74fd9796c5d97bcf384740e0b', '', '', ''),
(184, 'ates.jerlyn', 'Ates, Jerlyn', 'ates.jerlyn@gmail.com', '2016', 0, 0, 'b0f2794d76d5e2e16d6374b96cab3c2f0c2a431f0b79154ea26f30ed', '', '', ''),
(185, 'balen.josephine', 'Balen, Josephine', 'balen.josephine@gmail.com', '2016', 0, 0, '69cb8e7620a683dded9fd4c07ae53458be2dc1ca96302df475bef67e', '', '', ''),
(186, 'banas.joven', 'Ban-as, Joven', 'banas.joven@gmail.com', '2016', 0, 0, 'f117a560a5fbb0b48eeaf12395c5299c89f5289f4eefd437512de31f', '', '', ''),
(187, 'cabuquit.markjoseph', 'Cabuquit, Mark Joseph', 'cabuquit.markjoseph@gmail.com', '2016', 0, 0, 'debc890353a5b4d4ece1a82879ae1260e62334cbd1d7d8e6ba244f57', '', '', ''),
(188, 'cagatcagat.kenneth', 'Cagat-cagat, Kenneth', 'cagatcagat.kenneth@gmail.com', '2016', 0, 0, '517d07d3a8cebec28b3ff95813bd882be2a51c19d2d018de709def2f', '', '', ''),
(189, 'calumba.christopher', 'Calumba, Christopher', 'calumba.christopher@gmail.com', '2016', 0, 0, '1b60c05c5a299df2a5767c1490335df1cc2b4e50fbe6e80241c2f368', '', '', ''),
(190, 'chesil.juanich', 'Juanich, Chesil', 'chesil.juanich@gmail.com', '2016', 0, 0, 'ecc6814c5cb19c0046a075418ff2278d6621ccb3c7de94334d697cb6', '', '', ''),
(191, 'cristyjoy.razo', 'Razo, Cristy Joy', 'cristyjoy.razo@gmail.com', '2016', 0, 0, 'cddb60cf3227f56104987997d7746ec82b7a7a15ae6bfc232077d1c9', '', '', ''),
(192, 'elbertjames.olivar', 'Olivar, Elbert James', 'elbertjames.olivar@gmail.com', '2016', 0, 0, 'a9d798638e7bf0eb47012a17e1bc0196a697ac0210f020ab75038f5e', '', '', ''),
(193, 'eunicefaith.pude', 'Pude, Eunice Faith', 'eunicefaith.pude@gmail.com', '2016', 0, 0, '59cfdb1b88da80819508e236f1ae432866d89ff645b90cec2246b482', '', '', ''),
(194, 'ezar.rycel', 'Ezar, Rycel', 'ezar.rycel@gmail.com', '2016', 0, 0, 'ce7c2cea4b9a12f9f1f086de87b80f25b421989e3ab559985a7c4010', '', '', ''),
(195, 'flores.christianrey', 'Flores, Christian Rey', 'flores.christianrey@gmail.com', '2016', 0, 0, '2209266104f7001f53821b7dba90061b7784361bded5eebc45a44f12', '', '', ''),
(196, 'folminar.roque', 'Folminar, Roque', 'folminar.roque@gmail.com', '2016', 0, 0, '467b580bf91d65bbf84fd1f3268b23812cc87d3f75128aa399902892', '', '', ''),
(197, 'gamao.joselito', 'Gamao Jr., Joselito', 'gamao.joselito@gmail.com', '2016', 0, 0, '64557ac4d33cea39d3b62025b471d7b354facf071480922a221d0a26', '', '', ''),
(198, 'gerabeth.bandino', 'Bandino, Gerabeth', 'gerabeth.bandino@gmail.com', '2016', 0, 0, '86536a0bd133bafda4f86e9b2d91d963a8f631b3804b1ecd53f20d5c', '', '', ''),
(199, 'gingen.simeon6', 'Simeon, Gingen', 'gingen.simeon6@gmail.com', '2016', 0, 0, 'e715edf0d3fff08f1ca1b937891cfd6268a5bb037dc1751d0e0ee71d', '', '', ''),
(200, 'javierjocelyn336', 'Javier, Jocelyn', 'javierjocelyn336@gmail.com', '2016', 0, 0, '8d1b5264b49c9b3375049095c64fb22c9bb150f948a487741f5ac0bc', '', '', ''),
(201, 'jaynegrace28.pn', 'Fuentespina, Jayne Grace', 'jaynegrace28.pn@gmail.com', '2016', 0, 0, '860f4bdae6772e5e3ffd4b090cedbdff5d8adbfea1e4a92f42e4662b', '', '', ''),
(202, 'jenalyn.paragados143', 'Paragados, Jenalyn', 'jenalyn.paragados143@gmail.com', '2016', 0, 0, 'd8a09952d181e708f7110901c71d25a816b028d1ebede2f8b1f08d40', '', '', ''),
(203, 'joseph.dicdican', 'Didican, Joseph', 'joseph.dicdican@gmail.com', '2016', 0, 0, '6d2b6e5d866d2796f9ea000f8072d68716c037e72a37e574ea2112d7', '', '', ''),
(204, 'julieto.asen', 'Asenjo, Julieto', 'julieto.asen@gmail.com', '2016', 0, 0, '57dbe81e9724b57dd70a7be77ea4d223389234d38f986e91ed49d9de', '', '', ''),
(205, 'jumamil.angelinemarie', 'Jumamil, Angeline Marie', 'jumamil.angelinemarie@gmail.com', '2016', 0, 0, '9ee8c41c47a34f2e15093d7a9050ed7d9b80a83ece7da7db4b5a5e4b', '', '', ''),
(206, 'junrey.camposo25', 'Camposo, Junrey', 'junrey.camposo25@gmail.com', '2016', 0, 0, 'a1cc185cd01e3d403a944353fe6e469280b49bb86f98e06d49ae509c', '', '', ''),
(207, 'juvilyn.porol', 'Porol, Juvilyn', 'juvilyn.porol@gmail.com', '2016', 0, 0, '5c30d4a916a222c23cc8510e1b383ede2c21d3efe004ae92a802fc1b', '', '', ''),
(208, 'lobingco.juvelyn7', 'Lobingco, Juvelyn', 'lobingco.juvelyn7@gmail.com', '2016', 0, 0, 'a2f0fb17209ed3167a76dedcdaa76110121d90fb9d5c4cc7c9bca517', '', '', ''),
(209, 'lyndon.cen2013', 'Centinales, Lyndon', 'lyndon.cen2013@gmail.com', '2016', 0, 0, '0c1a31fae1d273c26120311a2fdd6800a98aa4b08e08f2569069686a', '', '', ''),
(210, 'malisa.aimelo03', 'Malisa, Aimelo', 'malisa.aimelo03@gmail.com', '2016', 0, 0, '98ea1c326d3e2ce28238cdda84b83feab90b9280b463980cab1c39c0', '', '', ''),
(211, 'marjorie.castro09', 'Castro, Marjorie', 'marjorie.castro09@gmail.com', '2016', 0, 0, '6bb6a497aef11ef9e2c56453def3a7479b26d037c54ef1f25f5e73b2', '', '', ''),
(212, 'mark.soliver3', 'Lapera, Mark Soliver', 'mark.soliver3@gmail.com', '2016', 0, 0, '18b8ea35f0cce5dfe37d63d8add9b76b948ce791540a58f26e605168', '', '', ''),
(213, 'markanthony.libradilla', 'Libradilla, Mark Anthony', 'markanthony.libradilla@gmail.com', '2016', 0, 0, '9aa6c09fdcb67905bbffa1f3b170a71ad2c2ff8e779dc1267a115256', '', '', ''),
(214, 'marquez.helfe', 'Marquez, Helfe', 'marquez.helfe@gmail.com', '2016', 0, 0, '9b72ecb0f770a262ed16e4eca08fb7fa4a160591583768212d090069', '', '', ''),
(215, 'nholynmarie.reyes', 'Reyes, Nholyn Marie', 'nholynmarie.reyes@gmail.com', '2016', 0, 0, '493e9481f967526c85f4156d1d798a60455985257119c8164012dfbe', '', '', ''),
(216, 'ogates.rheamae', 'Ogates, Rhea Mae', 'ogates.rheamae@gmail.com', '2016', 0, 0, 'ca248aa4a7d3cbe339cf6b748dc96b333c917cbe00219ade7f8cec44', '', '', ''),
(217, 'ortega.gerald1213', 'Ortega, Gerald', 'ortega.gerald1213@gmail.com', '2016', 0, 0, '3824a50492fa70de84cc4a18437e60791b603426976696bcc50816b7', '', '', ''),
(218, 'ortega.stiffanny', 'Ortega, Stiffany', 'ortega.stiffanny@gmail.com', '2016', 0, 0, '4d7930c523779b93b2fa4d2edf5eae7abe7e4f5d9308176498dd2429', '', '', ''),
(219, 'Stephen Padilla', 'Padilla, Stephen Vicente', 'padilla.stephen138@gmail.com', '2016', 0, 0, 'a3e0cb9a56c136137125c3506da4a76166788c94c38219c90d1a316a', '', '', ''),
(220, 'pradilla.tressa', 'Pradilla, Tressa', 'pradilla.tressa@gmail.com', '2016', 0, 0, 'bd8286aadb3e77eafe83183a7a62bda45d4d4645e3c68a77259c6c1a', '', '', ''),
(221, 'rica.estella', 'Estella, Rica', 'rica.estella@gmail.com', '2016', 0, 0, '4c12f7508f647eaf423df35f5843ead7db3d1591dd7fe93bc9fd76a0', '', '', ''),
(222, 'ronelio.bunaos', 'Bunaos, Ronelio', 'ronelio.bunaos@gmail.com', '2016', 0, 0, '0c00530b20c125de5cfb43093f8e304c049c3b21cbb644c6228ff458', '', '', ''),
(223, 'ronilo.cadenas', 'Cadenas, Ronilo', 'ronilo.cadenas@gmail.com', '2016', 0, 0, '3d8e16fcac879de9611f1745e26fc6b90c7077559919a1d8c67ba23b', '', '', ''),
(224, 'rosales.elizabeth2016', 'Rosales, Elizabeth', 'rosales.elizabeth2016@gmail.com', '2016', 0, 0, 'b8d144de62668f9950c44efedc7fd2eb3fc9ce6f55d46e275ffb177d', '', '', ''),
(225, 'searesrusseljhon', 'Seares, Russel Jhon', 'searesrusseljhon@gmail.com', '2016', 0, 0, '6c61f6e515172cdc47b7eac7d854ed2e866e6040a67224a5e2c1b97e', '', '', ''),
(226, 'suerte.lineth', 'Suerte, Lineth', 'suerte.lineth@gmail.com', '2016', 0, 0, '9312f4863a8c6a915a2f8ad0d408bdec8b34b6cd2010a09371efb0b1', '', '', ''),
(227, 'vailoces.gladys', 'Vailoces, Gladys', 'vailoces.gladys@gmail.com', '2016', 0, 0, 'e151d43a0ec0f138aa1880840e39ffddc1d77f57f9e172df89a77dcc', '', '', ''),
(228, 'vhincent.amaro', 'Amaro, Vincent', 'vhincent.amaro@gmail.com', '2016', 0, 0, 'aa1d634fc5a7c467ba8024e9f084f38f2ea59c2e88eaa081fad0435c', '', '', ''),
(229, 'alaizabest27', 'Ayaron, Alaiza', 'alaizabest27@gmail.com', '2017', 0, 0, 'cce51f22d2f25792384e10de9ba22c12b50ecdac072aaec4668ccc88', '', '', ''),
(230, 'ale.roseann', 'Ale, Rose Ann', 'ale.roseann@gmail.com', '2017', 0, 0, '390ebd26a200a036a8670babc8399ab9a9984c99b7c4e093bf1d1581', '', '', ''),
(231, 'alfredcaranoo', 'Carano-o, Alfred', 'alfredcaranoo@gmail.com', '2017', 0, 0, 'c75f2e7800b60eef2cc09cf380ec7dab69b9e610de6396a266f2ed1d', '', '', ''),
(232, 'almira.delmo123', 'Delmo, Almira', 'almira.delmo123@gmail.com', '2017', 0, 0, 'b58cca37b4c335442b273af84ee4723c0ad8b89464dcda7a1910cb5f', '', '', ''),
(233, 'alylonie', 'Leproso, Alona', 'alylonie@gmail.com', '2017', 0, 0, 'c783a3d3cf8082a41818914b851a431f1c0cbdb9191e86c804d6eb1c', '', '', ''),
(234, 'Andrew', 'Pulgade, Philip Andrew', 'andrew.pulgade@gmail.com', '2017', 0, 0, '71726fbc5ce81f83473583cf5c6e65bd075a7c87037dda26ea6eac45', '', '', ''),
(235, 'angelicaintes1209', 'Frejoles, Maria Angelica', 'angelicaintes1209@gmail.com', '2017', 0, 0, '1f619c80371fe956478c3fa28f6d850acaa50921be1aca77bad4569b', '', '', ''),
(236, 'becher.miraluna', 'Becher, Miraluna', 'becher.miraluna@gmail.com', '2017', 0, 0, '406958069d89487744b54168d4657d2851c27e4a402b8e6ef80d2bf3', '', '', ''),
(237, 'bismariej', 'Jainar, Bismarie Chistine', 'bismariej@gmail.com', '2017', 0, 0, '03bdf16c91ef218af9c6ca4121fffe8ec880814b3e2c43790ad85b73', '', '', ''),
(238, 'carlchristian.tabotabo', 'Tabotabo, Carl Christian', 'carlchristian.tabotabo@gmail.com', '2017', 0, 0, '5fc2e5cd0e903733ad0e5ddf10fcf5e393b2d4456159e905aa269a2a', '', '', ''),
(239, 'carmilo.cabigon', 'Cabigon, Carmilo', 'carmilo.cabigon@gmail.com', '2017', 0, 0, '4384a93b7de1f467cfa85022a350893fe48d93c818f8ff664e849048', '', '', ''),
(240, 'caruzalexandra', 'Pandac, Jessica', 'caruzalexandra@gmail.com', '2017', 0, 0, '5c000fe5487dc256fec8f90085ee5886fe5f502ba6ae49c231c3e447', '', '', ''),
(241, 'chan.probadora', 'Probadora, Christian', 'chan.probadora@gmail.com', '2017', 0, 0, '12149944d7f184014e964747a6e7a65a3f4080617da718c6814c82c6', '', '', ''),
(242, 'christinegrace.bonsubre', 'Bonsubre, Christine Grace', 'christinegrace.bonsubre@gmail.com', '2017', 0, 0, '25b3c50b72380069c94b7a14392dd97629f8f72e0186a5c298800c0a', '', '', ''),
(243, 'davs.roxanne', 'Davila, Roxanne', 'davs.roxanne@gmail.com', '2017', 0, 0, '78ac645e1c57a4c32b3b796358960869c86cd644c666a6c5101ab1f8', '', '', ''),
(244, 'debiemae25', 'Gastardo, Debbbie Mae', 'debiemae25@gmail.com', '2017', 0, 0, 'ac4b9405ce0c666fd060bb90b72ebe6324120338ad52a501ba83be2b', '', '', ''),
(245, 'dianne.f.b.belista', 'Belista, Dianne Faye', 'dianne.f.b.belista@accenture.com', '2017', 0, 0, '7a711fbd28b8bcddab283a4d9091f89ef51e39b8a9506c553230b794', '', '', ''),
(246, 'dionel.ferreras', 'Ferreras, Dionel', 'dionel.ferreras@gmail.com', '2017', 0, 0, '2406536b2543a7176b89e646db6ec6bacacb1190ab6a16e290f0d561', '', '', ''),
(247, 'donabel.magoncia', 'Magoncia, Donabel', 'donabel.magoncia@gmail.com', '2017', 0, 0, '5eb063807cb1075e61f01e6d89c5e56da9bd7a4069b8969af8b49ee4', '', '', ''),
(248, 'ebronjoesamae', 'Ebron, Joesa Mae', 'ebronjoesamae@gmail.com', '2017', 0, 0, 'ce3491d9277bb4e9bc866b3427714c7de521cfc2459ed455c3577c76', '', '', ''),
(249, 'elgetenz', 'Tizon, Edil', 'elgetenz@gmail.com', '2017', 0, 0, '6b5a2962b49dc9e4d1fd92691543bd3626d319a978171488011457b9', '', '', ''),
(250, 'elierose.villarba', 'Villarba, Elie Rose', 'elierose.villarba@gmail.com', '2017', 0, 0, '456bdaf577086cf7547554efff3320cc2aa7febca0b7f4683816e2f0', '', '', ''),
(251, 'emmanuelmagalona', 'Magalona, Emmanuel Christian', 'emmanuelmagalona@gmail.com', '2017', 0, 0, '4988419ed35ca3cfca13f2011864e5fd9b7188ff4c2eee64bcee7895', '', '', ''),
(252, 'fuentesaprilmarieson', 'Fuentes, April Marieson', 'fuentesaprilmarieson@gmail.com', '2017', 0, 0, '3b0df4fe594da047f6ac051a7ac03d314fc896ca48cf7dd8397647af', '', '', ''),
(253, 'garybarredaamaro', 'Amaro, Gary', 'garybarredaamaro@gmail.com', '2017', 0, 0, '73c2647aba3706e9ebd79c5bfabc2f4c7635d9568dd5e70ed740c51a', '', '', ''),
(254, 'geolinjasmin', 'Geolin, Jasmin', 'geolinjasmin@gmail.com', '2017', 0, 0, '6dc60d8cd23270723753d02f0015c803a4752ea10e6ff990a5d1b6b7', '', '', ''),
(255, 'gerson.oyangorin', 'Oyangorin, Gerson', 'gerson.oyangorin@gmail.com', '2017', 0, 0, '2397d202f71cdaa93af932942554a24f99dfecf04205fbffa8bd2b4d', '', '', ''),
(256, 'greanne.b.leyson', 'Leyson, Greanne', 'greanne.b.leyson@accenture.com', '2017', 0, 0, 'c95617b37e1f7f850bbf3c10e968e09405e8e863df20ecd27897c659', '', '', ''),
(257, 'izabellerepaso', 'Repaso, Ma. Izabelle', 'izabellerepaso@outlook.com', '2017', 0, 0, '9a66aea7fb932e19726f76ae848239f1c0c2324f4670b9d3dbce9d80', '', '', ''),
(258, 'jahara.limbaga', 'Limbaga, Jahara', 'jahara.limbaga@gmail.com', '2017', 0, 0, '951bf1d01a11dd7b3a6985f07dc7fc338e05c7bd29b516df108a47cb', '', '', ''),
(259, 'jayhyber.a.carocoy', 'Carocoy, Jay Hyber', 'jayhyber.a.carocoy@gmail.com', '2017', 0, 0, 'd8769e778e38bd168f3304f18a8dd84c2cc15387dcdb45155337dde0', '', '', ''),
(260, 'jean.banacia12', 'Bañacia, Jean', 'jean.banacia12@gmail.com', '2017', 0, 0, '89eea9d904e208cea0b43f8125bf64de3225999e634ae12b6c7b8330', '', '', ''),
(261, 'jenelyn.indino', 'Indino, Jenelyn', 'jenelyn.indino@gmail.com', '2017', 0, 0, '8e3885148501b91fc8135815f7ddaf4df5400d7095371c185c01c892', '', '', ''),
(262, 'jenniferpenales28', 'Peñales, Jennifer', 'jenniferpenales28@gmail.com', '2017', 0, 0, '91f0f980eeca2a26de5b93f0ef2759d8e7950239a870a4cb19ce4ee2', '', '', ''),
(263, 'jessa.mae.o.catolico', 'Catolico, Jessa Mae', 'jessa.mae.o.catolico@accenture.com', '2017', 0, 0, 'c76fe259aa80bcc2c08a2c2c91ec60c19e32d7601fc050d201fafc45', '', '', ''),
(264, 'joe03lyn22', 'Atijano, Rodelyn', 'joe03lyn22@gmail.com', '2017', 0, 0, 'ac268c06c7a53fae9f20f1a92807596cddc209e927c2df9fa40d2841', '', '', ''),
(265, 'john24blaze', 'Manaban, John Leo', 'john24blaze@gmail.com', '2017', 0, 0, 'a21f38183233c9ae0343136ada0c3b62f723a39ee79d59474e9742d9', '', '', ''),
(266, 'johnrexter.flores', 'Flores, John Rexter', 'johnrexter.flores@gmail.com', '2017', 0, 0, '93a9054c32bcda060a84c3c580adb3130b41dea2cfdd336eec21f6b8', '', '', ''),
(267, 'jonamerbacsid29', 'Bacsid, Jonamer', 'jonamerbacsid29@gmail.com', '2017', 0, 0, '6f0955f9ae7e16e43ea74f7dfdc81c7d9cbaeb512177e280f9585dc1', '', '', ''),
(268, 'josaphatgeoman', 'Geoman, Josaphat', 'josaphatgeoman@gmail.com', '2017', 0, 0, 'f2fbf2c3cefc6d17f41edcdb663563bdeed10d8dca10388a6e8df261', '', '', ''),
(269, 'judymaegimenez', 'Gimenez, Judy Mae', 'judymaegimenez@gmail.com', '2017', 0, 0, '44835784f25d0ef18a82a653979099d48de929cbf4e062b432d8c486', '', '', ''),
(270, 'jumaoasaivel', 'Jumao-as, Aivel', 'jumaoasaivel@gmail.com', '2017', 0, 0, '22041526faa2c36759c5e554b97af669c6d6dc30f058127c91e918d0', '', '', ''),
(271, 'jun.tanodra', 'Tanodra, Jun', 'jun.tanodra@gmail.com', '2017', 0, 0, '837fc562753c26bf7bd7d25543c83f7a7e20ea3a46edef19ee04c68e', '', '', ''),
(272, 'katrinalee.quilicon', 'Quilicon, Katrina Lee', 'katrinalee.quilicon@gmail.com', '2017', 0, 0, '73161c2004d9ddc6d5f58562ee1071007e678ed32033e6b3ceca3617', '', '', ''),
(273, 'lovegrace.caminade', 'Caminade, Love Grace', 'lovegrace.caminade@gmail.com', '2017', 0, 0, 'fc5f329e9144dd44be48b4a64863052a91743fdb5fabe20bac93dd82', '', '', ''),
(274, 'ma.jessa.pino', 'Pino, Ma. Jessa', 'ma.jessa.pino@gmail.com', '2017', 0, 0, 'b6427667f0a2531424dc9092ba63aff98708298cc4b926be3fe9cefa', '', '', ''),
(275, 'marco1.penaranda', 'Peñaranda, Marco', 'marco1.penaranda@gmail.com', '2017', 0, 0, 'e0eb99a10d16960fcb2646c9316e0f8178acdf377baffb9d9c8d62fe', '', '', ''),
(276, 'mariahlenizo', 'Lenizo, Mariah Idonah Kaye', 'mariahlenizo@gmail.com', '2017', 0, 0, 'fb0ff2ed52324c937718bcb5c2e261448ec88ee52db207a85347cfc6', '', '', ''),
(277, 'maridelmahusay', 'Mahusay, Maridel', 'maridelmahusay@gmail.com', '2017', 0, 0, '8aac384408e649f048978f7e9aa2bf6523734d856fa5a085da4a36c5', '', '', ''),
(278, 'marissagozoncalvo', 'Calvo, Marissa', 'marissagozoncalvo@gmail.com', '2017', 0, 0, 'd51e9b5ba2f8f42f5774763d2dba2396dc26a56494d22460beb70d3a', '', '', ''),
(279, 'marizgorgonio01', 'Gorgonio, Mariz', 'marizgorgonio01@gmail.com', '2017', 0, 0, '567e23b5f775d7b24ff2eedb9b632eb03aca21ee6a10086e54221aed', '', '', ''),
(280, 'marjorie.amaya02', 'Amaya, Marjorie', 'marjorieamaya02@gmail.com', '2017', 0, 0, '4afb56987cf89e643710b097568c99cee74097bf45f9a486d2f1fa52', '', '', ''),
(281, 'markadrian.grandia', 'Grandia, Mark Adrian', 'markadrian.grandia@gmail.com', '2017', 0, 0, '704644619a50424a0e732e60055c9152dd255599125a26df1dd040e7', '', '', ''),
(282, 'markraymundfernandez.pnalumni', 'Fernandez, Mark Raymund', 'markraymundfernandez.pnalumni@gmail.com', '2017', 0, 0, 'b18b919c640f7f66dbbef167d2e924a70b80e1ee82bb859239decfbb', '', '', ''),
(283, 'maryjoy.ardimer8', 'Ardimer, Mary Joy', 'maryjoy.ardimer8@gmail.com', '2017', 0, 0, 'cd9ea3668303e1363a00b3f925b0940a2a554bba451c8d8940c51f1b', '', '', ''),
(284, 'maryrosemission17', 'Zamora, Mary Rose', 'maryrosemission17@gmail.com', '2017', 0, 0, '2020b1182fd3869a57e0cebf1e62ccd12bf85567b3c0c073edd0c42b', '', '', ''),
(285, 'michael.quindao96', 'Quindao, Michael', 'michael.quindao96@gmail.com', '2017', 0, 0, '4b06abba037460eb057caaabb71907d4afa4b3513f0eed26ae4d22d4', '', '', ''),
(286, 'nico.cambelisa', 'Cambelisa, Nico', 'nico.cambelisa@gmail.com', '2017', 0, 0, 'd9f027546837d74a4644449fcd6c71f25e0a585b4352fdb88d0f6c21', '', '', ''),
(287, 'olaocris', 'Olaño, Cris', 'olaocris@yahoo.com', '2017', 0, 0, '044f9fd4040a8e9988aa83b5c957ae582dc8f9defd252fb592b875bb', '', '', ''),
(288, 'orcanete09', 'Cañete, Omner Rod', 'orcanete09@gmail.com', '2017', 0, 0, '1e4283558acc7a04f813c413bfa0adbc5e8c97a9609c1bf712d8ed5c', '', '', ''),
(289, 'otreb.potestad', 'Potestad, Edberto', 'otreb.potestad@gmail.com', '2017', 0, 0, '9846bc69112e29306b9f78fd620b23213d39f366895aff2bcafb4bb8', '', '', ''),
(290, 'ramj.arguelles', 'Arguelles, MarJude', 'ramj.arguelles@gmail.com', '2017', 0, 0, '692239fb2677e4d4aea8ede365fd05ca45be11c1406347fe4b01d3c1', '', '', ''),
(291, 'ranje.campos', 'Campos, Ranje', 'ranje.campos@gmail.com', '2017', 0, 0, '41d26fa42982ae9ea94ba5147757e82dd7d321f910d604ae898fed0b', '', '', ''),
(292, 'reneboy.rosalina', 'Rosalina, Reneboy', 'reneboy.rosalina@gmail.com', '2017', 0, 0, '111c142297f674b42c68c362756d4ff92f836f3025a3f05023b09d96', '', '', ''),
(293, 'reymark.camangyan', 'Camangyan, Reymark', 'reymark.camangyan@gmail.com', '2017', 0, 0, '7a47cd6930d5d1c93ce567babb97eab174b6b8e0c7d9e34ac43ad006', '', '', ''),
(294, 'rio.danice.v.galicia', 'Galicia, Rio Danice', 'rio.danice.v.galicia@accenture.com', '2017', 0, 0, '9f3335e66716690c6ad0ef7ba918c8d3933fdb691f65b640538aee6c', '', '', ''),
(295, 'romzdel34', 'Delapus, Romier', 'romzdel34@gmail.com', '2017', 0, 0, '0d30d5da6c59d3fa9ab1b366e657826f19e859432550438510333c3a', '', '', ''),
(296, 'rosemarie.asenjosestoso', 'Asenjo, Rosemarie', 'rosemarie.asenjosestoso@gmail.com', '2017', 0, 0, '4e5ca96a79ff3c45bfb3f44977fb2070aecdb9a066e3bdf8e2c9a242', '', '', ''),
(297, 'rowegiel', 'Lambojon, Rowegie', 'rowegiel@gmail.com', '2017', 0, 0, '14620c028d7f6886fe7c346c865dc1736c3d4175c59dcf689b4403fe', '', '', ''),
(298, 'sheilamae.igcas', 'Igcas, Sheila Mae', 'sheilamaeigcas@gmail.com', '2017', 0, 0, 'fc06dcdbefd620eac5f88a8700760c099628e7d6f6976572309f087a', '', '', ''),
(299, 'shenamarie.dabalos', 'Dabalos, Shena Marie', 'shenamarie.dabalos@gmail.com', '2017', 0, 0, '8c9ddd488be3a78dd3cc9eb28aba5733e9188508d47d2bf746e454ab', '', '', ''),
(300, 'shiela.mae.ople', 'Ople, Sheila Mae', 'shiela.mae.ople@accenture.com', '2017', 0, 0, '7e754efbbfc83e23647d2c1a025ab1550a67b65f4c22390ce22c851b', '', '', ''),
(301, 'smkyamko', 'Kyamko, Shiela Mae', 'smkyamko@gmail.com', '2017', 0, 0, '71b3c64136e4a1d04b495ffe122b0f569ae247b5e1e4ff0f9c65767b', '', '', ''),
(302, 'superchester24', 'Yosores, Cherry Mae', 'superchester24@gmail.com', '2017', 0, 0, '936f4a6a0c046e736f38f69bf8fa28ae136aee3faf566020732e38a0', '', '', ''),
(303, 'teody.mosqueda', 'Mosqueda, Teodora May', 'teody.mosqueda@gmail.com', '2017', 0, 0, '2d7d8437203bec0634e24f80d060a12124d2a39e3c888ad4300e6c8c', '', '', ''),
(304, 'viacrusis.kherrjee', 'Viacrusis, Kherr Jee', 'viacrusis.kherrjee@gmail.com', '2017', 0, 0, '31fedc567aac8100ea9317e1a000ab234d9c2d36b812dc4561ac206a', '', '', ''),
(305, 'vincentobiedofajardo', 'Fajardo, Vincent', 'vincentobiedofajardo@gmail.com', '2017', 0, 0, 'a323c312ee0c140ad36a7b38b8167396fc055c502ac967be3875e729', '', '', ''),
(306, 'warlrozred', 'Gemota, Jomael', 'warlrozred@gmail.com', '2017', 0, 0, '5ad63c7a406341b63f1379bff099aa7dac4a8f9a8de2e5ae4481330d', '', '', ''),
(307, 'werdo.jc', 'Cabatingan, Janriel', 'werdo.jc@gmail.com', '2017', 0, 0, 'e409e376a83d6ecd70ba5730d0bfe20f50f10de7ae625513c113b05b', '', '', ''),
(308, 'wynmart10', 'Palaruan, Selwyn Mart', 'wynmart10@gmail.com', '2017', 0, 0, '91dfcbd3545db9463a5d2ae2f3e90df64aa89492ae06cefe40ff87ec', '', '', ''),
(309, 'yanihamytirahc', 'Mahinay, Charity', 'yanihamytirahc@gmail.com', '2017', 0, 0, 'f896c064b046281e3975a203d241f0b275d296b2fc5eaf06074722cf', '', '', ''),
(310, 'zafirah.lee', 'Timol, Zeldine', 'zafirah.lee@gmail.com', '2017', 0, 0, '2e20aaf009a379cc21d017f6a18d6d294d4931cf6a16e7f7c5a7b210', '', '', ''),
(311, 'zxcv.four123', 'Tenebro, Janlee Raven', 'zxcv.four123@gmail.com', '2017', 0, 0, '14daa45b6b612a3a6fa87334fdc69a6cd4a7ca6e74cc4c14e7b492cf', '', '', ''),
(312, '', 'Flores, John Rey', 'sna.john90@gmail.com', '2012', 0, 0, '2d2c3cb2ea7f343a75c73776f36f004ca6f4b090331499236d8a6168', '', '', ''),
(313, '', 'Eco, Angelyn', 'sna.angelyn.94@gmail.com', '2013', 0, 0, 'a81b3fab2a7f757e347f570c40eee0e91f6e81cb36bc774bbd7e279b', '', '', '');
INSERT INTO `voters` (`id`, `nickname`, `alumni_name`, `email`, `batch`, `sent`, `voted`, `user_key`, `voted_candidates`, `hacker`, `expired_at`) VALUES
(314, '', 'Eson, Rachel', 'rachel.eson@gmail.com', '2013', 0, 0, 'efe0f3b2aa8155a2f334f78981d4bddce4d00043d0a71d64cf04e15d', '', '', ''),
(315, '', 'Tangpos, Jonathan', 'jonathan.tangpos@gmail.com', '2013', 0, 0, '48d06237f5fb706e7e33d83c81618b05799c858a0e001cc46b879395', '', '', ''),
(316, '', 'Pitogo, Adones', 'adones.pitogo.pn@gmail.com', '2014', 0, 0, '92e75a0b3a0c2ee70e012dd69fc544fdc5a41aaa622f692b5c3a70c1', '', '', ''),
(317, '', 'Compuesto, Geno', 'genocompuesto@gmail.com', '2015', 0, 0, '082eb7196d0b0946fa5d752c7ed33dade76873471ebb0e2233db3c87', '', '', ''),
(318, '', 'Corpuz, Regina', 'corpuz.regina@gmail.com', '2015', 0, 0, '4c5d2d0bb3ed883a16789ae4ef8777f3dd5692fc0e49bd34cbb5b9b3', '', '', ''),
(319, '', 'Magallanes, Felma', 'f.b.magallanes@accenture.com', '2015', 0, 0, '74d9289e81de287c295d50942fce10cbeab7b6c046ffb5f5a747e670', '', '', ''),
(320, '', 'Magsico Jr., Jose Nixon', 'nixonmagsicojr.@gmail.com', '2015', 0, 0, '36a4894a6c15ad50826ddf6b0f420c2cdf4343f64066786a8e03fbfb', '', '', ''),
(321, '', 'Robles, John Virgilio', 'johnvirgiliorobles@gmail.com', '2015', 0, 0, '5de323c08cd4d6875f630a87686b26f966d1ee5bc219e71f0809aac7', '', '', ''),
(322, '', 'Rosales, Queenie', 'queenierosales@gmail.com', '2015', 0, 0, '77e7464fcd6c65656fb4de66523dffd1ac5f56cdbf87ced4e6647ae5', '', '', ''),
(323, '', 'Samson, Danica', 'samsondanica@gmail.com', '2015', 0, 0, 'cfccb56055bd9cac716f8c38e36d08392b327f01cf4191fe29063167', '', '', ''),
(324, '', 'Tangpos, Marvin', 'tangposmarvin@gmail.com', '2015', 0, 0, '21ea6fda7898bc8bef64d5621af4219514380acdbaf6844b411c02ab', '', '', ''),
(325, '', 'Tiongzon, Rhose', 'rose.tiongzon@gmail.com', '2015', 0, 0, '6c48091284ee9df11f29a92bda9282b150536ea7c3783fecb0f5c3af', '', '', ''),
(326, '', 'Bacarisas, Merlan', 'm.r.bacarisas@accenture.com', '2016', 0, 0, '83f73dbfa70b6d38e63a675cb26387ca15c0fdbcd83639f0c864b5da', '', '', ''),
(327, '', 'Bacaro, Meldred', 'bacaro.mildred@gmail.com', '2016', 0, 0, '0ab9ea4cfd11d16539df705e039cb4ba6570a72b639474e514b214ad', '', '', ''),
(328, '', 'Cahimat, John Carlo', 'johncarlocahimat@gmail.com', '2016', 0, 0, '16a911cb4fb549fad4a1dcdebd17de6a00cd7fccbfb43f734cde5011', '', '', ''),
(329, '', 'Catañar, Gibrett', 'gibbrett.catanar@gmail.com', '2016', 0, 0, '984264d7516460f33c0530d7c28598a69e3ade078529da29c3b7c802', '', '', ''),
(330, '', 'Cawas, Adrian', 'cawas.adrian@gmail.com', '2016', 0, 0, 'd0f719ec3ace9b1073b76bb23d9a70abcb74b85e3984e3c499814378', '', '', ''),
(331, '', 'Gealon, Mike Gil', 'mikegil.gealon@outlook.com', '2016', 0, 0, '1496d910bc52392c48c0aaaf510d63bbf29e96425bb694bbbb2d28d4', '', '', ''),
(332, '', 'Geligan, Niño', 'geligan.nino@gmail.com', '2016', 0, 0, '8a05c8b5a6a5117d4f8f76bb1648a6d731b7153cbc2b31c602dbb056', '', '', ''),
(333, '', 'Jayme, Carl Harvey', 'jayme.carlharvey16@gmail.com', '2016', 0, 0, '66a647b11cd8ac8ddde55d45b78c435f77cfc637d23f397563081d24', '', '', ''),
(334, '', 'Jumamoy, Filjumar', 'jumamoy.filjumar@gmail.com', '2016', 0, 0, 'bea494c5dc0c52ff4b91050fa3d32f580a0bd7284360e9189b58f7ba', '', '', ''),
(335, '', 'Lenteria, Edna', 'edna.e.lenteria@accenture.com', '2016', 0, 0, '74e9c172d02bd1542b314b27d24559ddb04a2a7b35b66f8cce48a0d7', '', '', ''),
(336, '', 'Lorico, Sarah', 'lorico.sarah@gmail.com', '2016', 0, 0, '9f24876460f8fd38a755ffd23ebe7a4391a6a7ead6796bf726a07f72', '', '', ''),
(337, '', 'Macasero, Johna', 'johna.macasero123@gmail.com', '2016', 0, 0, 'fb167ca4d7edf240ce368f15888d3cf5e9f29b56a2b021d1e917af66', '', '', ''),
(338, '', 'Magalay, Rose Mar', 'rose.mar.l.magalay@accenture.com', '2016', 0, 0, 'e0a070509d72076265c3236da0ba3f0bd8dadaf95a4890d7869c795b', '', '', ''),
(339, '', 'Manlapaz, Harlene', 'manlapaz.harlene36@gmail.com', '2016', 0, 0, '4af271568a737c1c2b8c8452f082b75e2a237f1c195d150a7adf6b7d', '', '', ''),
(340, '', 'Martinez, Ann Merlyn', 'annemerlyn.martinez@gmail.com', '2016', 0, 0, '630e857221024a667d22072aff6825110e2d3ec1819bc3d34bfd4e7b', '', '', ''),
(341, '', 'Moya, Charry Mae', 'charrymae.moya@gmail.com', '2016', 0, 0, 'c12e5ae48ab784af01323c12ad0bfb3079d90f5fe12b1a043b7ada1d', '', '', ''),
(342, '', 'Nuñez, Vanessa Rose', 'nunez.vanessarose@gmail.com', '2016', 0, 0, '0bf61a8196107e17c190ef1b0e6b10f8ef46167183b3113b6d441fae', '', '', ''),
(343, '', 'Olasiman, Ivy Grace', 'olasiman.ivygrace@gmail.com', '2016', 0, 0, 'bdafa441e0f3237efdee8e407570f16b34357fcf996577846df9bdd1', '', '', ''),
(344, '', 'Paituar, Gabriel', 'paituar.gabriel@gmail.com', '2016', 0, 0, '7b1fc7d3fa94e5466ead823bccc644711e8a61236cce7933e1163953', '', '', ''),
(345, '', 'Pulod, Norman', 'namron.pulod@gmail.com', '2016', 0, 0, '03e3055443e2dcbc353eb9d8b50fcd1fa4891571e71dad1f488f18d1', '', '', ''),
(346, '', 'Quiaot, Marisa', 'marisa.quiaot@gmail.com', '2016', 0, 0, '45c5c8f292649138d92f686efb2f2332a4a5a8aa3ba762fe97ce53e1', '', '', ''),
(347, '', 'Salvaleon, Rowena', 'rowena.salvaleon05@gmail.com', '2016', 0, 0, 'b6925fdf2b84715d7b20aa2b60c1d92092a7b5bc089386a49660ac24', '', '', ''),
(348, '', 'Silva, Mylene', 'mylene18.silva@gmail.com', '2016', 0, 0, '877cb60b117d427562c8b5ebdeeedd755e3f839b73bfafc77e222134', '', '', ''),
(349, '', 'Tacsan, Joann', 'tacsan.joann@gmail.com', '2016', 0, 0, '86aa3d10383367faae14510930ea510c0b75a6395c9427002bfc59e3', '', '', ''),
(350, '', 'Timtim, Mely', 'timtim.mely@gmail.com', '2016', 0, 0, 'c54d5482c42c3416a460611bf3bd3f573bfb5ee7df00f1ebd47e2386', '', '', ''),
(351, '', 'Tordillos, Marvin', 'marvin.tordillos@gmail.com', '2016', 0, 0, '1ac14670e3261e39de5d4855be13cf027b69cbc1b0a06c1c466d4c0b', '', '', ''),
(352, '', 'Austria, Kristina', 'austria.katrina2@gmail.com', '2017', 0, 0, '033cc64ef1e34b902b814d90fa2aaf27c10ba6e6c6fbecc230c713b5', '', '', ''),
(353, '', 'Caballes, Junery', 'estillore.caballes@gmail.com', '2017', 0, 0, '6a860f817997bd23683bc22c302011dc555ef268daa0ed48b91c367f', '', '', ''),
(354, '', 'Saycon, Cristy', 'eiennie143@gmail.com', '2017', 0, 0, 'b1a24a730507b6c84cfc4f641868318be09df4d20f10c827cefae491', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_position`
--
ALTER TABLE `candidate_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voters_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `candidate_position`
--
ALTER TABLE `candidate_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
