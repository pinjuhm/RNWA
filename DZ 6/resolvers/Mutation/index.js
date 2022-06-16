const { GraphQLObjectType } = require('graphql');
const insertDepartment = require('./insertDepartment');

const Mutation = new GraphQLObjectType({
  name: 'mutation',
  fields: {
    insertDepartment: insertDepartment
  }
});

module.exports = Mutation;
