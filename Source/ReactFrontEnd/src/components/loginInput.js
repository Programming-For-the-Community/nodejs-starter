import React from 'react';
import PropTypes from 'prop-types';

const LoginInput = (props) => {
  return (
    <div className='login-form-group'>
      <label htmlFor={props.label}>{props.label}:</label>
      <input
        type={props.type}
        value={props.field}
        onChange={(e) => props.setField(e.target.value)}
        required
      />
    </div>
  );
};

LoginInput.propTypes = {
  label: PropTypes.string.isRequired,
  field: PropTypes.string.isRequired,
  setField: PropTypes.func.isRequired,
  type: PropTypes.string.isRequired
};

export default LoginInput;