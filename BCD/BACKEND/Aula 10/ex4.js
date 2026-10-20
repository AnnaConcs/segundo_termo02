const entrada = require("readline-sync");

console.log("===REGISTRO DE TEMPERATURAS===");

const temperaturas = [];

const quantidade = entrada.questionInt("Quantas Temperaturas deseja registrar? ");

for (let i= 0; i < quantidade; i++) {
    let temperatura = entrada.questionFloat(`temperatura ${i +1}:`);
    temperaturas.push(temperatura);
}
console.log("\n---RELATÓRIO---");
console.log(`Temperaturas registradas: ${temperaturas.join ("°C | ")} °C`);
console.log(`Quantidade de registros de temperaturas: ${temperaturas.length}`);
console.log(`Primeira temperatura: ${temperaturas[0]}`);
console.log(`Última temperatura: ${temperaturas[temperaturas.length- 1]}`);