CREATE DATABASE tpintegrador;
use tpintegrador;


-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 21:04:42
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpintegrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_alquiler` int(11) NOT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `forma_pago` int(11) DEFAULT NULL,
  `tipo_garantia` int(11) DEFAULT NULL,
  `fk_empleado` int(11) DEFAULT NULL,
  `fk_inmueble` int(11) DEFAULT NULL,
  `fk_cliente` int(11) DEFAULT NULL,
  `fk_contrato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id_alquiler`, `monto_total`, `fecha`, `forma_pago`, `tipo_garantia`, `fk_empleado`, `fk_inmueble`, `fk_cliente`, `fk_contrato`) VALUES
(11, 1201, '2023-01-15', 1, 1, 1, 5, 5, 15),
(12, 850, '2023-02-10', 2, 2, 2, 6, 6, 17),
(13, 951, '2023-03-05', 3, 3, 3, 7, 7, 19),
(14, 1100, '2023-04-20', 4, 1, 4, 8, 8, 21),
(15, 1050, '2023-05-10', 1, 2, 3, 11, 11, 23),
(16, 1300, '2023-06-25', 2, 3, 6, 12, 12, 33),
(17, 976, '2023-07-15', 3, 1, 1, 14, 14, 34),
(18, 891, '2023-08-30', 4, 2, 8, 15, 15, 35),
(19, 1150, '2023-09-05', 1, 3, 9, 18, 18, 36),
(20, 1250, '2023-10-20', 2, 1, 3, 19, 19, 37),
(21, 2000, '2023-05-10', 1, 1, 1, 22, 22, 38),
(22, 1500, '2023-05-09', 4, 2, 2, 23, 23, 39),
(23, 3000, '2023-05-08', 3, 3, 3, 26, 26, 40),
(24, 2200, '2023-05-10', 4, 1, 4, 27, 27, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE `barrio` (
  `id_barrio` int(11) NOT NULL,
  `nombre_barrio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`id_barrio`, `nombre_barrio`) VALUES
(1, 'Agronomía'),
(2, 'Almagro'),
(3, 'Balvanera'),
(4, 'Barracas'),
(5, 'Belgrano'),
(6, 'Boedo'),
(7, 'Caballito'),
(8, 'Chacarita'),
(9, 'Coghlan'),
(10, 'Colegiales'),
(11, 'Constitución'),
(12, 'Flores'),
(13, 'Floresta'),
(14, 'La Boca'),
(15, 'La Paternal'),
(16, 'Liniers'),
(17, 'Mataderos'),
(18, 'Monserrat'),
(19, 'Monte Castro'),
(20, 'Nueva Pompeya'),
(21, 'Núñez'),
(22, 'Palermo'),
(23, 'Parque Avellaneda'),
(24, 'Parque Chacabuco'),
(25, 'Parque Chas'),
(26, 'Parque Patricios'),
(27, 'Puerto Madero'),
(28, 'Recoleta'),
(29, 'Retiro'),
(30, 'Saavedra'),
(31, 'San Cristóbal'),
(32, 'San Nicolás'),
(33, 'San Telmo'),
(34, 'Vélez Sársfield'),
(35, 'Versalles'),
(36, 'Villa Crespo'),
(37, 'Villa del Parque'),
(38, 'Villa Devoto'),
(39, 'Villa Gral. Mitre'),
(40, 'Villa Lugano'),
(41, 'Villa Luro'),
(42, 'Villa Ortúzar'),
(43, 'Villa Pueyrredón'),
(44, 'Villa Real'),
(45, 'Villa Riachuelo'),
(46, 'Villa Santa Rita'),
(47, 'Villa Soldati'),
(48, 'Villa Urquiza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dni` varchar(25) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `tipo_cliente` int(11) DEFAULT NULL,
  `fk_inmueble` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `fecha_nacimiento`, `dni`, `telefono`, `correo`, `direccion`, `tipo_cliente`, `fk_inmueble`) VALUES
(1, 'Laura', 'García', '1988-05-12', '42345678', '612345678', 'lauraGarcia88@gmail.com', 'Calle rivera, 123, CABA', 1, 1),
(2, 'Juan', 'Martínez', '1995-09-03', '43456789', '623456789', 'juanMartinez@hotmail.com', 'AV. Belgrano, 456, Ituzaingo', 1, 2),
(3, 'Sofía', 'López', '1982-11-21', '44567890', '634567890', 'sofia.lopez@yahoo.com', 'Lima, 369, CABA', 1, 3),
(4, 'Carlos', 'Rodríguez', '1990-07-17', '45678901', '645678901', 'carlosR1990R@hotmail.com', 'Boedo, 372, Ramos mejia', 1, 4),
(5, 'Ana', 'Fernández', '1987-03-05', '46789012', '656789012', 'anaFernandez87@yahoo.com', 'Corrientes 1200', 2, 5),
(6, 'Diego', 'Sánchez', '1992-08-28', '67890123', '667890123', 'diegoSanchez92@hotmail.com', 'Junin, 1596, CABA', 2, 6),
(7, 'Marta', 'Pérez', '1985-12-09', '48901234', '678901234', 'MartaPerez85@gmail.com', 'Leam alem, 424, CABA', 2, 7),
(8, 'Javier', 'Gómez', '1997-04-15', '49012345', '213232343', 'Javier97Gomez@gmail.com', 'AV. Belgrano, 470', 2, 8),
(9, 'María', 'Ruiz', '1984-06-30', '40123456', '698123456', 'Maria84ruiz@gmail.com', 'Av.San martin, 2868, Barracas', 1, 9),
(10, 'Pablo', 'Jiménez', '1994-02-14', '41234567', '607912345', 'PabloJimenez94@hotmail.com', 'Av.Alicia Moreau de justo, 1150, Padua', 1, 10),
(11, 'Luis', 'López', '1989-07-22', '42345679', '612345679', 'luis.lopez@gmail.com', 'Calle Independencia 567, CABA', 2, 11),
(12, 'Gabriela', 'González', '1991-04-10', '43456780', '623456780', 'gabriela.gonzalez@yahoo.com', 'Av. Rivadavia 1234, Morón', 2, 12),
(13, 'Federico', 'Martínez', '1983-09-15', '44567891', '634567891', 'federico.martinez@hotmail.com', 'Av. Corrientes 789, CABA', 1, 13),
(14, 'Valeria', 'Rodríguez', '1993-02-28', '45678902', '645678902', 'valeria.rodriguez@gmail.com', 'Av. Cabildo 456, Belgrano', 2, 14),
(15, 'Martín', 'Fernández', '1996-11-05', '46789013', '656789013', 'martin.fernandez@gmail.com', 'Av. Libertador 987, Vicente López', 2, 15),
(16, 'Carolina', 'Sánchez', '1988-12-20', '67890124', '667890124', 'carolina.sanchez@yahoo.com', 'Av. Santa Fe 2345, Recoleta', 1, 16),
(17, 'Gonzalo', 'Pérez', '1990-03-08', '48901235', '678901235', 'gonzalo.perez@hotmail.com', 'Av. Córdoba 5678, CABA', 1, 17),
(18, 'Marcela', 'Gómez', '1985-06-18', '49012346', '689012346', 'marcela.gomez@gmail.com', 'Av. Entre Ríos 789, Balvanera', 2, 18),
(19, 'Elena', 'Ramírez', '1990-01-12', '50123456', '701234567', 'elena.ramirez@gmail.com', 'Calle Las Heras 1001, Quilmes', 2, 19),
(20, 'Nicolás', 'Silva', '1992-05-25', '51234567', '712345678', 'nicolas.silva@hotmail.com', 'Av. San Martín 2020, Almagro', 1, 20),
(21, 'Patricia', 'Méndez', '1987-09-30', '52345678', '723456789', 'patricia.mendez@gmail.com', 'Calle Rivadavia 3030, Palermo', 1, 21),
(22, 'Ricardo', 'Hernández', '1995-04-14', '53456789', '734567890', 'ricardo.hernandez@yahoo.com', 'Av. Belgrano 4040, Villa Urquiza', 2, 22),
(23, 'Lucía', 'Giménez', '1983-11-20', '54567890', '745678901', 'lucia.gimenez@hotmail.com', 'Calle Corrientes 5050, Retiro', 2, 23),
(24, 'Jorge', 'Navarro', '1988-02-10', '55678901', '756789012', 'jorge.navarro@gmail.com', 'Av. Santa Fe 6060, Recoleta', 1, 24),
(25, 'Susana', 'Soto', '1991-07-15', '56789012', '767890123', 'susana.soto@yahoo.com', 'Calle Córdoba 7070, Constitución', 1, 25),
(26, 'Gustavo', 'Ortega', '1994-10-05', '57890123', '778901234', 'gustavo.ortega@hotmail.com', 'Av. de Mayo 8080, Caballito', 2, 26),
(27, 'Clara', 'Vega', '1986-03-18', '58901234', '789012345', 'clara.vega@gmail.com', 'Calle Libertad 9090, San Telmo', 2, 27),
(28, 'Tomás', 'Alonso', '1990-08-22', '59012345', '790123456', 'tomas.alonso@gmail.com', 'Av. Callao 1010, Balvanera', 1, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion`
--

CREATE TABLE `condicion` (
  `id_condicion` int(11) NOT NULL,
  `condicion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `condicion`
--

INSERT INTO `condicion` (`id_condicion`, `condicion`) VALUES
(1, 'Excelente'),
(2, 'Muy Bueno'),
(3, 'Bueno'),
(4, 'Regular'),
(5, 'Malo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `url_contrato` text DEFAULT NULL,
  `tipo_contrato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`id_contrato`, `descripcion`, `url_contrato`, `tipo_contrato`) VALUES
(14, 'Contrato de Venta de monoambiente en recoleta', 'https://ejemplo.com/contrato_venta_casa_residencial', 1),
(15, 'Contrato de Alquiler de departamento 3 ambientes en Caballito', 'https://ejemplo.com/contrato_alquiler_depto_amoblado', 2),
(16, 'Contrato de venta de local comercial en avenida principal', 'https://ejemplo.com/contrato_venta_local_comercial_av_principal', 1),
(17, 'Contrato de alquiler de casa con jardín', 'https://ejemplo.com/contrato_alquiler_casa_con_jardin', 2),
(18, 'Contrato de venta de terreno en zona industrial', 'https://ejemplo.com/contrato_venta_terreno_industrial', 1),
(19, 'Contrato de alquiler de oficina en edificio corporativo', 'https://ejemplo.com/contrato_alquiler_oficina_corporativa', 2),
(20, 'Contrato de venta de departamento en zona céntrica', 'https://ejemplo.com/contrato_venta_depto_zona_centrica', 1),
(21, 'Contrato de alquiler de local comercial en centro comercial', 'https://ejemplo.com/contrato_alquiler_local_comercial_centro_comercial', 2),
(22, 'Contrato de venta de casa con piscina', 'https://ejemplo.com/contrato_venta_casa_con_piscina', 1),
(23, 'Contrato de alquiler de departamento con vista al mar', 'https://ejemplo.com/contrato_alquiler_depto_vista_al_mar', 2),
(24, 'Contrato de Venta de Departamento en Palermo', 'https://ejemplo.com/contrato-venta-departamento', 1),
(25, 'Contrato de Venta de Casa en Belgrano', 'https://ejemplo.com/contrato-venta-casa', 1),
(26, 'Contrato de Venta de Departamento en Recoleta', 'https://ejemplo.com/contrato-venta-departamento-recoleta', 1),
(27, 'Contrato de Venta de Casa en Caballito', 'https://ejemplo.com/contrato-venta-casa-caballito', 1),
(28, 'Contrato de Venta de Departamento en Villa Urquiza', 'https://ejemplo.com/contrato-venta-departamento-villa-urquiza', 1),
(29, 'Contrato de Venta de Departamento en Palermo', 'https://ejemplo.com/contrato-venta-departamento', 1),
(30, 'Contrato de Venta de Casa en Belgrano', 'https://ejemplo.com/contrato-venta-casa', 1),
(31, 'Contrato de Venta de Departamento en Recoleta', 'https://ejemplo.com/contrato-venta-departamento-recoleta', 1),
(32, 'Contrato de Venta de Casa en Caballito', 'https://ejemplo.com/contrato-venta-casa-caballito', 1),
(33, 'Contrato de Alquiler de Departamento Amoblado', 'https://ejemplo.com/contrato-alquiler-depto-amoblado', 2),
(34, 'Contrato de Alquiler de Casa con Jardín', 'https://ejemplo.com/contrato-alquiler-casa-jardin', 2),
(35, 'Contrato de Alquiler de Oficina en Edificio Corporativo', 'https://ejemplo.com/contrato-alquiler-oficina-corporativa', 2),
(36, 'Contrato de Alquiler de Local Comercial en Centro Comercial', 'https://ejemplo.com/contrato-alquiler-local-comercial-centro-comercial', 2),
(37, 'Contrato de Alquiler de Departamento con Vista al Mar', 'https://ejemplo.com/contrato-alquiler-depto-vista-al-mar', 2),
(38, 'Contrato de Alquiler de Casa en Ituzaingó', 'https://ejemplo.com/contrato-alquiler-casa-ituzaingo', 2),
(39, 'Contrato de Alquiler de Oficina en Villa Urquiza', 'https://ejemplo.com/contrato-alquiler-oficina-villa-urquiza', 2),
(40, 'Contrato de Alquiler de Local Comercial en Palermo', 'https://ejemplo.com/contrato-alquiler-local-comercial-palermo', 2),
(41, 'Contrato de Alquiler de Departamento en Almagro', 'https://ejemplo.com/contrato-alquiler-departamento-almagro', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `tipo_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellido`, `fecha_nacimiento`, `dni`, `telefono`, `correo`, `tipo_empleado`) VALUES
(1, 'Sofia García', 'Rodriguez', '1990-04-15', '40130200', '40302032', 'Sofia.G@gmail.com', 1),
(2, 'Alejandro', 'Martínez', '1985-07-22', '38032123', '61040123', 'Alejandro1985M@gmail.com', 2),
(3, 'Ana Lopez', 'Fernandez', '1997-11-05', '42130030', '60123456', 'AnaLopezF@hotmail.com', 2),
(4, 'Daniel', 'Sanchez', '1990-09-10', '40678901', '42131032', 'DanielSanche1990@gmail.com', 2),
(5, 'Lucia', 'Fernández', '1999-03-30', '42138010', '65543213', 'LuciaF99@yahoo.com', 3),
(6, 'Carlos', 'Garcia', '1987-06-12', '47890123', '667890123', 'carlos.ruiz@gmail.com', 1),
(7, 'Marta', 'Rodriguez', '1992-08-25', '48901234', '48572657', 'marta.sanchez@gmail.com', 3),
(8, 'Javier', 'Martinez', '1980-01-18', '49905425', '64567894', 'javier.gonzalez@gmail.com', 2),
(9, 'Laura', 'Perez', '1984-12-07', '44512451', '64587458', 'laura.martinez@gmail.com', 2),
(10, 'Pablo', 'Sanchez', '1990-05-03', '44862545', '48562368', 'pablo.hernadez@gmail.com', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_forma_pago` int(11) NOT NULL,
  `forma_pago` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_forma_pago`, `forma_pago`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia'),
(3, 'Deposito Bancario'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garante`
--

CREATE TABLE `garante` (
  `id_garante` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fk_cliente` int(11) DEFAULT NULL,
  `fk_alquiler` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `garante`
--

INSERT INTO `garante` (`id_garante`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `direccion`, `fk_cliente`, `fk_alquiler`) VALUES
(1, 'Sofía', 'González', '42345678', '612345678', 'sofiaGonzalez2024@gmail.com', 'Sarmiento, 496, CABA', 5, 15),
(2, 'Alejandro', 'López', '43456789', '623456789', 'alejandroLopez@yahoo.com', 'Talcahuano, 2514, Padua', 6, 17),
(3, 'Ana', 'Martínez', '44567890', '434567223', 'anamartinez@gmail.com', '9 de julio, 239, Moron', 7, 19),
(4, 'Carlos', 'Rodríguez', '45678901', '645678901', 'carlosRodriguez@yahoo.com', 'Venezuela, 836, Ituzaingo', 8, 21),
(5, 'Laura', 'Sánchez', '46789012', '656789012', 'lauraSanchez46@gmail.com', 'Maipu, 6871, Liniers', 11, 23),
(6, 'Lucía', 'Fernández', '47890123', '667890123', 'luciaFernandez@hotmail.com', 'Av. Rivadavia, 1500, CABA', 12, 33),
(7, 'Martín', 'Gutiérrez', '48901234', '678901234', 'martinGutierrez@gmail.com', 'Roca, 302, Lomas de Zamora', 14, 34),
(8, 'Valentina', 'Díaz', '49012345', '689012345', 'valentinaDiaz@yahoo.com', 'Belgrano, 1087, Quilmes', 15, 35),
(9, 'Facundo', 'Pérez', '50123456', '690123456', 'facundoPerez@gmail.com', 'San Martín, 900, Avellaneda', 18, 36),
(10, 'María', 'López', '51234567', '701234567', 'mariaLopez@hotmail.com', 'Moreno, 567, Ramos Mejía', 19, 37),
(11, 'Diego', 'Morales', '52345678', '712345678', 'diegoMorales2024@gmail.com', 'Alvear, 300, CABA', 22, 38),
(12, 'Camila', 'Rossi', '53456789', '723456789', 'camilaRossi@yahoo.com', 'Belgrano, 200, San Isidro', 23, 39),
(13, 'Julieta', 'Ramírez', '54567890', '734567890', 'julietaRamirez@gmail.com', 'Colon, 400, Pilar', 26, 40),
(14, 'Gabriel', 'Silva', '55678901', '745678901', 'gabrielSilva@yahoo.com', 'Alsina, 500, Lanús', 27, 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id_inmueble` int(11) NOT NULL,
  `tipo_inmueble` int(11) DEFAULT NULL,
  `m2cubierto` int(11) DEFAULT NULL,
  `m2descubierto` int(11) DEFAULT NULL,
  `id_barrio` int(11) DEFAULT NULL,
  `lavadero` tinyint(1) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `anios_antiguedad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `patio` tinyint(1) DEFAULT NULL,
  `banyo` varchar(50) DEFAULT NULL,
  `refaccionar` tinyint(1) DEFAULT NULL,
  `tipo_condicion` int(11) DEFAULT NULL,
  `dormitorio` varchar(50) DEFAULT NULL,
  `cocina` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`id_inmueble`, `tipo_inmueble`, `m2cubierto`, `m2descubierto`, `id_barrio`, `lavadero`, `descripcion`, `anios_antiguedad`, `precio`, `patio`, `banyo`, `refaccionar`, `tipo_condicion`, `dormitorio`, `cocina`, `direccion`) VALUES
(1, 1, 200, 50, 1, 1, 'Amplia casa de dos plantas con jardín trasero', 10, 400000, 1, '2', 0, 3, '1', '1', 'Calle Principal 123'),
(2, 2, 90, 20, 2, 1, 'Departamento luminoso en excelente ubicación', 5, 200000, 0, '1', 0, 2, '1', '1', 'Avenida Libertad 456'),
(3, 1, 150, 80, 3, 0, 'Casa moderna con piscina y amplio jardín', 8, 300000, 1, '2', 0, 1, '3', '1', 'Calle Progreso 789'),
(4, 2, 120, 0, 4, 1, 'Acogedor departamento con balcón', 3, 180000, 1, '1', 0, 2, '2', '1', 'Avenida Costanera 111'),
(5, 1, 250, 50, 5, 1, 'Casa espaciosa con vistas al río', 15, 600000, 1, '3', 1, 3, '4', '1', 'Calle Monte 222'),
(6, 2, 80, 0, 6, 0, 'Departamento céntrico con todas las comodidades', 10, 150000, 0, '1', 0, 2, '1', '1', 'Calle San Martín 333'),
(7, 1, 180, 100, 7, 1, 'Casa con amplio patio en zona residencial', 20, 450000, 1, '2', 1, 1, '3', '1', 'Avenida del Sol 444'),
(8, 1, 150, 0, 8, 1, 'Casa adosada con terraza y garaje', 12, 280000, 1, '2', 0, 2, '2', '1', 'Avenida Rivadavia 555'),
(9, 2, 100, 0, 1, 0, 'Departamento con vista panorámica', 5, 220000, 0, '1', 0, 2, '1', '1', 'Calle Belgrano 666'),
(10, 1, 200, 100, 10, 1, 'Casa de campo con amplio terreno', 25, 500000, 1, '3', 1, 3, '4', '1', 'Avenida Corrientes 777'),
(11, 1, 210, 70, 2, 1, 'Casa de dos pisos con jardín delantero', 12, 320000, 1, '2', 0, 3, '3', '1', 'Calle Independencia 888'),
(12, 2, 100, 30, 3, 1, 'Departamento moderno con vista a la ciudad', 6, 240000, 0, '1', 0, 2, '1', '1', 'Avenida de Mayo 999'),
(13, 1, 170, 90, 4, 1, 'Casa espaciosa con piscina y área de BBQ', 9, 380000, 1, '3', 1, 1, '3', '1', 'Calle Buenos Aires 1010'),
(14, 2, 130, 0, 5, 1, 'Departamento con balcón y excelente iluminación', 4, 190000, 1, '1', 0, 2, '2', '1', 'Avenida San Juan 1111'),
(15, 1, 260, 60, 6, 1, 'Casa con vistas al lago y amplio jardín', 18, 620000, 1, '3', 1, 3, '4', '1', 'Calle del Lago 1212'),
(16, 2, 85, 0, 7, 0, 'Departamento céntrico con todas las facilidades', 11, 160000, 0, '1', 0, 2, '1', '1', 'Calle Florida 1313'),
(17, 1, 190, 110, 8, 1, 'Casa con amplio terreno en zona tranquila', 22, 470000, 1, '2', 1, 1, '3', '1', 'Avenida Santa Fe 1414'),
(18, 1, 160, 0, 9, 1, 'Casa adosada con garaje y patio', 14, 290000, 1, '2', 0, 2, '2', '1', 'Avenida Callao 1515'),
(19, 2, 110, 0, 10, 0, 'Departamento con excelente vista al parque', 7, 230000, 0, '1', 0, 2, '1', '1', 'Calle Arenales 1616'),
(20, 1, 220, 120, 1, 1, 'Casa de campo con amplio jardín y piscina', 28, 510000, 1, '3', 1, 3, '4', '1', 'Avenida Pueyrredón 1717'),
(21, 1, 240, 90, 2, 1, 'Casa con amplio jardín y zona de juegos', 15, 580000, 1, '3', 0, 3, '4', '1', 'Calle Independencia 1818'),
(22, 2, 95, 20, 4, 1, 'Departamento moderno en edificio nuevo', 4, 210000, 0, '1', 0, 2, '1', '1', 'Avenida Libertador 1919'),
(23, 1, 180, 80, 5, 1, 'Casa con jardín y piscina en zona tranquila', 12, 420000, 1, '2', 0, 1, '3', '1', 'Calle Los Álamos 2020'),
(24, 2, 140, 0, 6, 1, 'Departamento en planta baja con patio', 6, 190000, 1, '1', 0, 2, '2', '1', 'Avenida Belgrano 2121'),
(25, 1, 300, 120, 7, 1, 'Casa con vistas panorámicas', 18, 720000, 1, '3', 1, 3, '5', '1', 'Calle del Sol 2222'),
(26, 2, 105, 30, 8, 1, 'Departamento amplio con balcón y vista a la ciudad', 8, 250000, 0, '1', 0, 2, '2', '1', 'Avenida Rivadavia 2323'),
(27, 1, 185, 75, 3, 1, 'Casa con amplio jardín y espacio para piscina', 14, 410000, 1, '3', 1, 1, '3', '1', 'Avenida Mayo 2626'),
(28, 2, 125, 0, 4, 1, 'Departamento luminoso con vista al parque', 5, 260000, 0, '1', 0, 2, '2', '1', 'Calle Libertad 2727');

-- --------------------------------------------------------

--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `id_tipo_cliente` int(11) NOT NULL,
  `tipo_cliente` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`id_tipo_cliente`, `tipo_cliente`) VALUES
(1, 'Propietario'),
(2, 'Inquilino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id_tipo_contrato` int(11) NOT NULL,
  `tipo_contrato` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`id_tipo_contrato`, `tipo_contrato`) VALUES
(1, 'Venta'),
(2, 'Alquiler');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `id_tipo_empleado` int(11) NOT NULL,
  `tipo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`id_tipo_empleado`, `tipo`) VALUES
(1, 'Gerente'),
(2, 'Agente'),
(3, 'Secretario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_garantia`
--

CREATE TABLE `tipo_garantia` (
  `id_tipo_garantia` int(11) NOT NULL,
  `tipo_garantia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_garantia`
--

INSERT INTO `tipo_garantia` (`id_tipo_garantia`, `tipo_garantia`) VALUES
(1, 'Seguro de Caucion'),
(2, 'Aval Bancario'),
(3, 'Titulo de Propiedad Inmueble');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inmueble`
--

CREATE TABLE `tipo_inmueble` (
  `id_tipo_inmueble` int(11) NOT NULL,
  `tipo_inmueble` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_inmueble`
--

INSERT INTO `tipo_inmueble` (`id_tipo_inmueble`, `tipo_inmueble`) VALUES
(1, 'Casa'),
(2, 'Departamento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `forma_pago` int(11) DEFAULT NULL,
  `fk_empleado` int(11) DEFAULT NULL,
  `fk_inmueble` int(11) DEFAULT NULL,
  `fk_cliente` int(11) DEFAULT NULL,
  `fk_contrato` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `monto_total`, `fecha`, `forma_pago`, `fk_empleado`, `fk_inmueble`, `fk_cliente`, `fk_contrato`) VALUES
(1, 350000, '2024-05-15', 1, 1, 13, 13, 14),
(2, 210000, '2023-02-28', 2, 2, 16, 16, 16),
(3, 420000, '2023-03-12', 3, 3, 17, 17, 18),
(4, 200000, '2024-05-23', 4, 4, 20, 20, 20),
(5, 550000, '2023-05-20', 1, 1, 21, 21, 22),
(6, 160000, '2023-06-02', 2, 6, 24, 24, 24),
(7, 400000, '2023-07-18', 3, 7, 25, 25, 25),
(8, 230000, '2023-08-10', 4, 3, 28, 28, 26),
(9, 480000, '2023-09-05', 1, 9, 9, 9, 27),
(10, 300000, '2023-10-22', 2, 9, 10, 10, 28),
(11, 20000, '2023-10-22', 2, 2, 1, 1, 29),
(12, 20000, '2023-10-22', 2, 2, 2, 2, 30),
(13, 20000, '2023-10-22', 2, 2, 3, 3, 30),
(14, 20000, '2023-10-22', 2, 2, 4, 4, 31);

-- --------------------------------------------------------

--


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_alquiler`),
  ADD KEY `forma_pago` (`forma_pago`),
  ADD KEY `tipo_garantia` (`tipo_garantia`),
  ADD KEY `fk_empleado` (`fk_empleado`),
  ADD KEY `fk_inmueble` (`fk_inmueble`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_contrato` (`fk_contrato`);

--
-- Indices de la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`id_barrio`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `tipo_cliente` (`tipo_cliente`),
  ADD KEY `fk_inmueble` (`fk_inmueble`);

--
-- Indices de la tabla `condicion`
--
ALTER TABLE `condicion`
  ADD PRIMARY KEY (`id_condicion`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `tipo_contrato` (`tipo_contrato`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `tipo_empleado` (`tipo_empleado`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_forma_pago`);

--
-- Indices de la tabla `garante`
--
ALTER TABLE `garante`
  ADD PRIMARY KEY (`id_garante`),
  ADD KEY `fk_cliente` (`fk_cliente`),
  ADD KEY `fk_alquiler` (`fk_alquiler`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id_inmueble`),
  ADD KEY `tipo_inmueble` (`tipo_inmueble`),
  ADD KEY `id_barrio` (`id_barrio`),
  ADD KEY `tipo_condicion` (`tipo_condicion`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`id_tipo_cliente`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id_tipo_contrato`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id_tipo_empleado`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id_alquiler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `garante`
--
ALTER TABLE `garante`
  MODIFY `id_garante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;