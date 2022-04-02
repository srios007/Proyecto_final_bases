import 'dart:typed_data';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/actores_model.dart';
import 'package:proyecto_final_bases/app/models/play.dart';
import 'package:proyecto_final_bases/app/models/providers/actores_provider.dart';
import 'package:proyecto_final_bases/app/models/providers/obra_provider.dart';
import 'package:proyecto_final_bases/app/models/providers/search_provider.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proyecto_final_bases/app/modules/home/controllers/home_controller.dart';
import 'package:proyecto_final_bases/app/routes/app_pages.dart';

class CertificatesController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  RxInt position = 0.obs;
  HomeController homeController = Get.find();
  Actor? actor = Actor();
  Items item = Items();

  List<Student> selectedStudents = [];

  @override
  void onInit() {
    setActor(0);
    super.onInit();
  }

  setActor(int position) async {
    isLoading.value = true;
    actor = await actorProvider
        .getEmpleado(homeController.obra!.items![position].titulo!);
    
    isLoading.value = false;
  }

  choosePlay(bool isFirst) {
    firstPlay.value = isFirst ? true : false;
    isActive.value = isFirst ? false : true;
  }

  onChanged(int position) {
    isLoading.value = true;
    // if (students[position].isSelected!.value) {
    //   selectedStudents.remove(students[position]);
    //   students[position].isSelected!.value = false;
    //   isLoading.value = false;
    // } else {
    //   selectedStudents.add(students[position]);
    //   students[position].isSelected!.value = true;
    //   isLoading.value = false;
    // }
  }

  generateLiquidation(Items student) async {
    await generatePDF(student);
  }

  goToDetail() async {
    Get.toNamed(Routes.CERTIFICATES_DETAIL);
  }

  generatePDF(Items student) async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Decanatura de la Facultad de Artes\n\n\n'
                'Certificado de participación\n\n\n'
                'El estudiante: ${student.nombreestudiante} ${student.apellidoestudiante}, participó en la obra: ${student.titulo},\n',
                style: pw.TextStyle(
                  font: font,
                  fontSize: 20,
                ),
              ),
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
      ..download = 'Certificado.pdf';
    html.document.body!.children.add(anchor);
    anchor.click();
  }
}
