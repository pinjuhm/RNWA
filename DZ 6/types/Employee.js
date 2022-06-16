const { GraphQLObjectType, GraphQLInt, GraphQLString, GraphQLList, GraphQLScalarType } = require('graphql');
const { dbQuery } = require('../database');
const Department = require('./Department');

const Employee = new GraphQLObjectType({
  name: 'Employee',
  fields: () => (
    {
      emp_no: { type: GraphQLInt },
      first_name: { type: GraphQLString },
      last_name: { type: GraphQLString },
      gender: { type: GraphQLString },
	  contact: {type: GraphQLString},
      department: { 
        type: Department,
        resolve: async (employee) => {
          const {employee_department_id: department_id} = employee;
          const sql = `SELECT * FROM employee_department WHERE id = ${parseInt(department_id)}`;
          const res = await dbQuery(sql);

          return res[0];
        }
      }
    }
  ) 
});

module.exports = Employee;