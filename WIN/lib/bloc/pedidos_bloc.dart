import 'package:rxdart/rxdart.dart';
import 'package:solpe_win/models/pedidos_response.dart';
import 'package:solpe_win/providers/pedidos_provider.dart';

class PedidosBloc {
  final _pedidosProvider = new PedidosProvider();
  final _pedidosFetcher = PublishSubject<List<PedidosResponse>>();
  List<PedidosResponse> _listPedidos;
  List<PedidosResponse> get listAllPedidos => _listPedidos;

  Stream<List<PedidosResponse>> get allConjuntos => _pedidosFetcher.stream;

  fetchAllPedidos(String user) async {
    _listPedidos = await _pedidosProvider.fetchPedidos(user);
    _pedidosFetcher.sink.add(_listPedidos);
  }

  dispose() {
    _pedidosFetcher.close();
  }
}

final bloc = PedidosBloc();
