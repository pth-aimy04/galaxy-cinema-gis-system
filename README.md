# Galaxy Cinema GIS System

This is a web-based application that helps users find and explore Galaxy Cinema locations in Ho Chi Minh City using an interactive map.

---

## Overview

The main purpose of this project is to make it easier for users to search for cinema locations and view related information.  
The system uses GIS (Geographic Information System) to display cinema branches on a map and support location-based searching.

---

## Features

### User
- View cinema locations on an interactive map  
- Search cinemas by district or location  
- View detailed information about each cinema  
- Get directions from current location to selected cinema  

### Admin
- Manage cinema branch information  
- Manage movie information  

---

## Tech Stack

- Backend: Django  
- Frontend: HTML, CSS, JavaScript  
- Map Library: Leaflet  
- Database: MySQL  
- Tools: VS Code, Anaconda  

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/pth-aimy04/galaxy-cinema-gis-system.git
cd galaxy-cinema-gis-system
```

---

### 2. Create and activate environment

Using Anaconda:

```bash
conda activate myenv
```

Or using venv:

```bash
python -m venv venv
venv\Scripts\activate
```

---

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

### 4. Run the project

```bash
python manage.py runserver
```

---

## Project Structure

```bash
DTMap2/
 maps/
 static/
 templates/
 manage.py
 requirements.txt
 README.md
```

---

## Database

- Database file: `galaxy.sql`  
- Import this file into MySQL before running the project  

---

## Author

Phan Thi Ai My & Nguyen Ngoc Thuy Duong & Nguyen Tang Tai 
Ho Chi Minh City University of Natural Resources and Environment  

---

## Notes

- Make sure the database is set up before running the project  
- This project was developed as a university assignment  
- It is used for learning and internship portfolio purposes  
