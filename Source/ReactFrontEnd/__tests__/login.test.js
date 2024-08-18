import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { BrowserRouter as Router } from 'react-router-dom';
import Login from '../src/views/login';

jest.mock('react-router-dom', () => ({
  ...jest.requireActual('react-router-dom'),
  useNavigate: () =>jest.fn(),
}));


describe('Login Component Tests', () => {
  test('Render Text', () => {
    render(
      <Router>
        <Login onLoginClick={jest.fn()} />
      </Router>
    );

    // Verify All text returned by this element exists
    expect(screen.getByText('MyMongoManager')).toBeInTheDocument();
    expect(screen.getByLabelText('Username:')).toBeInTheDocument();
    expect(screen.getByLabelText('Password:')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: 'Login' })).toBeInTheDocument();
  });

  test('Render Button', () => {
    render(
      <Router>
        <Login onLoginClick={jest.fn()} />
      </Router>
    );

    // Verify button is rendered
    expect(screen.getByRole('button', { name: 'Login' })).toBeInTheDocument();
  });

  test('Login Button Click', async () => {
    const onLoginClick = jest.fn().mockResolvedValue({ isValid: true });
    const navigate = jest.fn();
    // Mock useNavigate to return navigate
    const useNavigateMock = jest.spyOn(require('react-router-dom'), 'useNavigate');
    useNavigateMock.mockReturnValue(navigate);

    render(
      <Router>
        <Login onLoginClick={onLoginClick} />
      </Router>
    );

    fireEvent.change(screen.getByLabelText('Username:'), { target: { value: 'testUser' } });
    fireEvent.change(screen.getByLabelText('Password:'), { target: { value: 'testPassword' } });
    fireEvent.submit(screen.getByRole('button', { name: 'Login' }));

    await waitFor(() => {
      expect(onLoginClick).toHaveBeenCalledTimes(1);
      expect(navigate).toHaveBeenCalledWith('/home',{ state: { username: 'testUser', password: 'testPassword' } });
    });
  });
});