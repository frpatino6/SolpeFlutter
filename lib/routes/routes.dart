import 'package:flutter/material.dart';
import 'package:rcn_solpe/pages/detalle_pedido_page.dart';
import 'package:rcn_solpe/pages/login_page.dart';
import 'package:rcn_solpe/pages/solpes_list.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    SolpesList.routeName: (BuildContext context) => SolpesList(),
    DetallePedido.routeName: (BuildContext context) => DetallePedido(),
  };
}
