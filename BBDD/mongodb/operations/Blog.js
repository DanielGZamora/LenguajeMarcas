conn = new Mongo();
db = conn.getDB("Blog");

db.usuario.insertMany([
    {
        nombre_usuario: 'Juan',
        cuenta_twitter: '@juan',
        nombre: 'Juan',
        telefono: 123456789,
        direccion: [
            {
                calle: 'Calle 1',
                numero: 1,
                ciudad: 'Madrid',
                CP: 28001
            }
        ]
    },
    {
        nombre_usuario: 'Pepe',
        cuenta_twitter: '@pepe',
        nombre: 'Pepe',
        telefono: 123456789,
        direccion: [
            {
                calle: 'Calle 2',
                numero: 2,
                ciudad: 'Madrid',
                CP: 28002
            }
        ]
    },
    {
        nombre_usuario: 'Maria',
        cuenta_twitter: '@maria',
        nombre: 'Maria',
        telefono: 123456789,
        direccion: [
            {
                calle: 'Calle 3',
                numero: 3,
                ciudad: 'Madrid',
                CP: 28003
            }
        ]
    }
]);
db.noticia.insertOne({
    titulo: 'Noticia 1',
    cuerpo: 'c noticia 1',
    fecha: '2024-01-01',
    tags: ['tag1', 'tag2'],
    nombre_usuario: 'Juan'
});
db.comentarios.insertOne({
    texto: 'texto',
    fecha: '2024-01-01',
    nombre_usuario: 'Juan',
    titulo: 'Noticia 1'
});