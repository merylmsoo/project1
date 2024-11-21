-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 09, 2024 at 10:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ModiShop`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `product_name` text NOT NULL,
  `product_desc` text NOT NULL,
  `product_cost` int(50) NOT NULL,
  `product_category` text NOT NULL,
  `product_image_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_desc`, `product_cost`, `product_category`, `product_image_name`) VALUES
(1, 'infinix', 'most durable and affordable phone in the market', 20000, 'phones', 'phone1.jpg'),
(2, 'NovaVision Lite', ' A mid-range phone with a vibrant display, decent performance for everyday tasks, and a sleek design, perfect for students and young professionals.\r\n', 1, 'phones', 'phone2.jpg'),
(3, 'EliteSecure 11', 'A privacy-centric smartphone with advanced encryption features, a secure operating system, and a 6.6-inch display designed for professionals.', 100000, 'phones', 'phone3.jpg'),
(4, 'TravelLite 9', 'A travel-focused phone with global SIM compatibility, a long-lasting battery, and a compact design that fits easily in pockets.\r\n', 70000, 'phones', 'phone4.jpg'),
(5, 'HealthTrack 7', 'A health-oriented phone that includes built-in sensors for monitoring fitness metrics, a large display, and integration with health apps.', 90000, 'phones', 'phone5.jpg'),
(6, 'ConnectMate 5G', 'A budget-friendly 5G smartphone with a durable design, a 6.4-inch display, and a reliable dual-camera setup for everyday use.', 50000, 'phones', 'phone6.jpg'),
(7, 'PhotoVision 12', 'A photography-focused smartphone with a 200MP camera, advanced AI editing features, and a stunning 6.8-inch display for viewing photos.', 120000, 'phones', 'phone4.jpg'),
(8, 'SnapFlex Pro', 'A versatile phone with a foldable display, offering a compact form factor while providing a large screen for productivity and media consumption.', 130000, 'phones', 'phone1.jpg'),
(9, 'GamePulse Z', ' Designed for gamers, this phone boasts a 120Hz refresh rate, customizable cooling features, and enhanced graphics performance.', 10000, 'phones', 'phone2.jpg'),
(10, 'EcoSmart X2\r\n\r\n', 'An eco-friendly phone made from recycled materials, featuring solar charging capabilities, a 6.5-inch display, and a robust battery life.\r\n', 60000, 'phones', 'phone6.jpg'),
(11, 'SmartSound 360', 'A portable Bluetooth speaker with 360-degree sound, waterproof design, and 20 hours of battery life, perfect for outdoor adventures.', 20000, 'electronics', 'screen1.jpg'),
(12, 'GamerHub Pro', ' An advanced gaming keyboard with customizable RGB lighting, mechanical switches, and programmable macros for an enhanced gaming experience.', 12000, 'electronics', 'screen1.jpg'),
(13, 'VisionView 4K', ' A sleek 55-inch 4K Ultra HD smart TV with voice control, built-in streaming apps, and HDR support for stunning visuals.', 70000, 'electronics', 'screen2.jpg'),
(14, 'EcoCharge Duo', 'A solar-powered dual-port USB charger designed for eco-conscious users, capable of charging two devices simultaneously with fast charging technology.', 6000, 'electronics', 'screen2.jpg'),
(15, 'HomeGuard Pro', 'A smart security camera with 1080p HD video, night vision, two-way audio, and motion detection, accessible via a mobile app.', 20000, 'electronics', 'screen2.jpg'),
(16, 'AirBuds X', 'Wireless earbuds with active noise cancellation, touch controls, and a long-lasting battery for an immersive audio experience on the go.', 90000, 'electronics', 'screen3.jpg'),
(17, 'FitTrack Smart Scale', ' smart bathroom scale that syncs with a mobile app to track weight, body fat percentage, and other metrics for health monitoring.', 9000, 'electronics', 'screen3.jpg'),
(18, 'PowerStation 20000', 'A high-capacity portable power bank with multiple USB ports, wireless charging, and LED display for charging devices on the go.', 90000, 'electronics', 'screen5.jpg'),
(19, 'TechNest Smart Hub', ' A versatile smart home hub that connects and controls all your smart devices, featuring voice control and a user-friendly interface.', 120000, 'electronics', 'screen6.jpg'),
(20, 'Radiant Glow Serum', 'A lightweight serum that enhances skin radiance and reduces dark spots.', 30, 'Beauty', 'bed1.jpg'),
(21, 'Hydrating Face Mask', 'A moisturizing mask that nourishes and rejuvenates dry skin.', 20, 'Beauty', 'bed2.jpg'),
(22, 'Silk Smooth Foundation', 'A full-coverage foundation that provides a flawless, natural finish.', 35, 'Beauty', 'bed3.jpg'),
(23, 'Revitalizing Eye Cream', 'An eye cream designed to reduce puffiness and dark circles.', 25, 'Beauty', 'bed5.jpg'),
(24, 'Ultra Nourishing Lip Balm', 'A rich lip balm that hydrates and protects lips from dryness.', 10, 'Beauty', 'bed10.jpg'),
(25, 'Refreshing Facial Mist', 'A soothing facial mist that refreshes and hydrates skin throughout the day.', 15, 'Beauty', 'bath1.jpg'),
(26, 'Exfoliating Scrub', 'A gentle scrub that removes dead skin cells for a smoother complexion.', 23, 'Beauty', 'bed9.jpg'),
(27, 'Luxury Perfume', 'An elegant fragrance that captures the essence of sophistication and charm.', 60, 'Beauty', 'bed8.jpg'),
(28, 'Volumizing Mascara', 'A mascara that adds length and volume for bold, beautiful lashes.', 16, 'Beauty', 'bed4.jpeg'),
(29, 'Brightening Cleanser', 'A gentle cleanser that brightens skin tone and removes impurities.', 18, 'Beauty', 'bed6.jpg'),
(30, 'Refreshing Facial Mist', 'A soothing facial mist that refreshes and hydrates skin throughout the day.', 15, 'Beauty', 'bed3.jpg'),
(40, 'Chic Denim Jacket', 'A stylish denim jacket perfect for layering on cool days.', 50, 'Fashion', 'decor1.jpg'),
(41, 'Classic White Sneakers', 'Comfortable and versatile sneakers for everyday wear.', 60, 'Fashion', 'decor2.jpg'),
(42, 'Elegant Evening Dress', 'A stunning evening dress that makes a statement at any event.', 90, 'Fashion', 'decor3.jpg'),
(43, 'Casual Graphic Tee', 'A soft graphic tee that pairs well with jeans or shorts.', 25, 'Fashion', 'decor4.jpg'),
(44, 'Trendy Sunglasses', 'Fashionable sunglasses to protect your eyes while looking chic.', 30, 'Fashion', 'decor5.jpg'),
(45, 'Stylish Handbag', 'A versatile handbag that complements any outfit.', 80, 'Fashion', 'decor6.jpg'),
(46, 'Chic Denim Jacket', 'A stylish denim jacket perfect for layering on cool days.', 50, 'Fashion', 'decor1.jpg'),
(47, 'Classic White Sneakers', 'Comfortable and versatile sneakers for everyday wear.', 60, 'Fashion', 'decor2.jpg'),
(48, 'Elegant Evening Dress', 'A stunning evening dress that makes a statement at any event.', 90, 'Fashion', 'decor3.jpg'),
(49, 'Trendy Sunglasses', 'Fashionable sunglasses to protect your eyes while looking chic.', 30, 'Fashion', 'decor5.jpg'),
(50, 'TechNest Smart Hub', 'A versatile smart home hub that connects and controls all your smart devices, featuring voice control and a user-friendly interface.', 50000, 'electronics', 'phone6.jpg'),
(51, 'Microwave Oven', 'Compact microwave for quick meals', 90, 'Appliances', 'appl.jpg'),
(52, 'Refrigerator', 'Energy-efficient fridge with large capacity', 600, 'Appliances', 'appl2.jpg'),
(53, 'Blender', 'High-speed blender for smoothies and soups', 50, 'Appliances', 'appl3.jpg'),
(54, 'Washing Machine', 'Front-loading washing machine with smart features', 500, 'Appliances', 'appl4.jpg'),
(55, 'Dishwasher', 'Quiet dishwasher with multiple wash settings', 400, 'Appliances', 'appl5.jpg'),
(56, 'Toaster', '2-slice toaster with adjustable browning', 30, 'Appliances', 'appl.jpg'),
(57, 'Coffee Maker', 'Programmable coffee maker for fresh brews', 60, 'Appliances', 'appl2.jpg'),
(58, 'Air Fryer', 'Healthy air fryer with rapid cooking technology', 80, 'Appliances', 'appl3.jpg'),
(59, 'Slow Cooker', '6-quart slow cooker for effortless meals', 40, 'Appliances', 'appl4.jpg'),
(60, 'Electric Kettle', 'Quick boiling kettle with auto shut-off', 35, 'Appliances', 'appl5.jpg'),
(61, 'Electric Razor', 'Cordless electric razor with precision blades', 80, 'Grooming', 'bath1.jpg'),
(62, 'Hair Dryer', 'Powerful hair dryer with multiple heat settings', 50, 'Grooming', 'bath2.jpg'),
(63, 'Shaving Cream', 'Moisturizing shaving cream for a smooth shave', 10, 'Grooming', 'bath3.jpg'),
(64, 'Beard Trimmer', 'Adjustable beard trimmer with multiple length settings', 40, 'Grooming', 'bath4.jpg'),
(65, 'Hair Straightener', 'Ceramic hair straightener for sleek styles', 60, 'Grooming', 'bath5.jpg'),
(66, 'Body Wash', 'Gentle body wash with natural ingredients', 15, 'Grooming', 'bath1.jpg'),
(67, 'Facial Moisturizer', 'Hydrating facial moisturizer for all skin types', 25, 'Grooming', 'bath2.jpg'),
(68, 'Nail Clippers', 'High-quality nail clippers for precision grooming', 6, 'Grooming', 'bath3.jpg'),
(69, 'Electric Toothbrush', 'Rechargeable electric toothbrush with timer', 30, 'Grooming', 'bath4.jpg'),
(70, 'Hair Gel', 'Strong hold hair gel for styling', 13, 'Grooming', 'bath5.jpg'),
(71, 'sumsung s24', 'They decsribe type of phone', 444, 'electronics', 'm11 (2).jpg'),
(74, 'Maxi Dress', 'A long dress that typically reaches down to the ankles or floor. Maxi dresses are versatile and can be casual or formal, often featuring bold prints or flowing fabrics for a relaxed vibe.', 1500, 'dresses', 'd2.jpg'),
(75, 'A-Line Dress:', 'This dress features a fitted bodice that gradually flares out from the waist, resembling the shape of a capital \"A.\" It’s flattering for many body types and is often made from a variety of fabrics.', 200, 'dresses', 'd1.jpg'),
(76, 'Maxi Dress', 'A long dress that typically reaches down to the ankles or floor. Maxi dresses are versatile and can be casual or formal, often featuring bold prints or flowing fabrics for a relaxed vibe.', 1500, 'dresses', 'd2.jpg'),
(77, 'Sheath Dress', 'A fitted dress that hugs the body from the neckline to the hem, usually knee-length. It’s often seen in professional settings and is ideal for showcasing curves with a sleek silhouette.', 3000, 'dresses', 'd3.jpg'),
(78, 'Wrap Dress', 'Characterized by its overlapping front and tie closure, this dress cinches at the waist and is known for its flattering fit. It can be made from various materials and is perfect for both casual and formal occasions.', 1500, 'dresses', 'd4.jpg'),
(79, 'Ball Gown', 'A formal dress with a fitted bodice and a voluminous skirt that typically extends to the floor. Ball gowns are often worn for events like proms and galas, featuring luxurious fabrics and embellishments.', 4000, 'dresses', 'd5.jpg'),
(80, 'Shift Dress:', 'A loose-fitting dress that hangs straight down from the shoulders without a defined waistline. It’s typically knee-length and is great for a relaxed, yet chic look, often worn in casual or office settings.', 2000, 'dresses', 'd6.jpg'),
(81, 'Cocktail Dress:', 'A semi-formal dress, usually knee-length, designed for evening events. Cocktail dresses come in various styles and fabrics, often featuring playful designs or embellishments for a festive look.', 2000, 'dresses', 'd7.jpg'),
(82, 'Sundress', 'A lightweight, usually sleeveless dress that is perfect for warm weather. Sundresses often have a relaxed fit and are made from breathable fabrics, making them ideal for casual outings and summer events.', 5000, 'dresses', 'd8.jpg'),
(83, 'Fit-and-Flare Dress', 'This style has a fitted bodice and a flared skirt that creates a feminine silhouette. It’s versatile for both day and evening wear, often seen in playful prints and colors.', 4000, 'dresses', 'd9.jpg'),
(84, 'T-shirt Dress', 'A casual, relaxed dress that resembles a long t-shirt. It’s typically made from soft, stretchy fabric and can be styled with sneakers or sandals for a laid-back look.', 2000, 'dresses', 'd10.jpg'),
(85, 'Tote Bag:', 'A large, open-top bag with sturdy handles, perfect for carrying everyday essentials. Totes are often made from canvas or leather and are great for work, shopping, or travel.', 2000, 'handbags', 'h1.jpg'),
(86, 'Crossbody Bag', 'A compact bag worn across the body with a long strap, allowing for hands-free convenience. Crossbody bags come in various styles and are ideal for casual outings or travel.\r\n\r\n', 4000, 'handbags', 'h2.jpg'),
(87, 'Clutch', ' A small, often strapless bag designed to be held in the hand. Clutches are typically used for formal events or evenings out and can be embellished or sleek, depending on the occasion.', 3000, 'handbags', 'h3.jpg'),
(88, 'Satchel', 'A structured bag with a top handle and often a long strap. Satchels usually feature a flap and multiple compartments, making them practical for work or school.', 6000, 'handbags', 'h4.jpg'),
(89, 'Backpack', 'A bag carried on the back with two straps. Backpacks are versatile and can range from casual styles to chic designs, making them suitable for school, travel, or everyday use.', 1000, 'handbags', 'h5.jpg'),
(90, 'Bucket Bag', 'A bag with a round bottom and an open top that cinches closed with a drawstring. Bucket bags are stylish and spacious, often used for casual outings or day trips.', 5000, 'handbags', 'h6.jpg'),
(91, 'Messenger Bag', 'A rectangular bag worn across the body, typically with a long strap and a flap closure. Originally designed for cyclists, messenger bags are now popular for casual and professional settings.', 6000, 'handbags', 'h7.jpg'),
(92, 'Hobo Bag', ' A slouchy, crescent-shaped bag with a long strap that allows it to be worn over the shoulder. Hobo bags are usually made from soft materials and are great for a laid-back look.', 1300, 'handbags', 'h9.jpg'),
(93, 'Weekender Bag', 'A larger, often soft-sided bag designed for short trips or weekend getaways. Weekender bags have ample space for clothing and essentials, usually featuring sturdy handles or straps.\r\n\r\n', 5400, 'handbags', 'h8.jpg'),
(94, 'Belt Bag', 'Also known as a fanny pack, this small bag is worn around the waist or across the body. Belt bags are practical for travel or festivals, allowing for easy access to essentials while keeping hands free.', 1200, 'handbags', 'h10.jpg'),
(95, 'Baseball Cap', 'A classic cap with a rounded crown and a stiff, curved brim. Often made from cotton or polyester, baseball caps are popular for casual wear and sports, featuring adjustable straps or snapbacks.', 500, 'cap', 'c1.jpg'),
(96, 'Snapback Cap', ' Similar to a baseball cap but with a flat brim and an adjustable snap closure at the back. Snapbacks are often associated with streetwear and come in various colors and designs.', 200, 'cap', 'c2.jpg'),
(97, 'Dad Hat', ':A relaxed, unstructured cap with a slightly curved brim and an adjustable strap. Dad hats are known for their comfortable fit and are often made from cotton, giving them a laid-back, vintage vibe.', 400, 'cap', 'c3.jpg'),
(98, 'Beanie', 'A close-fitting knitted cap that covers the head and ears. Beanies can be worn in various styles, from slouchy to fitted, and are great for cold weather.', 600, 'cap', 'c4.jpg'),
(99, 'Trucker Hat', 'A style of cap with a mesh back and a foam front, typically featuring a snapback closure. Trucker hats are popular for their breathability and casual style, often adorned with fun graphics or logos.', 700, 'cap', 'c5.jpg'),
(100, 'Bucket Hat', 'A soft, wide-brimmed hat with a downward-sloping brim. Bucket hats are often made of cotton or canvas and are popular for outdoor activities, providing sun protection.', 400, 'cap', 'c6.jpg'),
(101, 'Newsboy Cap', 'A round, flat cap with a small, stiff brim in the front. Traditionally made of tweed or wool, newsboy caps have a vintage charm and are often associated with classic fashion.', 490, 'cap', 'c7.jpg'),
(102, 'Visor', 'A cap with a brim but no crown, designed to shield the eyes from the sun while leaving the head exposed. Visors are popular in sports, especially golf and tennis.', 480, 'cap', 'c8.jpg'),
(103, 'Fedora', ' A soft-brimmed hat with a pinch in the crown. Fedoras are often made of felt or straw and are associated with a more formal or stylish look, adding sophistication to outfits.', 700, 'cap', 'c9.jpg'),
(104, 'Pilot Cap', 'Also known as an aviator cap, this hat has ear flaps and is typically made of leather or fur. Originally designed for pilots to keep warm, it has become a stylish accessory in colder weather.', 345, 'cap', 'c10.jpg'),
(105, 'Crew Socks', ' These socks extend to the mid-calf and are versatile for everyday wear. They provide comfort and warmth, making them popular for both casual and athletic use.', 50, 'socks', 's1.jpg'),
(106, 'Ankle Socks', 'Ankle socks sit just above the ankle and are commonly worn with sneakers or casual shoes. They offer minimal coverage and are great for warmer weather.', 50, 'socks', 's2.jpg'),
(107, 'Knee-High Socks', 'These socks reach up to the knee and can be worn for warmth or fashion. Often made from thicker materials, they are popular in colder months and can add flair to outfits.', 48, 'socks', 's3.jpg'),
(108, 'Dress Socks', 'Typically made from finer materials like cotton or wool, dress socks are designed to be worn with formal or business attire. They are usually thinner and come in various colors and patterns.', 30, 'socks', 's4.jpg'),
(109, 'Athletic Socks', 'Designed specifically for sports, athletic socks offer cushioning, moisture-wicking properties, and arch support. They come in various lengths, including crew and ankle styles, and are made from breathable materials.', 50, 'socks', 's5.jpg'),
(110, 'No-Show Socks', 'These socks are designed to be hidden inside shoes, making them ideal for loafers or low-cut sneakers. They often have silicone grips to prevent slipping and provide a barefoot look.', 80, 'socks', 's6.jpg'),
(111, 'Thermal Socks', 'Made from thicker materials like wool or fleece, thermal socks are designed to provide extra warmth in cold weather. They are great for winter activities like skiing or hiking.', 120, 'socks', 's7.jpg'),
(112, 'Compression Socks', ' These socks are designed to apply pressure to the legs and improve circulation. They are often used by athletes during workouts or by travelers to reduce swelling during long flights.', 150, 'socks', 's8.jpg'),
(113, 'Toe Socks', ' Featuring individual compartments for each toe, toe socks provide a unique fit and can enhance comfort in shoes. They are often made from stretchy materials and are popular for yoga or running.', 130, 'socks', 's9.jpg'),
(114, 'Fun or Novelty Socks', 'These socks come in a variety of colors, patterns, and whimsical designs. They are often worn as a fashion statement and can reflect personal interests or humor.', 370, 'socks', 's10.jpg'),
(115, 'Leather Belt', 'A classic belt made from genuine leather, often used for both casual and formal outfits. They come in various widths and styles, typically featuring a metal buckle.', 500, 'belt', 'b1.jpg'),
(116, 'Canvas Belt', 'Made from durable fabric, canvas belts are casual and lightweight. They often feature a simple buckle and are great for outdoor activities or casual wear.', 690, 'belt', 'b2.jpg'),
(117, 'Canvas Belt', 'Made from durable fabric, canvas belts are casual and lightweight. They often feature a simple buckle and are great for outdoor activities or casual wear.', 690, 'belt', 'b2.jpg'),
(118, 'Canvas Belt', 'Made from durable fabric, canvas belts are casual and lightweight. They often feature a simple buckle and are great for outdoor activities or casual wear.', 690, 'belt', 'b2.jpg'),
(119, 'Dress Belt', 'A more refined belt, usually made from leather and designed to complement formal or business attire. Dress belts are typically narrower than casual belts and have a polished finish.', 400, 'belt', 'b3.jpg'),
(120, 'Wide Belt', 'These belts have a broader design, often used to accentuate the waist in dresses or tunics. Wide belts can be made from various materials and come in various styles, including elastic or leather.', 300, 'belt', 'b4.jpg'),
(121, 'Braided Belt', ' A belt made from woven materials, often leather or synthetic fibers. Braided belts provide a relaxed look and can be adjusted to fit different waist sizes due to their flexible design.', 400, 'belt', 'b5.jpg'),
(122, 'Braided Belt', ' A belt made from woven materials, often leather or synthetic fibers. Braided belts provide a relaxed look and can be adjusted to fit different waist sizes due to their flexible design.', 400, 'belt', 'b5.jpg'),
(123, 'Sash Belt', '  a long, fabric belt that is tied around the waist, often used in dresses or as part of a layered outfit. Sash belts can be made from various materials and add a stylish touch.', 600, 'belt', 'b6.jpg'),
(124, 'Utility Belt', 'Designed for functionality, utility belts often feature multiple pockets or loops for holding tools and equipment. They are popular in work environments or for outdoor activities.', 500, 'belt', 'b7.jpg'),
(125, 'Suspenders', 'Although not a traditional belt, suspenders serve a similar purpose by holding up pants. They attach to trousers with clips or buttons and can add a vintage or stylish flair to outfits.', 200, 'belt', 'b8.jpg'),
(126, 'Belt Bag (Bum Bag)', 'A functional accessory that can be worn around the waist or across the body, belt bags serve as both a belt and a small storage solution. They are great for hands-free convenience.', 700, 'belt', 'b9.jpg'),
(127, 'Belt Bag (Bum Bag)', 'A functional accessory that can be worn around the waist or across the body, belt bags serve as both a belt and a small storage solution. They are great for hands-free convenience.', 700, 'belt', 'b9.jpg'),
(128, 'Fashion Belt', 'These belts focus on style rather than functionality and often feature unique designs, embellishments, or bold colors. Fashion belts can be used to make a statement or add a pop of color to an outfit.', 500, 'belt', 'b10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `username` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `gender`, `phone`, `password`) VALUES
(5, 'nimrod arak', 'merylmsoo32@gmail.com', 'male', '0794758281', 'Mary@5293'),
(6, 'duncan muturi', 'merylmsoo@gmail.com', 'male', '+254794758281', 'Mary5293@'),
(7, 'admin', 'merylms@gmail.com', 'male', '0710237039', 'Mary@5293'),
(8, 'CHURCH', 'merylms@gmail.com', 'male', '0768474795', 'your password is too short'),
(9, 'Ronoh Flevian', 'merylmsoo32@gmail.com', 'male', '0757694122', 'your password is too short'),
(10, 'Ronoh Flevian', 'merylmsoo32@gmail.com', 'female', '0757694122', 'nhhhhhhh'),
(11, 'nimrod arak', 'merylmsoo32@gmail.com', 'male', '+254794758281', ' u\'['),
(12, 'nimrod arak', 'merylmsoo32@gmail.com', 'male', '+254794758281', ' u\'['),
(13, 'admin', 'admin@gmail.com', 'female', '0794758281', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
