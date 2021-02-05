import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rcn_solpe/bloc/pedidos_bloc.dart';
import 'package:rcn_solpe/helpers/Dialogs.dart';
import 'package:rcn_solpe/models/login_request.dart';
import 'package:rcn_solpe/providers/login_provider.dart';
import 'package:rcn_solpe/providers/token_provider.dart';
import 'package:rcn_solpe/widgets/login/create_background.dart';
import 'package:rcn_solpe/widgets/login/create_login_form_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String primaryColor = '#3d5afe';
  String secondaryColor = '#00251a';
  double percentage = 0.50;
  double percentageSecondPanelWidth = 0.50;
  double percentageSecondPanelHeight = 0.50;
  TextEditingController _pwsController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  bool isWeb = false;

  @override
  Widget build(BuildContext context) {
    //_pwsController.text = ""; //"GetLiberaSolpes/WILLIAM.CELENO";
    //_usernameController.text = ""; //"frodriguezp";
    if (kIsWeb) {
      isWeb = true;
      percentage = 0.40;
      // running on the web!
    } else {
      percentage = 0.90;
      percentageSecondPanelWidth = 0.90;
      percentageSecondPanelHeight = 0.75;
      // NOT running on the web! You can check for additional platforms here.
    }
    return Scaffold(
      body: _createBody(),
    );
  }

  Widget _createBody() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CreateBackground(size: size),
        _loginForm(context, size),
      ],
    );
  }

  Widget _loginForm(BuildContext _context, size) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.35,
            ),
          ),
          Container(
            width: size.width * percentageSecondPanelWidth,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 8.0),
                      spreadRadius: 5.0)
                ]),
            child: Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CreateLoginFormInputs(
                      onLoginPressed: () => _loginUser(_context),
                      percentage: percentage,
                      usernameController: _usernameController,
                      pwsController: _pwsController)),
            ),
          ),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  _loginUser(BuildContext _context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    LoginRequest request = new LoginRequest();
    request.userEmail = _usernameController.text;
    request.userPassword = _pwsController.text;
    request.platform = PlatformProvider.instance.getPlatform();
    request.accessToken = PlatformProvider.instance.getToken();

    _callValidateUser(_context, request);
  }

  _callValidateUser(BuildContext _context, LoginRequest request) {
    Dialogs.showLoadingDialogMessage(_context, "Validando usuario y contraseña");
    LoginProvider.instance.fetchLogin(request).then((value) {
      print(value);
      Navigator.pop(_context);
      _callGetLiberaSolpes(_context, request.userEmail);
    }).catchError((error, stackTrace) {
      Navigator.pop(_context);
      Dialogs.showMessageDialog(_context, error, "Error", 20);
    });
  }

  _callGetLiberaSolpes(BuildContext _context, String userName) {
    Dialogs.showLoadingDialogMessage(_context,"Consultando solpes y pedidos");
    bloc
        .fetchAllPedidos(userName)
        .then((value) => _processResponse(_context, value));
  }

  _processResponse(BuildContext _context, dynamic value) {
    Navigator.pop(_context);
    Navigator.pushNamed(_context, "SolpesList", arguments: value);
  }
}
