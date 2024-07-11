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
      {/* <h2 className='login-form-group'>Login</h2> */}
      <form className='login-form-group' onSubmit={authenticateUser}>
        <LoginInput label='Username' field={username} setField={setUsername} type='text' />
        <LoginInput label='Password' field={password} setField={setPassword} type='password' />
        <div className='login-button-div'>
          <button className='login-button' type='submit'>Login</button>
        </div>
      </form>
    </div>
  );
};

Login.propTypes = {
  history: PropTypes.object.isRequired
};

export default Login;
