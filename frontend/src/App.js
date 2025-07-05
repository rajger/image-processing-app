import logo from './logo.svg';
import './App.css';
import React, { useState } from 'react';
import axios from 'axios';

function App() {
  const [image, setImage] = useState(null);
  const [processed, setProcessed] = useState(null);

  const handleUpload = async (e) => {
    const file = e.target.files[0];
    setImage(URL.createObjectURL(file));

    const formData = new FormData();
    formData.append("file", file);

    const res = await axios.post("http://localhost:8000/process-image/", formData, {
      responseType: 'blob',
    });

    const imageURL = URL.createObjectURL(res.data);
    setProcessed(imageURL);
  };

  return (
    <div style={{ textAlign: "center" }}>
      <h1>Image Processor</h1>
      <input type="file" accept="image/*" onChange={handleUpload} />
      <div style={{ marginTop: 20 }}>
        {image && <div><h3>Original</h3><img src={image} width="300" alt="original" /></div>}
        {processed && <div><h3>Processed</h3><img src={processed} width="300" alt="processed" /></div>}
      </div>
    </div>
  );
}

export default App;
