import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:image_picker/image_picker.dart';
//import '../../models/user.dart';
import '../../models/user.dart';
import '../../providers/users_providers.dart';
//
class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  //ImagePicker picker = ImagePicker();
  //File? imageFile;

  get image => null;
  get pw => '';
  get session_token => null;

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastname = lastnameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email ${email}');
    print('Password ${password}');

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {

      User user = User(
          id: '',
          email: email,
          name: name,
          lastname: lastname,
          phone: phone,
          image: '',
          password: password
      );

      Response response = await usersProvider.create(user);
      print('RESPONSE: ${response.body}');
      Get.snackbar('Formulario Válido', 'Enviar a HTTP');
    }
  }

    bool isValidForm(
        String email,
        String name,
        String lastname,
        String phone,
        String password,
        String confirmPassword
        ) {

      if (email.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar el email');
        return false;
      }

      if (!GetUtils.isEmail(email)) {
        Get.snackbar('Formulario no valido', 'El email no es valido');
        return false;
      }

      if (name.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu nombre');
        return false;
      }

      if (lastname.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu apellido');
        return false;
      }

      if (phone.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar tu numero telefónico');
        return false;
      }

      if (password.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar el password');
        return false;
      }

      if (confirmPassword.isEmpty) {
        Get.snackbar('Formulario no valido', 'Debes ingresar la confirmación del password');
        return false;
      }

      if (password != confirmPassword) {
        Get.snackbar('Formulario no valido', 'los password no coinciden');
        return false;
      }

      return true;
    }

  }

