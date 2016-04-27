/* globals Person, chai */

var assert, expect, should;

assert = chai.assert;
expect = chai.expect;
should = chai.should();

describe('Person', function() {
  var person;

  before(function() {
    person = new Person('John', 'Doe', 40);
  });

  it('should be able to be instantiated', function() {
    assert.typeOf(Person, 'function');
  });

  it('should be an object', function() {
    person.should.be.an('object');
  });

  it('should have properties and methods', function() {
    person.should.have.property('firstName');
    person.should.have.property('lastName');
    person.should.have.property('age');
    person.should.have.property('fullName');
  });

  it('should have property types', function() {
    assert.typeOf(person.firstName, 'string', 'firstName must be string');
    assert.typeOf(person.lastName, 'string', 'lastName must be string');
    assert.typeOf(person.age, 'number', 'age must be numeric');
  });

  it('should have property values', function() {
    person.firstName.should.be.equal('John');
    person.lastName.should.be.equal('Doe');
    expect(person.fullName()).to.be.equal('John Doe');
  });
});
