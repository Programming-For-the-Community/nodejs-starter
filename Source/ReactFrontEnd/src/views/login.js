import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import PropTypes from 'prop-types';

// Internal Imports
import LoginInput from '../components/loginInput';
import '../styles/styles.css';

const Login = (props) => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const navigate = useNavigate();
  
  const onLoginClick = async (e) => {
    e.preventDefault();
    console.log('Getting user...');
    const user = await props.onLoginClick();
    console.log(user.isValid);
    if(user.isValid === true){
      navigate('/home', {
        state: {
          username: username, 
          password: password
        }
      });
    }

  };

  return(
    <div className='login-container'>
      <h1 className='login-title'>MyMongoManager</h1>
      <form className='login-form-group' onSubmit={onLoginClick}>
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
  onLoginClick: PropTypes.func.isRequired
};

export default Login;
