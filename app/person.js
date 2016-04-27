function Person(firstName, lastName, age) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
}

Person.prototype.fullName = function fullName() {
  return this.firstName + ' ' + this.lastName;
};
