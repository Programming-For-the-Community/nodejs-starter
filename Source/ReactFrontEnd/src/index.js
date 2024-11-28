import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

// Internal Imports
import './styles/styles.css';
import Home from './views/home';
import Login from './views/login';
import authenticateUser from '../lib/functions/authenticateUser';

const App = () => (
  <Router>
    <div>
      <Routes>
        <Route exact path={'/'} element={<Login onLoginClick={authenticateUser}/>} />
        <Route path={'/home'} element={<Home/>} />
        <Route path={'/login'} element={<Login/>} />
      </Routes>
    </div>
  </Router>
);

ReactDOM.createRoot(document.getElementById('root')).render(<App />);