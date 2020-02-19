const db = require("../data/db-config"); // connect to the database

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

// SELECT * FROM steps
// JOIN schemes ON steps.scheme_id = schemes.id
// where schemes.id = 2;

function findSteps(id) {
  return db("steps")
    .orderBy("step_number")
    .join("schemes", "steps.scheme_id", "schemes.id")
    .where("schemes.id", id);
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then(ids => {
      const id = ids[0];
      // return the object
      return findById(id);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(count => {
      return findById(id); // return the object
    });
}

function remove(id) {
  const objToDelete = findById(id).then(item => item);

  return db("schemes")
    .where({ id })
    .delete()
    .then(count => {
      return objToDelete;
    });
}
