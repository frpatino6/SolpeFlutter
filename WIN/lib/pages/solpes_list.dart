import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solpe_win/bloc/pedidos_bloc.dart';
import 'package:solpe_win/helpers/Dialogs.dart';
import 'package:solpe_win/models/pedidos_response.dart';
import 'package:solpe_win/providers/login_provider.dart';
import 'package:solpe_win/widgets/solpes/create_pedidos_widget.dart';
import 'package:solpe_win/widgets/solpes/create_solpes.dart';


class SolpesList extends StatefulWidget {
  static const String routeName = "SolpesList";

  @override
  _SolpesListState createState() => _SolpesListState();
}

class _SolpesListState extends State<SolpesList> {
  List<PedidosResponse> _listPedidosResponse;

  @override
  Widget build(BuildContext context) {
    _listPedidosResponse = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: _createAppBar(),
          floatingActionButton: _createActionRefresh(),
          body: _createBody(context)),
    );
  }

  Widget _createBody(BuildContext _context) {
    return TabBarView(
      children: [
        CreateSolpes(
          pedidosResponse: _listPedidosResponse,
          context: _context,
          heightSizedBox: 15.0,
          fontSizeInfo: 16.0,
          fontSizeLabel: 14.0,
        ),
        CreatePedidos(
          pedidosResponse: _listPedidosResponse,
          context: _context,
          heightSizedBox: 15.0,
          fontSizeInfo: 16.0,
          fontSizeLabel: 14.0,
        ),
      ],
    );
  }

  Widget _createAppBar() {
    return AppBar(
      title: Text("Pendientes"),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.ac_unit),
            text: "Solicitudes de pedidos",
          ),
          Tab(icon: Icon(Icons.sort), text: "Pedidos"),
        ],
      ),
    );
  }

  Widget _createActionRefresh() {
    return FloatingActionButton(
      mini: true,
      onPressed: () {
        Dialogs.showLoadingDialogMessage(context, "Actualizando pedidos pendientes");
        bloc.fetchAllPedidos(LoginProvider.instance.userEmail).then((value) {
          setState(() {
            Navigator.pop(context);
          });
        });
      },
      child: FaIcon(
        FontAwesomeIcons.syncAlt,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
