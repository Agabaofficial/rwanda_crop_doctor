# Rwanda Crop Doctor

## Overview

Rwanda Crop Doctor is a comprehensive web application designed to assist farmers in diagnosing and managing crop diseases. The application leverages machine learning and cloud-based vision APIs to analyze crop images and provide actionable insights.

The frontend is built with React and Bootstrap, while the backend utilizes Flask and several other Python libraries.

## Project Structure

```
rwanda-crop-doctor/
├── backend/
│   ├── app/
│   ├── libs/
│   ├── venv/
│   └── requirements.txt
├── frontend/
│   ├── public/
│   ├── src/
│   └── libs/
├── .gitignore
├── setup_project_dependencies.sh
└── README.md
```

- **backend/**: Contains the Flask application and its dependencies.
  - **app/**: The main application code for the backend.
  - **libs/**: Locally installed Python packages.
  - **venv/**: Python virtual environment.
  - **requirements.txt**: List of backend dependencies.
- **frontend/**: Contains the React application and its dependencies.
  - **public/**: Public assets for the frontend.
  - **src/**: Source code for the React application.
  - **libs/**: Locally downloaded frontend libraries.

- **setup_project_dependencies.sh**: Script to set up project dependencies.
- **README.md**: Project documentation.

## Setup Instructions

### Backend

1. Create and activate a virtual environment:
   ```bash
   python3 -m venv backend/venv
   source backend/venv/bin/activate
   ```

2. Install backend dependencies:
   ```bash
   pip install -r backend/requirements.txt
   ```

3. Run the backend server:
   ```bash
   export FLASK_APP=backend/app
   flask run
   ```

### Frontend

1. Install frontend dependencies:
   ```bash
   cd frontend
   npm install
   ```

2. Run the frontend development server:
   ```bash
   npm start
   ```

## Dependencies

### Backend
- Flask
- Flask-RESTful
- Flask-CORS
- Requests
- SQLAlchemy
- Blinker
- Google Cloud Vision
- Google Cloud Translate

### Frontend
- React
- React-DOM
- Bootstrap
- React-Bootstrap

## Contributing

We welcome contributions from the community! To contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes.
4. Push your branch and create a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact

For any questions or suggestions, please contact us at agabaolivier85@gmail.com

