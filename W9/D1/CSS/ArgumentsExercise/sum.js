function sum(){
    let sum = 0; 
    arguments.forEach(function(el) {
        sum += el; 
    })

    return sum; 
}

console.log(sum(1,2,3,4,5,6,6)
sum(1, 2, 3, 4, 3, 4, 6)