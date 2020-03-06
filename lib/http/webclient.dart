

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:motovibe/model/DadosSalvos.dart';
import 'package:motovibe/model/cliente.dart';


String URLhttp="https://api.myjson.com/bins/ugrba";

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
      print(data);
      return data;
  }

}
Future<List<DadosSalvos>> findAll() async {
  final Client cliente= HttpClientWithInterceptor.build(interceptors: [LogginInterceptor()]);
  final Response response = await cliente.get(URLhttp);
  final List<dynamic> jsondecoded = jsonDecode(response.body);
  final List<DadosSalvos> clientes= List();
  for(Map<String, dynamic> element in jsondecoded){
      final DadosSalvos itemcliente=DadosSalvos(element["modelo"], element["valor"],element["data"],element["hora"]);
      clientes.add(itemcliente); 
  }
  clientes.add(DadosSalvos("bmw", 200,"15/02","13:00"));
  return clientes;
  
}