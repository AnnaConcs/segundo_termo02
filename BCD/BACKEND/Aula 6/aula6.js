const entrada = require(`readline-sync`);

const km = entrada.questionFloat("quantos km/h voce esta?")

if ( km > 80) {
    console.log("multado")
}else if (km <= 80) {
    console.log("Continue sua Viagem")
}