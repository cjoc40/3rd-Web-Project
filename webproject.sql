-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2023 at 04:07 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` varchar(10) NOT NULL,
  `productID` varchar(10) DEFAULT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `productID`, `categoryName`, `description`, `picture`) VALUES
('C2', 'P2', 'Electric Guitars', 'LA Electric Guitar', '[LA_electricGuitar.png]');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberID` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `town_city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `firstName`, `lastName`, `email`, `phoneNum`, `passWord`, `address1`, `address2`, `town_city`, `county`) VALUES
(1, 'Kristers', 'Rakstins', 'kristerssrakstinss@gmail.com', '(+353 89 982 7826)', '**********', '10 Convent Lane', 'Drangan', 'Thurles', 'Tipperary');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderID` varchar(10) NOT NULL,
  `productID` varchar(10) NOT NULL,
  `price` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderID`, `productID`, `price`, `quantity`, `discount`) VALUES
('B1', 'P2', '€150', 1, '0%');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` varchar(10) NOT NULL,
  `productID` varchar(10) DEFAULT NULL,
  `memberID` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL,
  `deliveryOption` varchar(255) DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `productID`, `memberID`, `quantity`, `orderDate`, `deliveryDate`, `deliveryOption`, `paymentType`) VALUES
('B1', 'P2', 1, 1, '2022-11-08', '2022-11-12', 'Next Day Delivery', 'Debit Card');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` varchar(10) NOT NULL,
  `categoryID` varchar(10) DEFAULT NULL,
  `warehouseID` varchar(10) DEFAULT NULL,
  `supplierID` varchar(10) DEFAULT NULL,
  `barcode` varchar(20) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `productDesc` varchar(255) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `productAvailability` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `warehouseID`, `supplierID`, `barcode`, `brand`, `productDesc`, `price`, `quantity`, `productAvailability`) VALUES
('P2', 'C2', 'W3', 'S2', '{5012345678900}', 'Nike', 'LA Electric Guitar', '€150', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `positions` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstName`, `lastName`, `email`, `phoneNum`, `passWord`, `positions`, `permissions`, `hireDate`, `dateOfBirth`) VALUES
(1, 'Kris', 'Raks', 'kristerssrakstinss@gmail.com', '(+353 89 982 7826)', '**********', 'Manager', 'Full', '2010-11-08', '1985-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplierID` varchar(10) NOT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `contactName` varchar(255) DEFAULT NULL,
  `contactTitle` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `town_city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplierID`, `companyName`, `contactName`, `contactTitle`, `phoneNum`, `address1`, `address2`, `town_city`, `county`, `country`) VALUES
('S2', 'Nike', 'Ben Shapps', 'Sales Manager', '[+353 89 475 3373]', '7-17 Sheephill Park', 'Ballycoolen', 'Dublin', 'Dublin', 'Ireland');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouseID` varchar(10) NOT NULL,
  `warehouseName` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `town_city` varchar(255) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_eircode` varchar(10) DEFAULT NULL,
  `productID` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouseID`, `warehouseName`, `address1`, `address2`, `town_city`, `county`, `country`, `zip_eircode`, `productID`, `quantity`) VALUES
('W3', 'Bargain Rail', 'Unit 1 89th Henry Str.', NULL, 'Limerick', 'Limerick', 'Ireland', 'E41 K379', 'P2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderID`,`productID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplierID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
