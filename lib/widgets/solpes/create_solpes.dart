import 'package:flutter/material.dart';
import 'package:rcn_solpe/bloc/pedidos_bloc.dart';
import 'package:rcn_solpe/helpers/Dialogs.dart';
import 'package:rcn_solpe/models/pedidos_response.dart';
import 'package:rcn_solpe/providers/login_provider.dart';
import 'package:rcn_solpe/providers/pedidos_provider.dart';

class CreateSolpes extends StatefulWidget {
  CreateSolpes(
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
        super(key: key);
  final BuildContext _context;
  final double _heightSizedBox;
  final double _fontSizeInfo;
  final double _fontSizeLabel;
  final String _userName;

  @override
  _CreateSolpesState createState() => _CreateSolpesState();
}

class _CreateSolpesState extends State<CreateSolpes> {
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

  Widget _createInfo(BuildContext _context) {
    if (bloc.listAllPedidos != null) {
      List<PedidosResponse> response = bloc.listAllPedidos;
      response = response.where((element) => element.tipoDoc == "S").toList();
      if (response.length > 0) {
        return _createListData(_context, response);
      } else {
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
      BuildContext _context, List<PedidosResponse> response) {
    return RefreshIndicator(
      onRefresh: () => _callGetLiberaSolpes(),
      child: ListView.separated(
        itemCount: response.length,
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
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text(
                                      'SOL.PEDIDO:: ',
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
                            height: widget._heightSizedBox,
                          ),
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text('CANTIDAD: ',
                                        style: TextStyle(
                                            color: labelColor,
                                            fontSize: widget._fontSizeLabel)),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    ' ${response[index].cantidad}',
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
                          Row(
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text('POSICIÓN: ',
                                        style: TextStyle(
                                            color: labelColor,
                                            fontSize: widget._fontSizeLabel)),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    ' ${response[index].posicion}',
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
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text('PRODUCCIÓN: ',
                                        style: TextStyle(
                                            color: labelColor,
                                            fontSize: widget._fontSizeLabel)),
                                  ],
                                ),
                              ),
                              Container(
                                child: InkWell(
                                  child: Text(
                                    ' ${response[index].destino}',
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
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text('PROVEEDOR: ',
                                        style: TextStyle(
                                            color: labelColor,
                                            fontSize: widget._fontSizeLabel)),
                                  ],
                                ),
                              ),
                              Container(
                                child: Flexible(
                                  child: Text(
                                    '${response[index].proveedor}',
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
                                width:
                                    MediaQuery.of(_context).size.width * 0.28,
                                child: Row(
                                  children: [
                                    Text('VALOR: ',
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

  void _callUpdateSolpeState(String numero, int posicion) {
    Dialogs.showLoadingDialogMessage(context, "Liberando pedido");
    PedidosProvider.instance.UpdateSolpeState(numero, posicion).then((value) {
      Navigator.pop(context);
      _processResult(value);
    });
  }

  _processResult(bool value) {
    if (value) {
      _callGetLiberaSolpes();
      print(value);
    }
  }

  Future<void> _callGetLiberaSolpes() async {
    Dialogs.showLoadingDialogMessage(
        context, "Actualizando pedidos pendientes");
    bloc.fetchAllPedidos(LoginProvider.instance.userEmail).then((value) {
      setState(() {
        Navigator.pop(context);
      });
    });
  }
}
