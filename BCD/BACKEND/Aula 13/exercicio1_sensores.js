const fs = require('fs')

console.log("=== SISTEMA DE PERCISTENCIA: Registro de Sensores Industriais")

const SensoresIndustriais = [
    {id: 1001, tipo: "Temperatura", LeituraAtual: "15.8", status: "Operando"},
    {id: 1002, tipo: "Pressao", LeituraAtual: "10.5", status: "Alerta"},
    {id: 1003, tipo: "Temperatura", LeituraAtual: "20.1", status: "Operando"}
]

const dadosJSON = JSON.stringify(SensoresIndustriais, null, 2)

const nomeDoArquivo = "sensores.json"
fs.writeFileSync('sensores.json', dadosJSON);

console.log(`\nGravacao concluida com sucesso.`)
console.log(`verifique o arquivo '${nomeDoArquivo} gerado`)





