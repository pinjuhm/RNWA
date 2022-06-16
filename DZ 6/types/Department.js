const { GraphQLObjectType, GraphQLInt, GraphQLString, GraphQLList, GraphQLScalarType } = require('graphql');
const { dbQuery } = require('../database');

const Department = new GraphQLObjectType({
  name: 'Department',
  fields: () => (
    {
      id: { type: GraphQLInt },
      name: { type: GraphQLString }
    }
  ) 
});

module.exports = Department;