import 'package:flutter/material.dart';

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Cargando....",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static Future<void> showLoadingDialogMessage(BuildContext context, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static Widget showProgressDialog(BuildContext context) {
    return SimpleDialog(backgroundColor: Colors.black54, children: <Widget>[
      Center(
        child: Column(children: [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Cargando....",
            style: TextStyle(color: Colors.white),
          )
        ]),
      )
    ]);
  }

  static Future<String?> showMessageDialog(BuildContext context, String message,
      String title, double _fontSize) async {
    return await showDialog(
        builder: (_) => new AlertDialog(
          title: new Text(title),
          content: new Text(
            message,
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Aceptar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        context: context);
  }


  static Future<String?> showMessageDialogWithEvent(BuildContext context, String message,
      String title, double _fontSize, Function onPressed) async {
    return await showDialog(
        builder: (_) => new AlertDialog(
          title: new Text(title),
          content: new Text(
            message,
            style: TextStyle(
              fontSize: _fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decorationStyle: TextDecorationStyle.double,
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Aceptar"),
              onPressed: () {
                Navigator.pop(context);
                onPressed();
              },
            ),
          ],
        ),
        context: context);
  }


  static Widget showDialogWError(
      BuildContext context, String error, double _fontSize) {
    return AlertDialog(
      title: new Text("Error"),
      content: new Text(
        error,
        style: TextStyle(
          fontSize: _fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          decorationStyle: TextDecorationStyle.double,
        ),
      ),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("Aceptar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  static showSnakBar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
      elevation: 50.0,
    );
  }

  static showMessageDialogE(BuildContext _c, String message) {
    showDialog(
      context: _c,
      builder: (_) => new AlertDialog(
        title: Text("GP Tráfico"),
        contentPadding: const EdgeInsets.all(16.0),
        content: Text(message),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Aceptar'),
              onPressed: () {
                try {
                  Navigator.pop(_c);
                } catch (e) {} finally {}
              }),
        ],
      ),
    );
  }
}
