const factorial = num => (num <= 1 ? 1 : num * factorial(num - 1));
const permutation = (n, r) => (n < r ? 0 : factorial(n) / factorial(n - r));
const combination = (n, r) =>
  n < r ? 0 : factorial(n) / (factorial(r) * factorial(n - r));
const multiPermutation = (n, r) => (n === 0 || r === 0 ? 0 : Math.pow(n, r));
const multiCombination = (n, r) =>
  n === 0 || r === 0 ? 0 : combination(n + r - 1, r);

module.exports = {
  permutation,
  combination,
  multiPermutation,
  multiCombination,
};