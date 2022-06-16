const { GraphQLList } = require('graphql');
const { dbQuery } = require('../../database');
const { EmployeeType } = require('../../types');

const fieldsEmployees = {
  type: new GraphQLList(EmployeeType),
  async resolve(_, {}){
    let res = await dbQuery(`SELECT * FROM employees`);

    return res;
  }
};

module.exports = fieldsEmployees;
