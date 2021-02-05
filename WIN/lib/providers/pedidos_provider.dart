import 'dart:async';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:solpe_win/models/pedidos_response.dart';

import 'dio_provider.dart';

class PedidosProvider {
  static final PedidosProvider instance = PedidosProvider._();

  PedidosProvider();

  PedidosProvider._();

  final _pedidosStream = StreamController<List<PedidosResponse>>.broadcast();

  Stream<List<PedidosResponse>> get pedidosStream => _pedidosStream.stream;

  Function(List<PedidosResponse>) get pedidosSink => _pedidosStream.sink.add;

  void disposeStreams() {
    _pedidosStream?.close();
  }

  Future<List<PedidosResponse>> fetchPedidos(String user) async {
    try {
      var dio = Dio();
      Response response;

      String url =
          DioProvider.instance.urlDatabase + '/solpe/GetLiberaSolpes/$user';

      DioProvider.instance.setHeader(dio);

      response = await dio.get(url);

      return _processResponse(response);
    } on DioError catch (e) {
      throw (e.response.data);
    }
  }

  Future<bool> UpdateSolpeState(String num, int pos) async {
    try {
      var dio = Dio();
      Response response;

      String url = DioProvider.instance.urlDatabase +
          '/solpe/UpdateSolpeState/${num}/${pos}';

      DioProvider.instance.setHeader(dio);

      response = await dio.post(url);

      return _processResponseLibera(response);
    } on DioError catch (e) {
      throw (e.response.data);
    }
  }

  Future<bool> UpdatePedidoState(String num) async {
    try {
      var dio = Dio();
      Response response;

      String url =
          DioProvider.instance.urlDatabase + '/solpe/UpdatePedidoState/${num}';

      DioProvider.instance.setHeader(dio);

      response = await dio.post(url);

      return _processResponseLibera(response);
    } on DioError catch (e) {
      throw (e.response.data);
    }
  }

  List<PedidosResponse> _processResponse(Response response) {
    List<PedidosResponse> _listResult = new List<PedidosResponse>();
    if (response.statusCode == 200) {
      for (dynamic item in response.data) {
        dynamic result = PedidosResponse.fromJson(item);
        _listResult.add(result);
      }
      pedidosSink(_listResult);
      return _listResult;
    } else {}
  }

  bool _processResponseLibera(Response response) {
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  setCurrencyFormat(dynamic value) {
    final formatCurrency =
        new NumberFormat.currency(name: "\$", decimalDigits: 2);
    return formatCurrency.format(value);
  }
}
