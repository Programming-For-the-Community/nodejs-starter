import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

// Internal Imports
import Login from './views/login';
import Home from './views/home';
import './styles/styles.css';

const App = () => (
  <Router>
    <div>
      <Routes>
        <Route exact path="/" element={<Login/>} />
        <Route path="/home" element={<Home/>} />
        <Route path="/login" element={<Login/>} />
      </Routes>
    </div>
  </Router>
);

ReactDOM.createRoot(document.getElementById('root')).render(<App />);