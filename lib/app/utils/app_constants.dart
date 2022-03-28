///
/// Esta clase contiene todos los valores constantes en la aplicación
///

class AppConstants {
  final List<String> banksList = [
    "BANCO AV VILLAS",
    "BANCO BBVA COLOMBIA S.A.",
    "BANCO CAJA SOCIAL",
    "BANCO COOPERATIVO COOPCENTRAL",
    "BANCO DAVIVIENDA",
    "BANCO DE BOGOTA",
    "BANCO DE OCCIDENTE",
    "BANCO FALABELLA ",
    "BANCO GNB SUDAMERIS",
    "BANCO ITAU",
    "BANCO PICHINCHA S.A.",
    "BANCO POPULAR",
    "BANCO PROCREDIT",
    "BANCO SANTANDER COLOMBIA",
    "BANCO SERFINANZA",
    "BANCOLOMBIA",
    "BANCOOMEVA S.A.",
    "CFA COOPERATIVA FINANCIERA",
    "CITIBANK ",
    "CONFIAR COOPERATIVA FINANCIERA",
    "DAVIPLATA",
    "NEQUI",
    "RAPPIPAY",
    "SCOTIABANK COLPATRIA",
  ];
  final List<String> bankAccountTypes = [
    "Ahorros",
    "Corriente",
  ];
  final List<String> addressType = [
    "Avenida",
    "Calle",
    "Vía",
    "Transversal",
    "Manzana",
    "Diagonal",
    "Circunvalar",
    "Circular",
    "Avenida Calle",
    "Carrera",
    "Avenida Carrera",
  ];
int localVersion = 14; // Versión local del código
int firebaseVersion = 0; // Versión actual de Firebase
String labelVersion = '1.4.0'; // Versión que sale dentro del app
late String appStoreUrl; // Link en App Store
late String playStoreUrl; // Link en PlayStore
late String termsUrl; // Link términos y condiciones
late String policiesUrl; // Link políticas y tratamiento de datos
String supportEmail = ''; // Email de soporte
String mailToSend = ''; // Email al que llega
String supportPassword = ''; // Password email de soporte
String supportPhoneNumber = ''; // Teléfono de soporte
String sendGridToken = ''; // Token de sSend Grid 
String emailName = ''; // Nombre de la persona a la que se le envía

}

AppConstants constants = AppConstants();
