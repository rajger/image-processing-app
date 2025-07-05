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
---

