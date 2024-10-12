/**
 * Converts the input to a boolean
 * @param {*} input - varibale to be converted to a boolean
 * @returns boolean
 */
const toBoolean = (input) => {
  return [true, 1, '1', 'true', 'True', 'TRUE'].includes(input);
};

module.exports = toBoolean;