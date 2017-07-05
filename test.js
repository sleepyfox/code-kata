var Mocha = require('mocha'),
    describe = Mocha.describe,
    it = Mocha.it,
    expect = require('chai').expect;

// Some tests
describe('A shopping basket', function(){
  it('should know the answer?', function() {
    expect(6 * 9).to.equal(42);
  });
});
