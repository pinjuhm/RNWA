const { GraphQLObjectType } = require('graphql');

const fieldsEmployees = require('./employees');
const fieldsDepartments = require('./departments');

const Query = new GraphQLObjectType({
  name: 'Query',
  fields: {
    employees: fieldsEmployees,
    departments: fieldsDepartments
  }
});

module.exports = Query;