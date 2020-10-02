// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

PedidosResponse ordersFromJson(String str) => PedidosResponse.fromJson(json.decode(str));

String ordersToJson(PedidosResponse data) => json.encode(data.toJson());

extension Grouping<Key,Value> on Iterable<Value> {
  /// Takes a function that maps each object to the value it should be grouped by
  /// Ex: If you want to sort a `List<People>` by location, you would pass `(p) => p.location`
  Map<Key, List<Value>> groupingBy(Key Function(Value) f){
    var result = <Key, List<Value>>{};
    for(var v in this) result[f(v)] = (result[f(v)] ?? [])..add(v);
    return result;
  }
}

class PedidosResponse {
  PedidosResponse({
    this.cantidad,
    this.destino,
    this.estado,
    this.mandante,
    this.numero,
    this.posicion,
    this.proveedor,
    this.texto,
    this.tipoDoc,
    this.usuario,
    this.valor,
    this.valorLiteral,
  });

  double cantidad;
  String destino;
  String estado;
  String mandante;
  String numero;
  int posicion;
  String proveedor;
  String texto;
  String tipoDoc;
  String usuario;
  double valor;
  String valorLiteral;

  factory PedidosResponse.fromJson(Map<String, dynamic> json) => PedidosResponse(
        cantidad: json["cantidad"].toDouble(),
        destino: json["destino"]??"",
        estado: json["estado"]??"",
        mandante: json["mandante"]??"",
        numero: json["numero"]??"",
        posicion: json["posicion"].toInt(),
        proveedor: json["proveedor"]??"",
        texto: json["texto"]??"",
        tipoDoc: json["tipo_Doc"]??"",
        usuario: json["usuario"]??"",
        valor: json["valor"].toDouble(),
        valorLiteral: json["valorLiteral"]??"",
      );

  Map<String, dynamic> toJson() => {
        "cantidad": cantidad,
        "destino": destino,
        "estado": estado,
        "mandante": mandante,
        "numero": numero,
        "posicion": posicion,
        "proveedor": proveedor,
        "texto": texto,
        "tipo_Doc": tipoDoc,
        "usuario": usuario,
        "valor": valor,
        "valorLiteral": valorLiteral,
      };
}
