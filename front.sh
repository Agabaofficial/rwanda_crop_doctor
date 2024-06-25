#!/bin/bash

# Create project directory structure
mkdir -p frontend/css
mkdir -p frontend/js
mkdir -p frontend/php

# Create index.html
cat <<EOL > frontend/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rwanda Crop Doctor</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <nav>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>

    <section id="home">
        <h1>Welcome to Rwanda Crop Doctor</h1>
        <p>Your go-to solution for crop diagnostics.</p>
    </section>

    <section id="about">
        <h2>About Us</h2>
        <p>Rwanda Crop Doctor is an initiative to help farmers diagnose crop diseases and get appropriate solutions.</p>
    </section>

    <section id="contact">
        <h2>Contact Us</h2>
        <form id="contact-form">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="message">Message:</label>
            <textarea id="message" name="message" required></textarea>

            <button type="submit">Submit</button>
        </form>
    </section>

    <script src="js/scripts.js"></script>
</body>
</html>
EOL

# Create styles.css
cat <<EOL > frontend/css/styles.css
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

nav {
    background-color: #4CAF50;
    overflow: hidden;
}

nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

nav ul li {
    float: left;
}

nav ul li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

nav ul li a:hover {
    background-color: #45a049;
}

section {
    padding: 20px;
}

#home {
    background-color: #f2f2f2;
}

#about {
    background-color: #ffffff;
}

#contact {
    background-color: #f2f2f2;
}

form {
    max-width: 600px;
    margin: 0 auto;
}

form label {
    display: block;
    margin-top: 10px;
}

form input, form textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
}

form button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    margin-top: 10px;
}
EOL

# Create scripts.js
cat <<EOL > frontend/js/scripts.js
document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();
    alert('Form submitted!');
});
EOL

# Create contact.php
cat <<EOL > frontend/php/contact.php
<?php
if (\$_SERVER["REQUEST_METHOD"] == "POST") {
    \$name = htmlspecialchars(\$_POST['name']);
    \$email = htmlspecialchars(\$_POST['email']);
    \$message = htmlspecialchars(\$_POST['message']);

    // You can add email functionality here or save data to a database

    echo "Thank you, \$name. Your message has been received.";
}
?>
EOL

echo "Frontend setup complete."

