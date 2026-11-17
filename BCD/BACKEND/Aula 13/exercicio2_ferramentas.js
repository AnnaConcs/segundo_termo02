const fs = require('fs');
const entrada = require('readline-sync');

const totalItens = entrada.questionInt("Quantas ferramentas deseja cadastrar? ");

const listaferramentas = [];

for (let i = 0; i < totalItens; i++) {
    console.log(`\nItem ${i + 1} de ${totalItens}:`);

    const nome = entrada.question("Nome da ferramenta: ");
    const quantidade = entrada.questionInt("Quantidade: ");
    const custoUnitario = entrada.questionFloat("Custo unitario (R$): ");

    listaferramentas.push({
    nome: nome,
    quantidade: quantidade,
    custoUnitario: custoUnitario
    });
}

fs.writeFileSync(`ferramentas.json`, JSON.stringify(listaferramentas, null, 2));
console.log("\n ==========================================");
console.log(`Sucesso: ${listaferramentas} itens gravados em 'ferramentas.json'`);
console.log("=============================================")
