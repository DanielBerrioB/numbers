import "dart:math" as math;

class Operation{
  int number;

  Operation(int number){
    this.number = number;
  }
  //This code parse from decimal to binary. It needs to be improved!
  String toBinary(){
    List mod = new List();
    String answer = "";
    int auxNumber = number;
    while(auxNumber != 1){
      mod.add(auxNumber % 2);
      auxNumber = auxNumber ~/ 2;
    }
    mod.add(1);
    Iterable inReverse = mod.reversed;
    var modToReturn = inReverse.toList();
    modToReturn.forEach((i) => answer += i.toString());
    return answer;
  }
  //This function parse from binary to decimal
  String toDecimal(){
    List numberList = number.toString().split("");
    int result = -1, cont = 0;
    if(verifyNumber(numberList)){
      result = 0;
      for(var i = numberList.length - 1; i >= 0;i--){
        if(numberList[i] == "1") result += math.pow(2, cont);
        cont++;
      }
      return result.toString();
    }else{
      return result.toString();
    }
  }

  String toHexadecimal(){
    return number.toRadixString(16).toString();
  }

  verifyNumber(List number){
    for(var i = 2; i < 10; i++){
      if(number.contains(i.toString())) return false;
    }
    return true;
  }
}