import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PropTypes from 'prop-types';

// Internal Imports
import LoginInput from '../components/loginInput';
import '../styles/styles.css';

const Login = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const navigate = useNavigate();
  
  const authenticateUser = (e) => {
    e.preventDefault();
    navigate('/home', { state: {
      username: username,
      password: password
    }} );
  };

  return(
    <div className='login-container'>
      <h1 className='login-title'>MyMongoManager</h1>
      <h2>Login</h2>
      <form onSubmit={authenticateUser}>
        <LoginInput label='Username' field={username} setField={setUsername} type='text' />
        <LoginInput label='Password' field={password} setField={setPassword} type='password' />
        <button type='submit'>Login</button>
      </form>
    </div>
  );
};

Login.propTypes = {
  history: PropTypes.object.isRequired
};

export default Login;
