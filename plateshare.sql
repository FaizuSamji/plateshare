-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2023 at 12:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plateshare`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Hausa '),
(2, 'African'),
(3, 'Acient'),
(5, 'European'),
(6, 'Caribbean ');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0,
  `recipe_id` bigint(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `message`, `timestamp`, `status`, `recipe_id`) VALUES
(2, 2, ' Its amazing', '2023-06-23 00:12:00', 1, 3),
(3, 1, ' okay', '2023-09-29 07:23:47', 1, 8),
(4, 1, ' Deliciuos', '2023-09-29 07:37:24', 0, 3),
(7, 3, ' hello', '2023-10-19 07:02:46', 0, 3),
(8, 3, ' wow', '2023-10-19 07:24:22', 0, 3),
(10, 3, ' great', '2023-10-24 11:30:06', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `ingredient` text DEFAULT NULL,
  `direction` text DEFAULT NULL,
  `cook_time` varchar(1000) DEFAULT NULL,
  `yield` varchar(1000) DEFAULT NULL,
  `category_id` varchar(1000) DEFAULT NULL,
  `image` varchar(1000) DEFAULT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `ingredient`, `direction`, `cook_time`, `yield`, `category_id`, `image`, `timestamp`, `status`) VALUES
(3, 'Greek Orzo Salad', '2 tbsp. fresh lemon juice\r\n1/2 tsp. Dijon mustard \r\n1/4 c. extra-virgin olive oil\r\n2 tbsp. freshly chopped dill, plus more for serving\r\n1/4 c. minced red onion\r\nKosher salt\r\nFreshly ground black pepper\r\n8 oz. orzo\r\n3 Persian cucumbers, sliced into thin half-moons\r\n2 c. cherry tomatoes, halved\r\n1 (15.5-oz.) can chickpeas, drained and rinsed\r\n1/2 c. pitted kalamata olives, halved\r\n1 c. crumbled feta (about 1/4 lb.)', 'In a pot of salted boiling water, cook orzo according to package directions until al dente. Drain and set aside. Make dressing: In a large bowl, whisk together lemon juice and mustard. While whisking, slowly add oil until fully combined. Stir in dill and red onion, then season with salt and pepper. Make salad: Add orzo, cucumbers, cherry tomatoes, chickpeas, and olives to dressing and toss to coat. Fold in feta and serve with more dill on top.', '35 mins', '6 serving(s)', '3', 'uploads/Capture.PNG', '2023-06-22 23:46:23.932002', 1),
(4, 'Homemade Salsa', '1 white onion, quartered\r\n2 jalapeños, stems removed, halved lengthwise\r\n2 c. cherry tomatoes, halved\r\n1 tbsp. extra-virgin olive oil\r\nKosher salt\r\nFreshly ground black pepper\r\n3 beefsteak or heirloom tomatoes, quartered\r\n3 cloves garlic\r\n1/2 c. fresh cilantro leaves\r\nJuice of 1 lime\r\n1/2 tsp. ground cumin\r\nPinch of crushed red pepper flakes \r\nTortilla chips, for serving', 'Preheat oven to 400°. On a large baking sheet, toss onion, jalapeños, and oil; season with salt and black pepper. Roast until vegetables are slightly charred, about 20 minutes. Transfer onion mixture to a food processor. Add beefsteak tomatoes, garlic, cilantro, lime juice, cumin, and red pepper; season with salt and black pepper. Pulse a few times until mostly blended and slightly chunky. Transfer salsa to a serving bowl. Serve with chips alongside.', '40 mins', '10 serving(s)', '5', 'uploads/Salsa.PNG', '2023-06-23 09:19:15.503383', 1),
(5, 'Blackberry Jam', '4 c. blackberries\r\n2 c. granulated sugar\r\n2 tbsp. lemon juice\r\n2 tsp. lemon zest (optional)', 'Combine blackberries, sugar, and lemon juice in a large bowl. Use a large spoon or potato masher to crush the berries, then transfer mixture to a medium sauce pan.\r\n Heat sauce pan over medium heat and bring to a boil. Cook, stirring occasionally, until jam is thick, 15 to 20 minutes. Skim any foam that has risen to the surface and stir in lemon zest if using. Transfer to a clean glass jar and let cool completely. Tightly secure lid and refrigerate. ', ' 20 mins', '2 serving', '5', 'uploads/berry.PNG', '2023-06-23 09:23:11.946975', 1),
(6, 'Best Bloody Mary', 'Bloody Mary salt or kosher salt, for glass\r\n2 lemon wedges\r\n4 oz. tomato juice\r\n2 oz. vodka\r\n2 tsp. fresh lemon juice\r\n2 tsp. horseradish\r\n1 tsp. Worcestershire sauce\r\n1/4 tsp. celery salt\r\n1/4 tsp. freshly ground black pepper\r\n1/4 tsp. hot sauce\r\n1/4 tsp. kosher salt\r\nIce\r\nCelery stalks and olives, for serving', 'Pour Bloody Mary salt onto a shallow plate. Rub a lemon wedge around rim of a Collins glass, then dip into salt. In a cocktail shaker, combine tomato juice, vodka, lemon juice, horseradish, Worcestershire, celery salt, pepper, hot sauce, and kosher salt. Fill shaker with ice and vigorously shake until outside of shaker is very frosty, about 20 seconds. Pour into prepared glass. Garnish with celery stalk, olives, and lemon wedge.', ' 15 mins', '1 serving(s)', '6', 'uploads/fruit.PNG', '2023-06-23 09:27:14.990242', 1),
(7, 'Zucchini Bread', 'Cooking spray\r\n2 1/2 c. (300 g.) all-purpose flour\r\n1 tsp. baking powder\r\n1 tsp. ground cinnamon\r\n3/4 tsp. kosher salt\r\n1/2 tsp. baking soda\r\n3/4 c. (150 g.) packed light brown sugar\r\n1/2 c. (100 g.) granulated sugar\r\n1/2 c. (1 stick) unsalted butter, melted, cooled\r\n1/2 c. vegetable oil\r\n3 large eggs\r\n1 tsp. pure vanilla extract\r\n3 1/2 c. (315 g.) grated zucchini (from about 2 large or 3 medium)', 'Preheat oven to 350°. Grease a 9\"-by-5\" loaf pan with cooking spray. In a medium bowl, whisk flour, baking powder, cinnamon, salt, and baking soda. \r\nIn a large bowl, whisk brown sugar, granulated sugar, butter, and oil until combined. Add eggs and vanilla and mix until smooth. Add dry ingredients and fold until just a few streaks remain. Add zucchini and mix until just combined. Pour batter into prepared pan; smooth top. \r\nBake bread until a tester inserted into the center comes out clean, about 1 hour 15 minutes. Let cool completely before slicing. ', '1 hr 40 mins', '8 - 10 serving(s)', '5', 'uploads/bread.PNG', '2023-06-23 09:30:04.255463', 1),
(8, 'African Chicken', '2 pound (1-kg) bone-in skin-on chicken thighs and/or legs (*Footnote 1)\r\n2 tablespoons olive oil\r\n1 onion , sliced\r\n1 tablespoon ginger , minced\r\n3 cloves garlic , minced\r\n1 tablespoon paprika powder\r\n2 tablespoons Madras curry powder\r\n1 cup chicken stock\r\n1/2 can (270-millimeter / 9 ounce) coconut milk\r\n1/4 cup unsalted natural peanut butter\r\n1/4 cup oyster sauce\r\n2 bay leaves\r\n1 (14 ounces / 400 grams) russet potato , peeled and chopped\r\n2 bell peppers , chopped\r\nChopped parsley for garnish (Optional)', 'Preheat the oven to 350 degrees F (180 C).\r\nCombine all the ingredients of the spice mix. Sprinkle on both sides of the chicken.\r\nHeat a large skillet over medium-high heat until hot. Add 1 tablespoon of olive oil. Add chicken, skin side down. Cook until both sides turn dark brown and crispy, 2 to 3 minutes per side. Transfer chicken onto a big plate.\r\nTurn to medium heat. Add the rest of the 1 tablespoon of olive oil and onion. Cook until it becomes tender, about 5 minutes.\r\nAdd ginger and garlic. Stir fry for 30 seconds, to release the aroma.\r\nAdd paprika powder and curry powder. Stir until the ingredients are well coated with spices, 20 to 30 seconds.\r\nAdd chicken stock, coconut milk, peanut butter, oyster sauce, and bay leaves. Stir with a spatula to dissolve the peanut butter until it’s well blended with the sauce. Bring to the boil.\r\nAdd potato, peppers, and chicken to the curry. Transfer the pan to the oven. Bake until the chicken is cooked through and the skin crispy, about 45 minutes.\r\nServe hot over steamed rice.', '30 Mins', ' 4 to 6 servings', '2', 'uploads/chicken.PNG', '2023-06-23 09:38:01.121506', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(1000) DEFAULT NULL,
  `username` varchar(1000) DEFAULT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `role` varchar(1000) NOT NULL DEFAULT 'user',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `timestamp`) VALUES
(2, 'Sanee Itas', 'saneeitas@gmail.com', '202cb962ac59075b964b07152d234b70', 'user', '2023-06-21 11:20:45'),
(3, 'faizu', 'gf@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'user', '2023-10-17 14:23:10'),
(4, 'faizu', 'faizusaleh3323@gmail.com', 'acf4b89d3d503d8252c9c4ba75ddbf6d', 'user', '2023-10-25 22:33:18'),
(6, 'Muhd Sani', 'Itas', '202cb962ac59075b964b07152d234b70', 'user', '2023-10-27 10:34:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
