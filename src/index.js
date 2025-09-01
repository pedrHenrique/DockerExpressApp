const express = require('express')
const bodyParser = require('body-parser')

const BAD_REQUEST = 400;
const app = express();
const port = 3000; //Hardcoded for the win
const users = [];

app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('Hello World! :D')
})

// Registrar Usuário
app.post('/users', (req, res) => {
    const newUserId = req.body.userId;
    if (!newUserId) { //Usuário ID não for fornecido
        return res.status(BAD_REQUEST).send("Informar ID do usuário.")
    }

    if (users.includes(newUserId)) {
        return res.status(400).send("userId já existe.")
    }
    users.push(newUserId)
    return res.status(201).send("Usuário cadastrado.")
})

// Retornar Usuários Registrados
app.get('/users', (req, res) => {
    return res.json({ users })
})

app.listen(port, () => {
    console.log(`Server Listening on port ${port}`)
}) 