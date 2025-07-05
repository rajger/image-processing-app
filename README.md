# 🖼️ Image Processing Web App

A containerized web app that removes the background and converts images to grayscale. Built using **React**, **FastAPI**, and containerized with **Docker** or **Podman**.

---

## 🚀 Features

- 🖼️ Upload an image via a web interface
- 🧹 Removes the background using `rembg`
- ⚫ Converts image to grayscale using `Pillow`
- 📦 Fully containerized with Docker or Podman
- 🧰 Includes Makefile for easy dev workflow

---

## 📐 Architecture

```plaintext
                +------------------+
                |  React Frontend  |
                |------------------|
                | - Uploads image  |
                | - Displays result|
                +--------+---------+
                         |
                         v (HTTP POST)
                +--------+---------+
                |   FastAPI Backend |
                |------------------|
                | - Removes BG      |
                | - Grayscale       |
                +--------+---------+
                         |
                         v
                Returns processed image
```

--- 

## 🧱 Project Structure

```plaintext

                image-processing-app/
                ├── backend/
                │   ├── main.py
                │   ├── requirements.txt
                │   └── Dockerfile
                │
                ├── frontend/
                │   ├── src/App.js
                │   ├── Dockerfile
                │   ├── nginx.conf
                │   └── package.json
                │
                ├── docker-compose.yml
                ├── podman-compose.yml
                ├── .env
                ├── Makefile
                └── README.md
```
---

## 📦 Prerequisites



- Docker or Podman installed

- `make` installed

- Free ports `3000` (frontend) and `8000` (backend)


## 🔧 Configuration

Create a `.env` file:

```plaintext
FRONTEND_PORT=3000
BACKEND_PORT=8000
```

---

## 🛠️ Usage

### ▶️ Run the App
```plaintext
make deploy
```
Open your browser to http://localhost:3000

### 🧪 Test the API

Put an image named sample.jpg in the project root, then run:
```plaintext
make test
```
Result will be saved to `out.png`.

### 🧹 Clean Up Everything

```plaintext
make down
make clean
```

---

## 🧰 Makefile Commands

| Command               | Description                                 |
| --------------------- | ------------------------------------------- |
| `make build`          | Build full stack (frontend + backend)       |
| `make rebuild`        | Rebuild without cache                       |
| `make up`             | Start all services using Compose            |
| `make down`           | Stop all services                           |
| `make logs`           | Tail logs from running containers           |
| `make deploy`         | Full build and launch                       |
| `make clean`          | Remove all containers, images, volumes (⚠️) |
| `make test`           | Test backend API with `sample.jpg`          |
| `make backend-build`  | Build backend container only                |
| `make backend-up`     | Run backend standalone                      |
| `make backend-down`   | Stop/remove backend container               |
| `make frontend-build` | Build frontend container only               |
| `make frontend-up`    | Run frontend standalone                     |
| `make frontend-down`  | Stop/remove frontend container              |
| `make backend-shell`  | Shell into backend container                |
| `make frontend-shell` | Shell into frontend container               |


## 🛠 Tech Stack

| Component     | Technology            |
| ------------- | --------------------- |
| Frontend      | React + Axios + Nginx |
| Backend       | FastAPI + rembg       |
| Image Tools   | Pillow, onnxruntime   |
| Orchestration | Docker or Podman      |

## 📜 License
MIT – use it freely, modify as needed.

## 🤝 Contributions
Pull requests welcome! If you improve performance, UX, or add features (like download button or multiple filters), feel free to submit a PR.

## 📬 Contact
Created by *Rajdeep Mukherjee <csstudysre@gmail.com>* – happy to collaborate or answer questions.
