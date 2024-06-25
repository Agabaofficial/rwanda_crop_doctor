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
        analyzeImageWithGoogleVision(formData.get('image'));
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

function analyzeImageWithGoogleVision(image) {
    const reader = new FileReader();
    reader.onload = function(event) {
        const base64Image = event.target.result.split(',')[1];
        fetch(`https://vision.googleapis.com/v1/images:annotate?key=${GOOGLE_VISION_API_KEY}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                requests: [{
                    image: { content: base64Image },
                    features: [{ type: 'LABEL_DETECTION', maxResults: 10 }]
                }]
            })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Image analysis result:', data);
            // Display the analysis result to the user
        })
        .catch(error => {
            console.error('Error:', error);
        });
    };
    reader.readAsDataURL(image);
}

