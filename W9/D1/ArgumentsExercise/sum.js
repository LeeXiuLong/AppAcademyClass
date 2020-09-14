// function sum(){
//     let sum = 0; 
//     for (let i = 0; i < arguments.length; i ++) {
//         sum += arguments[i];
//     }
//     return sum;
// }

function sum(...args) {
    // let args = [...arguments];
    return args.reduce(function(total, amount) {
        return total + amount;
    })
}

console.log(sum(1,2,3,4,5,6,6))
console.log(sum(1, 2, 3, 4, 3, 4, 6))

// function sortArgs(...args) {


