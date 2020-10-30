import 'package:dio/dio.dart';
import 'package:rcn_solpe/models/pedidos_response.dart';
import 'package:rcn_solpe/providers/pedidos_provider.dart';
import 'package:rxdart/rxdart.dart';

class PedidosBloc {
  final _pedidosProvider = new PedidosProvider();
  final _pedidosFetcher = PublishSubject<List<PedidosResponse>>();
  List<PedidosResponse> _listPedidos;
  List<PedidosResponse> get listAllPedidos => _listPedidos;

  Stream<List<PedidosResponse>> get allConjuntos => _pedidosFetcher.stream;


  fetchAllPedidos(String user) async{
    _listPedidos = await _pedidosProvider.fetchPedidos(user);
    _pedidosFetcher.sink.add(_listPedidos);
  }
  dispose() {
    _pedidosFetcher.close();
  }
}
final bloc = PedidosBloc();