const entrada = require("readline-sync")

console.log("=== SISTEMA DE CONTROLE DE QUALIDADE ===")

const pecas = [];

const quantidade = entrada.questionInt("Quantas pecas deseja avaliar?: ");

for (let i= 0; i < quantidade; i++) {
    let peca = entrada.questionFloat(`Digite o peso da peca ${i+1}: `);
    pecas.push(peca)
}
console.log("\n--- RELATORIO DA AUDITORIA ---");
console.log(`Pesos registrados: ${pecas.join("Kg|")}Kg`)
const media = (quantidade + quantidade) / 3;
console.log(`A media do lote foi de: ${media.toFixed(1)}`)