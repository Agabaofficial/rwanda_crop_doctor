#!/bin/bash

# Create project directory structure
mkdir -p frontend/css
mkdir -p frontend/js
mkdir -p frontend/php
mkdir -p frontend/img/uploads

# Remove any existing files to ensure a fresh setup
rm -f index.html
rm -rf frontend/css/*
rm -rf frontend/js/*
rm -rf frontend/php/*
rm -rf frontend/img/uploads/*

# Create index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rwanda Crop Doctor</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="frontend/css/styles.css">
</head>
<body class="bg-gray-100 text-gray-800">
    <nav class="bg-green-500 p-4 flex justify-between">
        <ul class="flex space-x-4">
            <li><a href="#home" class="text-white">Home</a></li>
            <li><a href="#about" class="text-white">About</a></li>
            <li><a href="#contact" class="text-white">Contact</a></li>
        </ul>
        <div>
            <select id="language-select" class="p-2">
                <option value="en">English</option>
                <option value="rw">Kinyarwanda</option>
                <option value="fr">French</option>
                <option value="sw">Swahili</option>
            </select>
        </div>
    </nav>

    <section id="home" class="p-8">
        <div class="text-center">
            <h1 class="text-4xl font-bold mb-4">Welcome to Rwanda Crop Doctor</h1>
            <p class="text-lg mb-6">Your go-to solution for crop diagnostics. Upload an image of your crop and let us help you identify any issues.</p>
            <form id="upload-form" class="space-y-4" enctype="multipart/form-data">
                <div>
                    <label for="image" class="block text-lg">Upload Image:</label>
                    <input type="file" id="image" name="image" class="w-full p-2 border border-gray-300 rounded" required>
                </div>
                <button type="submit" class="bg-green-500 text-white p-2 rounded">Submit</button>
            </form>
        </div>
        <div class="mt-8">
            <img src="https://via.placeholder.com/800x400" alt="Placeholder Image" class="mx-auto">
        </div>
    </section>

    <section id="about" class="p-8 bg-white">
        <h2 class="text-3xl font-semibold mb-4">About Us</h2>
        <p class="text-lg">Rwanda Crop Doctor is an initiative to help farmers diagnose crop diseases and get appropriate solutions.</p>
    </section>

    <section id="contact" class="p-8">
        <h2 class="text-3xl font-semibold mb-4">Contact Us</h2>
        <form id="contact-form" class="space-y-4">
            <div>
                <label for="name" class="block text-lg">Name:</label>
                <input type="text" id="name" name="name" class="w-full p-2 border border-gray-300 rounded" required>
            </div>
            <div>
                <label for="email" class="block text-lg">Email:</label>
                <input type="email" id="email" name="email" class="w-full p-2 border border-gray-300 rounded" required>
            </div>
            <div>
                <label for="message" class="block text-lg">Message:</label>
                <textarea id="message" name="message" class="w-full p-2 border border-gray-300 rounded" required></textarea>
            </div>
            <button type="submit" class="bg-green-500 text-white p-2 rounded">Submit</button>
        </form>
    </section>

    <script src="frontend/js/config.js"></script>
    <script src="frontend/js/scripts.js"></script>
</body>
</html>
EOL

# Create config.js
cat <<EOL > frontend/js/config.js
const GOOGLE_VISION_API_KEY = 'AIzaSyA2Bu3PuiFnIZkicSVT_ogQTJvGtT7cIkE';
EOL

# Create scripts.js
cat <<EOL > frontend/js/scripts.js
document.getElementById('contact-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(event.target);

    fetch('frontend/php/contact.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

document.getElementById('upload-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(event.target);

    fetch('frontend/php/upload.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
        // Code to analyze the uploaded image using GOOGLE_VISION_API_KEY
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

document.getElementById('language-select').addEventListener('change', function() {
    const selectedLanguage = this.value;
    // Code to switch languages using translations
});
EOL

# Create contact.php
cat <<EOL > frontend/php/contact.php
<?php
if (\$_SERVER["REQUEST_METHOD"] == "POST") {
    \$name = htmlspecialchars(\$_POST['name']);
    \$email = htmlspecialchars(\$_POST['email']);
    \$message = htmlspecialchars(\$_POST['message']);

    // Connection to the database
    \$servername = "localhost";
    \$username = "root";
    \$password = "";
    \$dbname = "crop_doctor_db";

    // Create connection
    \$conn = new mysqli(\$servername, \$username, \$password, \$dbname);

    // Check connection
    if (\$conn->connect_error) {
        die("Connection failed: " . \$conn->connect_error);
    }

    \$sql = "INSERT INTO contacts (name, email, message) VALUES ('\$name', '\$email', '\$message')";

    if (\$conn->query(\$sql) === TRUE) {
        echo "Thank you, \$name. Your message has been received.";
    } else {
        echo "Error: " . \$sql . "<br>" . \$conn->error;
    }

    \$conn->close();
}
?>
EOL

# Create upload.php
cat <<EOL > frontend/php/upload.php
<?php
if (\$_SERVER["REQUEST_METHOD"] == "POST") {
    \$target_dir = "../img/uploads/";
    \$target_file = \$target_dir . basename(\$_FILES["image"]["name"]);
    \$imageFileType = strtolower(pathinfo(\$target_file,PATHINFO_EXTENSION));

    // Check if image file is a actual image or fake image
    \$check = getimagesize(\$_FILES["image"]["tmp_name"]);
    if(\$check !== false) {
        if (move_uploaded_file(\$_FILES["image"]["tmp_name"], \$target_file)) {
            echo "The file ". htmlspecialchars( basename( \$_FILES["image"]["name"])). " has been uploaded.";
            // Add code here to analyze the image using Google Vision API
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    } else {
        echo "File is not an image.";
    }
}
?>
EOL

echo "Frontend setup complete."

