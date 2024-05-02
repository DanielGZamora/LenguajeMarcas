// conectarse a la base de datos
conn = new Mongo();
db = conn.getDB("bbddPRueba");

//insertar uno
db.products.insertOne({ name: 'Lavadora', price: 399, stock: 5, departamento: 'none' });

// inssertar varios
db.products.insertMany([
    { name: 'Lavadora', price: 399, stock: 5, departamento: 'none' },
    { name: 'Televisor', price: 599, stock: 10, departamento: 'none' },
    { name: 'Secadora', price: 299, stock: 2, departamento: 'none' },
])
/**
 * Ignorar el printjson
 */
// buscar por edad
printjson(db.contacts.find({ age: 30 }).toArray());
// mayor que 30
printjson(db.contacts.find({ "dob.age": { $gte: 30 } }).toArray());
// mayor que 30 y femenino y de nacionalidad alemana
printjson(db.contacts.find({ "dob.age": { $gte: 30 }, gender: "female", nat: "DE" }).toArray());

// mas de 5 años o menos de 20 años de edad
printjson(db.contacts.find({
    $or: [
        { "registered.age": { $gte: 5 } },
        { "dob.age": { $lte: 20 } }
    ]
}).toArray());