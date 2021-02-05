import 'package:flutter/material.dart';
import 'package:solpe_win/pages/detalle_pedido_page.dart';
import 'package:solpe_win/pages/login_page.dart';
import 'package:solpe_win/pages/solpes_list.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    SolpesList.routeName: (BuildContext context) => SolpesList(),
    DetallePedido.routeName: (BuildContext context) => DetallePedido(),
  };
}
