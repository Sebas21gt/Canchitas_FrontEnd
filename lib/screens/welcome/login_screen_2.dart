import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class _LoginScreen extends StatefulWidget {
const _LoginScreen({Key? key}) : super(key: key);

@override
State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
final _formKey = GlobalKey<FormState>();

late String email;
late String password;

@override
Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
return Scaffold(
body: SingleChildScrollView(
child: Column(
children: [
Container(
padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
height: size.height * 0.40,
width: double.infinity,
decoration: const BoxDecoration(
color: cPrimaryColor,
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(35),
bottomRight: Radius.circular(35))),
child: Column(
children: [
Image.asset(
"assets/images/logo_1.png",
height: 150,
width: 150,
),
// const SizedBox(height: 20),
Center(
child: Text(
"LAS CANCHITAS",
style: Theme.of(context).textTheme.headlineLarge?.copyWith(
color: Colors.white, fontSize: 50, fontFamily: 'SportsBar'),
textAlign: TextAlign.center,
),
),
],
),
),
Container(
padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
height: size.height * 0.60,
width: double.infinity,
decoration: const BoxDecoration(color: cBackgroundColor),
child: Form(
key: _formKey,
child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Column(
children: [
TextFormField(
onSaved: (value) => email = value!,
validator: (value) =>
value!.isEmpty ? "Ingrese su correo" : null,
decoration: const InputDecoration(
border: OutlineInputBorder(
borderSide:
BorderSide(color: cPrimaryColor, width: 20),
borderRadius:
BorderRadius.all(Radius.circular(10))),
labelText: "Correo",
labelStyle:
TextStyle(color: cPrimaryColor, fontSize: 20),
hintText: "Ingrese su correo",
hintStyle: TextStyle(
color: cTextColor,
fontFamily: "SportsBar",
fontSize: 18),
floatingLabelBehavior: FloatingLabelBehavior.always,
suffixIcon: Icon(
Icons.mail_outline,
color: cPrimaryColor,
),
),
),
const SizedBox(height: 40),
TextFormField(
onSaved: (value) => password = value!,
validator: (value) => value!.length < 6
? "La contraseña debe tener al menos 6 caracteres"
: null,
obscureText: true,
decoration: const InputDecoration(
border: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.green, width: 5),
borderRadius:
BorderRadius.all(Radius.circular(10))),
labelText: "Contraseña",
labelStyle:
TextStyle(color: cPrimaryColor, fontSize: 20),
hintText: "Ingrese su contraseña",
hintStyle: TextStyle(
color: cTextColor,
fontFamily: "SportsBar",
fontSize: 18),
floatingLabelBehavior: FloatingLabelBehavior.always,
suffixIcon: Icon(
Icons.lock_outline,
color: cPrimaryColor,
),
),
),
InkWell(
onTap: () {
// ignore: avoid
print("Olvidé mi contraseña");
},
child: const Text(
"Olvidé mi contraseña",
style: TextStyle(
color: cPrimaryColor,
fontFamily: "SportsBar",
fontSize: 18),
textAlign: TextAlign.end,
),
),
const SizedBox(height: 80),
_CustomButton(
text: "Iniciar Sesión",
colorBorder: Colors.white,
colorText: Colors.white,
colorBackground: cPrimaryColor,
onTap: () {
if (_formKey.currentState!.validate()) {
_formKey.currentState!.save();
_login();
}
},
),
],
)
],
),
),
),
],
),
),
);
}

void _login() async {
var url = Uri.parse('http://localhost:8080/login');
var body = {
"email": email,
"password": password,
};
var response = await http.post(url, body: body);

if (response.statusCode == 200) {
  // La solicitud fue exitosa
  // ignore: unused_local_variable
  var data = response.body;
  // Maneja la respuesta de la API aquí
} else {
  // La solicitud falló
  // ignore: avoid_print
  print('Error en la solicitud: ${response.statusCode}');
}
}
}

class _CustomButton extends StatelessWidget {
final String text;
final Color colorBorder;
final Color colorText;
final Color colorBackground;
final Function()? onTap;

const _CustomButton({
Key? key,
required this.text,
required this.colorBorder,
required this.colorText,
required this.colorBackground,
this.onTap,
}) : super(key: key);

@override
Widget build(BuildContext context) {
return SizedBox(
height: 50,
width: 200,
child: ElevatedButton(
onPressed: onTap,
style: ButtonStyle(
elevation: MaterialStatePropertyAll(15),
backgroundColor: MaterialStatePropertyAll(colorBackground),
shape: MaterialStatePropertyAll(
RoundedRectangleBorder(
side: BorderSide(color: colorBorder, width: 3),
borderRadius: const BorderRadius.all(Radius.circular(30)),
),
),
),
child: Text(
text,
style: TextStyle(
fontFamily: "SportsBar",
fontSize: 20,
color: colorText,
),
),
),
);
}
}