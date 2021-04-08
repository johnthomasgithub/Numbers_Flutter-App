import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:baseconvert/Converter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Converter",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tfBinary = TextEditingController(),
      tfOctal = TextEditingController(),
      tfDecimal = TextEditingController(),
      tfHexaDecimal = TextEditingController();
  var fnBinary = FocusNode(),
      fnOctal = FocusNode(),
      fnDecimal = FocusNode(),
      fnHexaDecimal = FocusNode();

  void convert(int t) {
    String data;
    double decimal;
    switch (t) {
      case 1:
        data = Converter().binaryToDecimal(tfBinary.text);
        break;
      case 2:
        data = Converter().octalToDecimal(tfOctal.text);
        break;
      case 3:
        data = tfDecimal.text;
        break;
      case 4:
        data = Converter().hexaToDecimal(tfHexaDecimal.text.toUpperCase());
        break;
    }
    decimal = double.parse(data);
    tfBinary.text = Converter().decimalToBinary(decimal);
    tfOctal.text = Converter().decimalToOctal(decimal);
    tfDecimal.text = decimal.toString();
    tfHexaDecimal.text = Converter().decimalToHexa(decimal);
  }

  @override
  Widget build(BuildContext context) {
    Color colorLightGrey = new Color(0xFFED7F6);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
              flex: 2,
              child: Container(
                child: Text(
                  "Base Convertion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "RobotoBlack",
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                      color: Colors.purple.withAlpha(1000)),
                ),
              )),
          Flexible(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(top: 25),
              child: Center(
                child: ListView(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  shrinkWrap: true,
                  children: <Widget>[
                    Text(
                      "BINARY",
                      style: TextStyle(
                          fontFamily: "SegoeUi",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 5, bottom: 15, right: 10),
                            height: 50,
                            color: colorLightGrey,
                            child: TextField(
                              controller: tfBinary,
                              focusNode: fnBinary,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[01\.]"))
                              ],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colorLightGrey,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            color: colorLightGrey,
                            margin:
                                EdgeInsets.only(top: 5, bottom: 15, left: 10),
                            child: Container(
                              child: ButtonTheme(
                                height: 50,
                                child: RaisedButton(
                                  color: colorLightGrey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.purple.withAlpha(950),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.compare_arrows_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  onPressed: () {
                                    convert(1);
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "OCTAL",
                      style: TextStyle(
                          fontFamily: "SegoeUi",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 5, bottom: 15, right: 10),
                            height: 50,
                            color: colorLightGrey,
                            child: TextField(
                              controller: tfOctal,
                              focusNode: fnOctal,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                    RegExp("[0-7\.]"))
                              ],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colorLightGrey,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              color: colorLightGrey,
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 15, left: 10),
                              child: Container(
                                  child: ButtonTheme(
                                height: 50,
                                child: RaisedButton(
                                    color: colorLightGrey,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.purple.withAlpha(950),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                    onPressed: () {
                                      convert(2);
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    }),
                              )),
                            ))
                      ],
                    ),
                    Text(
                      "DECIMAL",
                      style: TextStyle(
                          fontFamily: "SegoeUi",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Flexible(
                          flex: 5,
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 5, bottom: 15, right: 10),
                            height: 50,
                            color: colorLightGrey,
                            child: TextField(
                              controller: tfDecimal,
                              focusNode: fnDecimal,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                    RegExp("[0-9\.]"))
                              ],
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: colorLightGrey,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                            flex: 2,
                            child: Container(
                              color: colorLightGrey,
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 15, left: 10),
                              child: Container(
                                  child: ButtonTheme(
                                height: 50,
                                child: RaisedButton(
                                    color: colorLightGrey,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.purple.withAlpha(950),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.compare_arrows_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                    onPressed: () {
                                      convert(3);
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    }),
                              )),
                            ))
                      ],
                    ),
                    Text(
                      "HEXA-DECIMAL",
                      style: TextStyle(
                          fontFamily: "SegoeUi",
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.purple),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                            flex: 5,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 15, right: 10),
                              height: 50,
                              color: colorLightGrey,
                              child: TextField(
                                controller: tfHexaDecimal,
                                focusNode: fnHexaDecimal,
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      RegExp("[0-9a-fA-F\.]"))
                                ],
                                textCapitalization:
                                    TextCapitalization.characters,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: colorLightGrey,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                color: colorLightGrey,
                                margin: EdgeInsets.only(
                                    top: 5, bottom: 15, left: 10),
                                child: Container(
                                    child: ButtonTheme(
                                  height: 50,
                                  child: RaisedButton(
                                      color: colorLightGrey,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.purple.withAlpha(950),
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          Icons.compare_arrows_rounded,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ),
                                      onPressed: () {
                                        convert(4);
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      }),
                                )),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
