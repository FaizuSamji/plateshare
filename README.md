# PlateShare - Recipe Sharing Web Application
PlateShare is a PHP and MySQL web application that allows users to see and discover recipes. With PlateShare, users can view, search for recipes, and engage with the community by leaving comments on recipes.

# Prerequisites
Before setting up PlateShare, ensure that you have the following prerequisites installed:

- PHP (version 7.4 or higher)
- MySQL (version 5.7 or higher)
- Web server (e.g., Apache or Xamp)

# Installation and Setup
Clone the Repository
```
git clone https://github.com/saneeitas/PlateShare.git
```

# Configure XAMPP

- Launch XAMPP and start the Apache and MySQL services.
- Open a web browser and go to http://localhost/phpmyadmin/.
- Click on the "New" button in the left sidebar to create a new database. Enter a name for the database (e.g., plateshare) and click "Create".
- Once the database is created, click on it in the left sidebar, and then click on the "Import" tab. Choose the SQL file located in PlateShare/plateshare.sql and click "Go" to import the database schema.

# Configure Database Connection

- Open the PlateShare/connection.php file in a text editor.
- Update the constants with your MySQL database credentials

# Start the Application

Move the PlateShare directory to the htdocs folder of your XAMPP installation. The path may vary depending on your operating system, but it is typically located at  ```C:\xampp\htdocs on Windows or /Applications/XAMPP/htdocs on macOS.```
Open a web browser and go to http://localhost/PlateShare/ to access the PlateShare application.

# Usage
Once you have completed the installation and setup, you can start using PlateShare to share and discover recipes. Here are some key features:

- Viewing Recipes: Browse through the collection of recipes available on PlateShare. Each recipe displays its title, ingredients, preparation steps, and comments.
- Searching for Recipes: Use the search functionality to find recipes based on keywords or specific ingredients.
- Commenting on Recipes: To leave a comment on a recipe, you need to be logged in. Click on the "Login" button, enter your credentials or create a new account, and then you can comment on any recipe.

# Contributing
PlateShare is an open-source project, and contributions are welcome. If you would like to contribute to the development of PlateShare, follow these steps:

- Fork the repository on GitHub.
- Make your changes in a new branch.
- Test your changes to ensure they work as expected.
- Submit a pull request, detailing the changes you made and why they should be merged.

# License
PlateShare is licensed under the MIT License. Feel free to modify and distribute the application as per the terms of the license
