const entrada = require(`readline-sync`);

console.log("---SISTEMA DE ANALISE DE CREDITO---");

// coleta de dados
const nome = entrada.question("Nome do cliente: ");
const idade = entrada.questionInt("idade: ");
const renda = entrada.questionFloat("Renda Mensal: ");
const temImovel = entrada.keyInYNStrict("Possui imovel proprio?"); //Essa função lê Y para true e N para false

// A Lógica Combinada
// (idade >= 18) é orbigatório
// (renda >= 2500 || temImovel === true) um dos dois tem que ser verdade
if (idade >= 18 && (renda >= 2500 || temImovel === true)) {
    console.log(`\nPARABENS, ${nome}| Seu credito foi APROVADO`);
} else {
    console.log(`\nSinto muito, ${nome}. Seu credito foi NEGADO.`);
}
