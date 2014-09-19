-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-09-2014 a las 02:28:05
-- Versión del servidor: 5.5.34-0ubuntu0.13.04.1
-- Versión de PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `BIOSH`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'EXPERTO'),
(3, 'VISITADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(22, 'Can add categoria', 8, 'add_categoria'),
(23, 'Can change categoria', 8, 'change_categoria'),
(24, 'Can delete categoria', 8, 'delete_categoria'),
(25, 'Can add program', 9, 'add_program'),
(26, 'Can change program', 9, 'change_program'),
(27, 'Can delete program', 9, 'delete_program'),
(28, 'Can add argument in', 10, 'add_argumentin'),
(29, 'Can change argument in', 10, 'change_argumentin'),
(30, 'Can delete argument in', 10, 'delete_argumentin'),
(31, 'Can add argument out', 11, 'add_argumentout'),
(32, 'Can change argument out', 11, 'change_argumentout'),
(33, 'Can delete argument out', 11, 'delete_argumentout'),
(34, 'Can add userprofile', 12, 'add_userprofile'),
(35, 'Can change userprofile', 12, 'change_userprofile'),
(36, 'Can delete userprofile', 12, 'delete_userprofile'),
(37, 'Can add profile', 13, 'add_profile'),
(38, 'Can change profile', 13, 'change_profile'),
(39, 'Can delete profile', 13, 'delete_profile'),
(40, 'Can add subcategory', 14, 'add_subcategory'),
(41, 'Can change subcategory', 14, 'change_subcategory'),
(42, 'Can delete subcategory', 14, 'delete_subcategory'),
(43, 'Can add program sub category', 15, 'add_programsubcategory'),
(44, 'Can change program sub category', 15, 'change_programsubcategory'),
(45, 'Can delete program sub category', 15, 'delete_programsubcategory'),
(49, 'Can add type arg', 17, 'add_typearg'),
(50, 'Can change type arg', 17, 'change_typearg'),
(51, 'Can delete type arg', 17, 'delete_typearg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(7, 'pbkdf2_sha256$12000$qw2E4SIBNpKs$vrLSw+g5MJBObOf+Q2u+lb+Z9zGLCiUMoJHQxfjK7Qk=', '2014-09-11 23:59:35', 0, 'ana', 'ana', 'liñan hinojosa', 'analucien@hotmail.es', 0, 1, '2014-09-02 15:33:36'),
(21, 'pbkdf2_sha256$12000$Q14terh1fHwJ$MNPW2Lnb9nqcNaRgl8+wr0ARo6XAv8Llx1iCChnb+ew=', '2014-09-10 23:01:52', 0, 'anarober', 'ana', 'morcillo liñan', 'aaaa@gmail.com', 0, 1, '2014-09-06 15:02:06'),
(24, 'pbkdf2_sha256$12000$LRoXJqAyOKa2$6+jtyruIazivqoYBNLpGIM1mCBDl5gFkiVLmY9Dh1Tk=', '2014-09-11 23:59:51', 0, 'pepe', 'pepe', 'pepepe', 'pepe@gmail.com', 0, 1, '2014-09-10 23:05:05'),
(27, 'pbkdf2_sha256$12000$V6Mk3JKvykiE$KneiCtb2MunKrFpEeJXJ6DYdfb4CdkuZou8B1/tk7Cw=', '2014-09-10 23:48:51', 0, 'robermorji', 'roberto', 'morcillo', 'robermorji@gmail.com', 0, 1, '2014-09-10 23:48:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_argumentin`
--

CREATE TABLE IF NOT EXISTS `BIOSH_argumentin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_id` int(11) NOT NULL,
  `nombre_argument` varchar(30) NOT NULL,
  `descripcion_argument` varchar(30) NOT NULL,
  `id_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BIOSH_argumentin_006c8d9b` (`id_program_id`),
  KEY `BIOSH_argumentin_2f2964dc` (`id_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_argumentout`
--

CREATE TABLE IF NOT EXISTS `BIOSH_argumentout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_program_id` int(11) NOT NULL,
  `nombre_argument` varchar(30) NOT NULL,
  `descripcion_argument` varchar(30) NOT NULL,
  `id_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BIOSH_argumentout_006c8d9b` (`id_program_id`),
  KEY `BIOSH_argumentout_2f2964dc` (`id_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_categoria`
--

CREATE TABLE IF NOT EXISTS `BIOSH_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `BIOSH_categoria`
--

INSERT INTO `BIOSH_categoria` (`id`, `name`) VALUES
(2, 'PRINCIPAL'),
(3, 'SECUNDARIA'),
(4, 'Tercera'),
(5, 'cuarta'),
(7, 'Quinta '),
(8, 'Sexta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_profile`
--

CREATE TABLE IF NOT EXISTS `BIOSH_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_Profile` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `BIOSH_profile`
--

INSERT INTO `BIOSH_profile` (`id`, `name_Profile`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'EXPERTO'),
(3, 'VISITADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_program`
--

CREATE TABLE IF NOT EXISTS `BIOSH_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description_Short` varchar(30) NOT NULL,
  `description_Large` varchar(30) NOT NULL,
  `directorio` varchar(30) NOT NULL,
  `numberArgumentIn` int(11) NOT NULL,
  `numberArgumentOut` int(11) NOT NULL,
  `ParametroRedireccion` varchar(30) NOT NULL,
  `CodigoEjecucion` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BIOSH_program_6f33f001` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `BIOSH_program`
--

INSERT INTO `BIOSH_program` (`id`, `category_id`, `name`, `description_Short`, `description_Large`, `directorio`, `numberArgumentIn`, `numberArgumentOut`, `ParametroRedireccion`, `CodigoEjecucion`) VALUES
(2, 2, 'BIOSHTELL', 'lñdskfñdslkfsñdl', 'dksfldskfñlsdkflñsd', 'lkflskfñlsdkf', 1, 1, 'dsñfldsñlfñd', 'dñskfñdslkfñsdkl'),
(4, 3, 'xlckldjfld', 'lkflñklxzkc', 'lcxklvxclvk', 'lsadlasd', 1, 1, 'ksdjfklsdjf', 'sklsdfkjs'),
(7, 2, 'pruebaSecundaria', 'Prueba', 'Pruebabababa', 'jdsjfdjhfjsdf', 3, 3, 'skdjfklsdjf', 'sdjkfjsdfk'),
(8, 4, 'PruebaNueva', 'Prueba', 'kjsfklsjdfkljsdklfjsldf', 'C:/www/decsai', 2, 2, 'ls', '-ls');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_programsubcategory`
--

CREATE TABLE IF NOT EXISTS `BIOSH_programsubcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BIOSH_programsubcategory_cdb5484e` (`program_id`),
  KEY `BIOSH_programsubcategory_790ef9fb` (`subcategory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `BIOSH_programsubcategory`
--

INSERT INTO `BIOSH_programsubcategory` (`id`, `program_id`, `subcategory_id`) VALUES
(1, 4, 1),
(2, 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_subcategory`
--

CREATE TABLE IF NOT EXISTS `BIOSH_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BIOSH_subcategory_6f33f001` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `BIOSH_subcategory`
--

INSERT INTO `BIOSH_subcategory` (`id`, `category_id`, `name`) VALUES
(1, 4, 'NuevaSubCategoria'),
(2, 7, 'Subcategoria'),
(3, 8, 'SubCategoriaSexta'),
(4, 7, 'SegundaSubcategoriaQuinta'),
(5, 4, 'Nueva Tercera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_typearg`
--

CREATE TABLE IF NOT EXISTS `BIOSH_typearg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_text` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `BIOSH_typearg`
--

INSERT INTO `BIOSH_typearg` (`id`, `type_text`) VALUES
(1, 'int'),
(2, 'string'),
(3, 'date'),
(4, 'float'),
(5, 'xml'),
(6, 'file');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `BIOSH_userprofile`
--

CREATE TABLE IF NOT EXISTS `BIOSH_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name_TypeUser` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `BIOSH_userprofile`
--

INSERT INTO `BIOSH_userprofile` (`id`, `user_id`, `name_TypeUser`) VALUES
(7, 7, 'ADMINISTRADOR'),
(8, 21, 'VISITADOR'),
(9, 24, 'ADMINISTRADOR'),
(10, 27, 'VISITADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(8, 'categoria', 'BIOSH', 'categoria'),
(9, 'program', 'BIOSH', 'program'),
(10, 'argument in', 'BIOSH', 'argumentin'),
(11, 'argument out', 'BIOSH', 'argumentout'),
(12, 'userprofile', 'BIOSH', 'userprofile'),
(13, 'profile', 'BIOSH', 'profile'),
(14, 'subcategory', 'BIOSH', 'subcategory'),
(15, 'program sub category', 'BIOSH', 'programsubcategory'),
(17, 'type arg', 'BIOSH', 'typearg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2fwtrkifpg1no5edaoz8hw0tpxshpwqr', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-20 15:05:56'),
('515l9m1qqaxv8flgw1l0irq46m026q3e', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-20 12:23:50'),
('b6x0o66n69sua10tfggdnzotkfnl2dbl', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-19 16:54:30'),
('bdks1yhama7alb99iu2tuhxve3aakp9h', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-20 15:10:22'),
('fv93xe8reynbjko0fct9uvkgzn0l0wwm', 'MTcyMjRlZjg3YmJiOWIwZWE1MjdlYzI2MDA0NTMzZTU5MGU1NDViOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MjR9', '2014-09-25 23:59:51'),
('l2r8qr2gm2mh3hrux8jnv6b91l418thp', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-20 15:05:35'),
('nqzwm1hipapim2wj6k0o1060xe1t5043', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-24 23:45:06'),
('xz33z5pg5x1l7k6f9k03yanhcytpkel0', 'ZWNkMDgzMDFlNTE2YzVjZTZmM2I2Zjk0NzZiYzFlYzVjNDVhMmZhYzp7fQ==', '2014-09-20 12:24:13');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `BIOSH_argumentin`
--
ALTER TABLE `BIOSH_argumentin`
  ADD CONSTRAINT `id_type_id_refs_id_42383eb6` FOREIGN KEY (`id_type_id`) REFERENCES `BIOSH_typearg` (`id`),
  ADD CONSTRAINT `id_program_id_refs_id_16b9819d` FOREIGN KEY (`id_program_id`) REFERENCES `BIOSH_program` (`id`);

--
-- Filtros para la tabla `BIOSH_argumentout`
--
ALTER TABLE `BIOSH_argumentout`
  ADD CONSTRAINT `id_type_id_refs_id_8b31a0df` FOREIGN KEY (`id_type_id`) REFERENCES `BIOSH_typearg` (`id`),
  ADD CONSTRAINT `id_program_id_refs_id_9e4a8e38` FOREIGN KEY (`id_program_id`) REFERENCES `BIOSH_program` (`id`);

--
-- Filtros para la tabla `BIOSH_program`
--
ALTER TABLE `BIOSH_program`
  ADD CONSTRAINT `category_id_refs_id_cf4b5489` FOREIGN KEY (`category_id`) REFERENCES `BIOSH_categoria` (`id`);

--
-- Filtros para la tabla `BIOSH_programsubcategory`
--
ALTER TABLE `BIOSH_programsubcategory`
  ADD CONSTRAINT `program_id_refs_id_9ad208c5` FOREIGN KEY (`program_id`) REFERENCES `BIOSH_program` (`id`),
  ADD CONSTRAINT `subcategory_id_refs_id_5aa872ca` FOREIGN KEY (`subcategory_id`) REFERENCES `BIOSH_subcategory` (`id`);

--
-- Filtros para la tabla `BIOSH_subcategory`
--
ALTER TABLE `BIOSH_subcategory`
  ADD CONSTRAINT `category_id_refs_id_7cbfbc05` FOREIGN KEY (`category_id`) REFERENCES `BIOSH_categoria` (`id`);

--
-- Filtros para la tabla `BIOSH_userprofile`
--
ALTER TABLE `BIOSH_userprofile`
  ADD CONSTRAINT `user_id_refs_id_de6d681c` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
