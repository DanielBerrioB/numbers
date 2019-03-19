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
}