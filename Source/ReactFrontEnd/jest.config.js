module.exports = {
  testMatch: ['<rootDir>/__tests__/**/*.test.js'],
  setupFilesAfterEnv: ['<rootDir>/__tests__/setupTests.js'],
  testEnvironment: 'jsdom',
  watchPathIgnorePatterns: ['<rootDir>/node_modules'],
  coverageDirectory: '<rootDir>/coverage',
  collectCoverage: true,
  coverageReporters: ['json', 'lcov', 'text'],
  collectCoverageFrom: [
    '<rootDir>/**/*.{js,jsx,ts,tsx}', 
    '!<rootDir>/__tests__/**/*', 
    '!<rootDir>/node_modules', 
    '!<rootDir>/coverage/**/*', 
    '!<rootDir>/.vscode',
    '!<rootDir>/*.config.*',
    '!<rootDir>/dist/**/*',
    '!<rootDir>/*.js'
  ],
  coverageThreshold: {
    global: {
      branches: 100,
      functions: 90,
      lines: 80,
      statements: 80
    }
  },
  transform: {
    '^.+\\.jsx?$': 'babel-jest',
  },
  moduleNameMapper: {
    '\\.css$': 'identity-obj-proxy',
  },
};