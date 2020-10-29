import 'package:flutter/material.dart';
import 'package:rcn_solpe/helpers/Dialogs.dart';
import 'package:rcn_solpe/models/pedidos_response.dart';
import 'package:rcn_solpe/pages/detalle_pedido_page.dart';
import 'package:rcn_solpe/providers/login_provider.dart';
import 'package:rcn_solpe/providers/pedidos_provider.dart';

class CreatePedidos extends StatefulWidget {
  final BuildContext _context;
  final double _heightSizedBox;
  final double _fontSizeInfo;
  final double _fontSizeLabel;
  List<PedidosResponse> _pedidosResponse;
  final String _userName;

  CreatePedidos(
      {Key key,
      double fontSizeLabel,
      double fontSizeInfo,
      @required List<PedidosResponse> pedidosResponse,
      @required BuildContext context,
      @required heightSizedBox,
      String userName})
      : _context = context,
        _userName = userName,
        _fontSizeLabel = fontSizeLabel,
        _fontSizeInfo = fontSizeInfo,
        _heightSizedBox = heightSizedBox,
        _pedidosResponse = pedidosResponse,
        super(key: key);

  @override
  _CreatePedidosState createState() => _CreatePedidosState();
}

class _CreatePedidosState extends State<CreatePedidos> {
  final labelColor = Colors.black54;
  final textInfoColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _createInfo(context),
      ),
    );
  }

  void _callUpdateSolpeState(String numero, int posicion) {
    Dialogs.showLoadingDialog(context);
    PedidosProvider.instance.UpdatePedidoState(numero).then((value) {
      Navigator.pop(context);
      _callGetLiberaSolpes();
      print(value);
    });
  }

  Widget _createInfo(BuildContext _context) {
    if (widget._pedidosResponse != null) {
      List<PedidosResponse> response = widget._pedidosResponse;
      response = response.where((element) => element.tipoDoc == "P").toList();
      if (response.length > 0) {
        return _groupPedidos(response, _context);
      } else {
        //COMENTARIO PRUEBA
        return Center(
          child: Text(
            "No tiene pendiente pedidos por aprobar",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        );
      }
    }
  }

  Widget _createListData(
      BuildContext _context,
      Map<dynamic, List<PedidosResponse>> _response,
      int countLines,
      double totalPedido,
      List<PedidosResponse> response) {
    return RefreshIndicator(
      onRefresh: () => _callGetLiberaSolpes(),
      child: ListView.separated(
        itemCount: _response.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: InkWell(
                                  child: Text(
                                    ' ${response[index].texto}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: widget._fontSizeInfo + 3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(_context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text(
                                      'PEDIDO #: ',
                                      style: TextStyle(
                                          color: labelColor,
                                          fontSize: widget._fontSizeLabel),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    ' ${response[index].numero}',
                                    style: TextStyle(
                                        color: textInfoColor,
                                        fontSize: widget._fontSizeInfo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(_context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text(
                                      'LINEAS: ',
                                      style: TextStyle(
                                          color: labelColor,
                                          fontSize: widget._fontSizeLabel),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    '${_response.values.toList()[index].length}',
                                    style: TextStyle(
                                        color: textInfoColor,
                                        fontSize: widget._fontSizeInfo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: widget._heightSizedBox,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(_context).size.width * 0.4,
                                child: Row(
                                  children: [
                                    Text('VALOR TOTAL:: ',
                                        style: TextStyle(
                                            color: labelColor,
                                            fontSize: widget._fontSizeLabel)),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    ' ${PedidosProvider.instance.setCurrencyFormat(response[index].valor)}',
                                    style: TextStyle(
                                        color: labelColor,
                                        fontSize: widget._fontSizeInfo),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: widget._heightSizedBox,
                          ),
                          ButtonBar(
                            children: <Widget>[
                              Container(
                                width: 150.0,
                                height: 50.0,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                    style: BorderStyle.solid,
                                    width: 1.8,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: Text('Detalle'),
                                  onPressed: () async {
                                   await  Navigator.pushNamed(
                                        _context, DetallePedido.routeName,
                                        arguments:
                                            _response.values.toList()[index]);

                                  },
                                ),
                              ),
                              Container(
                                width: 150.0,
                                height: 50.0,
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                    color: Colors.blueGrey,
                                    style: BorderStyle.solid,
                                    width: 1.8,
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: Text('Liberar'),
                                  onPressed: () {
                                    _callUpdateSolpeState(
                                        response[index].numero,
                                        response[index].posicion);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget _groupPedidos(List<PedidosResponse> response, BuildContext _context) {
    var location = (PedidosResponse p) => p.numero;
    double totalPedido = 0;
    List<PedidosResponse> pedidosGroup = new List<PedidosResponse>();
    Map<dynamic, List<PedidosResponse>> _pedidosGroup =
        response.groupingBy(location);
    _pedidosGroup.forEach((k, v) {
      pedidosGroup.add(v.first);
    });
    response.forEach((element) {
      totalPedido += element.valor * element.cantidad;
    });
    return _createListData(
        _context, _pedidosGroup, response.length, totalPedido, response);
  }

  Future<void> _callGetLiberaSolpes() async {
    PedidosProvider.instance
        .fetchPedidos(LoginProvider.instance.userEmail)
        .then((value) {
      setState(() {
        widget._pedidosResponse = value;
      });
    });
  }
}
