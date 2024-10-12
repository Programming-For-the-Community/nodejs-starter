import React from 'react';
import { useLocation } from 'react-router-dom';

const Home = () => {
  const location = useLocation();

  return (
    <div>
      <h1>Hello, React!</h1>
      <p>{location.state.username}</p>
      <p>{location.state.password}</p>
    </div>
  );
};

export default Home;
