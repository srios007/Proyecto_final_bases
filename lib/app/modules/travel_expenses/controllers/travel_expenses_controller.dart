import 'dart:html';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
// import 'package:mailer/mailer.dart' as mailer;
// import 'package:mailer/smtp_server/gmail.dart' as server;
// import 'package:proyecto_final_bases/app/routes/app_pages.dart';
// import 'package:proyecto_final_bases/app/services/send_grid_service.dart';
// import 'package:proyecto_final_bases/app/widgets/snackbars.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TravelExpensesController extends GetxController {
  File? file;
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  List<Student> students = [
    Student(
        name: 'Santiago', isSelected: false.obs, section: 'sección', hours: 5),
    Student(name: 'Juan', isSelected: false.obs, section: 'sección1', hours: 2),
    Student(
        name: 'Camilo', isSelected: false.obs, section: 'sección2', hours: 3),
    Student(
        name: 'Laura', isSelected: false.obs, section: 'sección3', hours: 4),
    Student(
        name: 'María', isSelected: false.obs, section: 'sección4', hours: 7),
    Student(
        name: 'Valentina',
        isSelected: false.obs,
        section: 'sección5',
        hours: 8),
    Student(
        name: 'Caterina',
        isSelected: false.obs,
        section: 'sección6',
        hours: 10),
    Student(
        name: 'Giovanni',
        isSelected: false.obs,
        section: 'sección7',
        hours: 14),
    Student(
        name: 'Santiago1',
        isSelected: false.obs,
        section: 'sección8',
        hours: 21),
    Student(
        name: 'Santiago2',
        isSelected: false.obs,
        section: 'sección9',
        hours: 13),
    Student(
        name: 'Santiago3',
        isSelected: false.obs,
        section: 'sección10',
        hours: 4),
    Student(
        name: 'Santiago4',
        isSelected: false.obs,
        section: 'sección11',
        hours: 3),
    Student(
        name: 'Santiago5',
        isSelected: false.obs,
        section: 'sección12',
        hours: 2),
  ];
  List<Student> selectedStudents = [];

  @override
  void onInit() {
    super.onInit();
  }

  choosePlay(bool isFirst) {
    firstPlay.value = isFirst ? true : false;
    isActive.value = isFirst ? false : true;
  }

  onChanged(int position) {
    isLoading.value = true;
    if (students[position].isSelected!.value) {
      selectedStudents.remove(students[position]);
      students[position].isSelected!.value = false;
      isLoading.value = false;
    } else {
      selectedStudents.add(students[position]);
      students[position].isSelected!.value = true;
      isLoading.value = false;
    }
  }

  generateLiquidation() async {
    // String messageUser = 'EL USUARIO:';
    // sendGridService.sendGridEmail(messageUser, "Prueba");
    await generatePDF();
    // Get.toNamed(Routes.PDF);
  }

  generatePDF() async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'Hello World',
              style: pw.TextStyle(
                font: font,
                fontSize: 40,
              ),
            ),
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
      ..download = 'pdf.pdf';
    html.document.body!.children.add(anchor);
    anchor.click();
  }
}
