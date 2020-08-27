function range(start,end){
    if( start === end){
        return start;
    }

    return [start].concat(range(start+1,end))
}

function sumRec(arr){
    if(arr.length === 1){
        return arr[0]
    }
    return arr[0] + sumRec(arr.slice(1, arr.length))
}

function exponent1(base,exp){
    if(exp === 0){
        return 1;
    }

    return base * exponent1(base, exp - 1);
}

function exponent2(base,exp){
    if(exp === 0){
        return 1;
    }else if(exp === 1){
        return base;
    }else{
        if(exp % 2 === 0){
            return exponent2(base, (exp/2))**2
        }else{
            return base * (exponent2(base,(exp-1)/2) ** 2);
        }
    }
}

function fibonacci(n){
    if(n===1){
        return[0];
    }
    else if(n === 2){
        return [1,0];
    }
    else{
        return [fibonacci(n-1)[0] + fibonacci(n-1)[1]].concat(fibonacci(n-1));
    }
}

function deepDup(arr){
    let firstEle = undefined
    if (arr[0] instanceof Array){
        firstEle = deepDup(arr[0]);
    } else {
        firstEle = [arr[0]];
    }
    if(arr.length === 1){
        return [firstEle];
    }
    return firstEle.concat(deepDup(arr.slice(1,arr.length)));
}

