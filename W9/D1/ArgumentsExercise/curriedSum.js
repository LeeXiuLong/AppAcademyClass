function curriedSum(numArgs) {
    let numbers = [];
    _curriedSum = function(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            return numbers.reduce(function(total, amount) {
                return total + amount; 
            });
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

// const sum = curriedSum(5);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs){
    let args = [];
    let that = this;
    return function _curry(arg){
        args.push(arg);
        if(args.length === numArgs){
            return that.apply(this,args);
        }else{
            return _curry;
        }
    }
}

// Function.prototype.curry = function(numArgs) {
//     let args = []; 
//     let that = this; 
//     return function _curry(arg) {
//         args.push(arg);
//         if (args.length === numArgs) {
//             return that(...args); 
//         } else {
//             return _curry; 
//         }
//     }
// }

function sum(num1, num2, num3){
    return num1 + num2 + num3;
}

const sumCurry = sum.curry(3);
console.log(sumCurry(1)(2)(3));



