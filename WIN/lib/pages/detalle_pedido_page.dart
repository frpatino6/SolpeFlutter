import 'package:flutter/material.dart';
import 'package:solpe_win/helpers/Dialogs.dart';
import 'package:solpe_win/helpers/hexColor.dart';
import 'package:solpe_win/models/pedidos_response.dart';
import 'package:solpe_win/providers/pedidos_provider.dart';
import 'package:solpe_win/widgets/common_widgets/create_divider.dart';

class DetallePedido extends StatefulWidget {
  static const String routeName = "DetallePedido";

  @override
  _DetallePedidoState createState() => _DetallePedidoState();
}

class _DetallePedidoState extends State<DetallePedido> {
  List<PedidosResponse> _listPedidosResponse;
  double _fontSize = 17;
  double _heightHeader = 0;
  double _totalPedido;

  @override
  Widget build(BuildContext context) {
    _heightHeader = 40;
    _fontSize = 17;
    _totalPedido = 0;
    _listPedidosResponse = ModalRoute.of(context).settings.arguments;

    _listPedidosResponse.forEach((element) {
      _totalPedido += element.valor;
    });
    return Scaffold(
      appBar: _createAppBar(context),
      body: _createBody(context),
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      title: Text("Detalle Pedido N° ${_listPedidosResponse[0].numero}"),
    );
  }

  Widget _createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: HexColor("#00272b"),
            height: _heightHeader,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Center(
                    child: Text(
                      'L.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _fontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Text(
                      'TEXTO.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _fontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Center(
                    child: Text(
                      'Q',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _fontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Center(
                    child: Text(
                      'VALOR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _fontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            children: _listPedidosResponse.map(_createDetailPedido).toList(),
          ),
          Container(
            child: Text(
              "TOTAL PEDIDO: ${PedidosProvider.instance.setCurrencyFormat(_totalPedido)}",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepOrangeAccent,
                  fontStyle: FontStyle.italic),
            ),
          ),
          ButtonBar(
            children: [
              Container(
                width: 150.0,
                height: 50.0,
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.8,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child:
                      Text('Regresar', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ),
              Container(
                width: 150.0,
                height: 50.0,
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 1.8,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('Liberar', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Dialogs.showLoadingDialogMessage(
                        context, "Liberando pedido");
                    PedidosProvider.instance
                        .UpdatePedidoState(_listPedidosResponse[0].numero)
                        .then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
                      print(value);
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _createDetailPedido(PedidosResponse response) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                response.tipoDoc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _fontSize),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Flexible(
                child: Text(
                  response.texto,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: _fontSize),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                response.cantidad.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _fontSize),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                PedidosProvider.instance.setCurrencyFormat(response.valor),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _fontSize),
              ),
            ),
            CreateDivider()
          ],
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(response.destino),
              Text(response.proveedor),
              CreateDivider()
            ],
          ),
        )
      ],
    );
  }
}
