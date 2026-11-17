const fs = require('fs');

console.log("=== SISTEMA DE PERCISTENCIA: REGISTRO DE MAQUINAS");

const maquinaIndustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Fresadora Ferramenteira", setor: "Usinagem", operacional: false},
    {id: 103, nome: "Prensa Hidraúlica 50T", setor: "Estampagem", operacional: true},
    {id: 104, nome: "Compressor", setor: "Utilidades", operacional: true}
]

const dadosParaGravar = JSON.stringify(maquinaIndustriais, null,2);
const nomeDoArquivo = "maquinas.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);

console.log(`\nGravacao concluida com sucesso.`);
console.log(`verifique o arquivo '${nomeDoArquivo} gerado`);
 
