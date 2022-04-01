import 'dart:typed_data';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proyecto_final_bases/app/modules/home/controllers/home_controller.dart';

class TravelExpensesController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  HomeController homeController = Get.find();


  List<String> names = [];
  String allNames = '';
  generateLiquidation() async {
    await generatePDF();
  }

  addStudents() async {
    for (int i = 0; i < homeController.travel!.items!.length; i++) {
      names.add(
          '- nombre:  ${homeController.travel!.items![i].nombreestudiante!} ${homeController.travel!.items![i].apellidoestudiante!}, email: ${homeController.travel!.items![i].correoestudiante}, id: ${homeController.travel!.items![i].codestudiante}, # sesiones ${homeController.travel!.items![i].sesiones}');
    }
    allNames = names.join('\n');
    print(allNames);
  }

  generatePDF() async {
    addStudents();
    // return null;
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.nunitoExtraLight();
    // await addStudents();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Decanatura de la Facultad de Artes\n\n\n'
                'Liquidación de viáticos de los estudiantes de la obra de teatro\n\n\n'
                'Titulo de la Obra: ${homeController.travel!.items![0].obra}\n'
                'Periodo: ${homeController.travel!.items![0].periodo}  \n'
                '$allNames'
                '${homeController.loginController.globalUser.nombreempleado} ${homeController.loginController.globalUser.apellidoempleado}, '
                '${homeController.loginController.globalUser.cedulaempleado}',
                style: pw.TextStyle(
                  font: font,
                  fontSize: 20,
                ),
              ),
              pw.Column(
                children: [
                  pw.Text(''),
                ],
              )
            ],
          );
        },
      ),
    );
    //Create PDF in Bytes
    List<Uint8List> uint = [];
    uint.add(await pdf.save());
    Uint8List pdfInBytes = uint[0];

    //Create blob and link from bytes
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    print(url);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'Liquidacion.pdf';
    html.document.body!.children.add(anchor);
    anchor.click();
  }
}
