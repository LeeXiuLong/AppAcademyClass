Array.prototype.myEach = function(callback){
    for(let i = 0; i < this.length; i++){
        callback(this[i]);
    }
}

Array.prototype.myMap = function(callback){
    let newArr = [];
    this.myEach(function(el){
        newArr.push(callback(el));
    })
    return newArr;
}

Array.prototype.myReduce = function(callback, initialValue = undefined){
    let eachArr = this
    if(initialValue === undefined){
        initialValue = this[0];
        eachArr = this.slice(1, this.length)
    }
    eachArr.myEach(function(el){
        initialValue = callback(initialValue, el);
    })

    return initialValue;
}

