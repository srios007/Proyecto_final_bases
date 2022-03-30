import 'dart:typed_data';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/play.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proyecto_final_bases/app/routes/app_pages.dart';

class CertificatesController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  RxInt position = 0.obs;
  List<Play> playsList = [
    Play(
      playName: 'Romeo y Julieta',
      students: [
        Student(
          id: '1010',
          email: 'Santiago@gmail.com',
          name: 'Santiago Rios',
          section: 'Intro',
          period: '27-FEB-22 - 05-MAR-22',
          sessions: 2,
          hours: 2,
          isSelected: false.obs,
          play: 'Romeo y Julieta',
        ),
      ],
    ),
    Play(
      playName: 'La Celestina',
      students: [
        Student(
          id: '2124',
          email: 'jorge@gmail.com',
          name: 'Jorge Bohórquez',
          section: 'Intermedio',
          period: '27-FEB-22 - 05-MAR-22',
          sessions: 3,
          hours: 1,
          isSelected: false.obs,
          play: 'La Celestina',
        ),
      ],
    ),
    Play(
      playName: 'Don Juan Tenorio',
      students: [
        Student(
          id: '3453',
          email: 'jmostosq@gmail.com',
          name: 'Juan Manuel Ostos',
          section: 'Final',
          period: '27-FEB-22 - 05-MAR-22',
          sessions: 4,
          hours: 3,
          isSelected: false.obs,
          play: 'Don Juan Tenorio',
        ),
      ],
    ),
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

  generateLiquidation(Student student) async {
    await generatePDF(student);
  }

  goToDetail() async {
    Get.toNamed(Routes.CERTIFICATES_DETAIL);
  }

  generatePDF(Student student) async {
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
                'El estudiante: ${student.name}, participó en la obra: ${student.play}, con un total de horas de: ${student.hours}\n',
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
