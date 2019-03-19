import "package:flutter/material.dart";
import "operation.dart";

class Parser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Parser();
}

class _Parser extends State<Parser> {
  //Here you can find a bool variable to the textField
  //that verifies if the content is properly. Second check1 verifies
  //if the CheckBox1 has been selected at the same for check2.
  //check1 means binary and check2 means decimal
  bool inputIsValid = true, check1 = false, check2 = false;
  String textAnswer = "";

  void check1Changed(bool value) {
    setState(() {
      check1 = true;
      check2 = false;
    });
  }

  void check2Changed(bool value) {
    setState(() {
      check2 = true;
      check1 = false;
    });
  }

  //Here you can create a text field where the
  //number will be enter. At onSubmitted we are
  //going to execute the task depending of the
  //value on the checkBox
  TextField createTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.display1,
      decoration: InputDecoration(
        labelText: "Enter an integer:",
        errorText: inputIsValid ? null : "Please enter a fucking integer",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onSubmitted: (String value) {
        Operation newOperation = new Operation(int.parse(value));
        setState(() {
          if (check1)
            textAnswer = newOperation.toBinary();
          else if (check2)
            newOperation.toDecimal() == "-1"
                ? textAnswer = "¿Qué haces?"
                : textAnswer = newOperation.toDecimal();
        });
      },
      onChanged: (String value) {
        if(value.isEmpty){
          setState(() {
            textAnswer = "";
          });
        }else {
          try {
            Operation newOperation = new Operation(int.parse(value));
            if (check1) {
              setState(() {
                textAnswer = newOperation.toBinary();
              });
            } else if (check2) {
              if (newOperation.toDecimal() == "-1") {
                setState(() {
                  textAnswer = "¿Qué haces?";
                });
              } else {
                setState(() {
                  textAnswer = newOperation.toDecimal();
                });
              }
            }
          } catch (e) {
            setState(() {
              inputIsValid = false;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text("Parser"),
        backgroundColor: Colors.green,
      ),
      body: new Stack(
        children: <Widget>[
          //Simple title to the app
          new Container(
              height: 80.0,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 30.0,
              ),
              child: new Center(
                child: new Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              )),
          //This container stores the text Field
          new Container(
            height: 260.0,
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
            child: createTextField(),
          ),

          new Container(
            padding: new EdgeInsets.only(left: 20.0, right: 20.0, top: 180.0),
            height: 260.0,
            width: MediaQuery.of(context).size.width,
            child: new Row(
              children: <Widget>[
                new Center(
                  child: new Container(
                    width: MediaQuery.of(context).size.width / 3 + 30,
                    child: new CheckboxListTile(
                      value: check1,
                      onChanged: check1Changed,
                      title: Text("Binary"),
                      activeColor: Colors.lightBlue,
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    width: MediaQuery.of(context).size.width / 3 + 30,
                    child: new CheckboxListTile(
                      value: check2,
                      onChanged: check2Changed,
                      title: Text("Decimal"),
                      activeColor: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            padding: new EdgeInsets.only(left: 20.0, right: 20.0, top: 250.0),
            height: 390.0,
            child: new Center(
              child: new Text(
                textAnswer,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
