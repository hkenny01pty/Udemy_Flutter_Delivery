import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';
import '../environment/environment.dart';
//import '../models/response_api.dart';


class UsersProvider extends GetConnect {

  String url = Environment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post(
        '$url/create',
        user.toJson(),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    return response;
  } 


//  Future<ResponseApi> login(String email, String password) async {
//    Response response = await post(
//        '$url/findByEmail',
//        //'$url/login',
//        {
//          'email': email,
//          'password': password
//        },
//        headers: {
//          'Content-Type': 'application/json'
//        }
//    );

//    if(response.body == null){
//      Get.snackbar('Error', 'No se puede ejecutar la peticion');
//      return ResponseApi(success: false, message: '', data: null);
//    }
//    ResponseApi responseApi = ResponseApi.fromJson(response.body);
//    return responseApi;

    /*
    if(response.body == null){
      Get.snackbar('Error', 'No se puede ejecutar la peticion');
      return ResponseApi(success: false, message: '', data: null);
    }
    if (response.body is String) {
      print('Response bodyi: ${response.body}');
      Map<String, dynamic> responseBody = json.decode(response.body);
      ResponseApi responseApi = ResponseApi.fromJson(responseBody);
      return responseApi;
    } else {
      // Manejar el caso en el que el cuerpo de la respuesta no es un String válido
      return ResponseApi(success: false, message: 'Error en el formato de la respuesta', data: null);
    }

*/

  }


