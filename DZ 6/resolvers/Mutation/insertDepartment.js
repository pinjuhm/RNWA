const { GraphQLString } = require('graphql');
const { dbQuery } = require('../../database');
const { DepartmentType } = require('../../types');

const insertDepartment = {
  type: DepartmentType,
  args: {
    name: { type: GraphQLString },
    description: { type: GraphQLString }
  },
  async resolve(_, { name, description }){
    let res = await dbQuery(`Insert into department (id, department) values ('${dep_id}', '${dep_name}')`);
    return { id: res.insertId, name, description }
  }
};

module.exports = insertDepartment;