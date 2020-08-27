Array.prototype.bubbleSort = function(){
    let sorted = false
    while(sorted === false){
        sorted = true;
        for(let i = 0; i < this.length; i++){
            if(this[i] > this[i+1]){
                sorted = false;
                first = this[i]
                second = this[i+1]
                this[i] = second
                this[i+1] = first
            }
        }
    }
}

String.prototype.substrings = function(){
    let newArr = []
    for(let i = 0; i < this.length; i++){
        for(let j = i+1; j < this.length + 1; j++){
            let substring = this.slice(i,j)
            if(newArr.includes(substring)){
                continue;
            }
            else{
                newArr.push(substring);
            }
        }
    }
    return newArr;
}