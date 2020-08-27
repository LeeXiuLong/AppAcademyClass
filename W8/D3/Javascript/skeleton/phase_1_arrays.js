Array.prototype.uniq = function() {
    let newArray = []; 
    for (let i = 0; i < this.length; i++ ) {
        if(newArray.includes(this[i])) {
            continue; 
        }
        else {
            newArray.push(this[i]);
        }
    }
    return newArray;
}

Array.prototype.twoSum = function(){
    let newArr = [];
    for(let i = 0; i < this.length - 1; i++){
        for (let j= i+1; j< this.length -1; j++){
            if(this[i] + this[j] === 0){
                newArr.push(this[i]);
                newArr.push(this[j]);
            }
        }
    }
    return newArr;
}

Array.prototype.transpose = function() {
    let newArr = [];
    for(let i = 0; i < this[0].length; i++ ){
        newArr.push([])
    }
    for(let i=0; i < this.length; i++){
        for(let j=0; j < this[i].length; j++){
            newArr[j][i] = this[i][j];
        }
    }
    return newArr;
}