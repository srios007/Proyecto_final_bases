import 'dart:typed_data';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/play.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CertificatesController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  RxInt position = 0.obs;
  List<Play> playsList = [
    Play(
      playName: 'Obra 1',
      students: [
        Student(
          name: 'Santiago',
          isSelected: false.obs,
          section: 'sección',
          hours: 5,
        ),
        Student(
          name: 'Juan',
          isSelected: false.obs,
          section: 'sección1',
          hours: 2,
        ),
        Student(
          name: 'Santiago4',
          isSelected: false.obs,
          section: 'sección11',
          hours: 3,
        ),
        Student(
          name: 'Santiago5',
          isSelected: false.obs,
          section: 'sección12',
          hours: 2,
        ),
      ],
    ),
    Play(
      playName: 'Obra 2',
      students: [
        Student(
          name: 'Santiago3',
          isSelected: false.obs,
          section: 'sección10',
          hours: 4,
        ),
        Student(
          name: 'Camilo',
          isSelected: false.obs,
          section: 'sección2',
          hours: 3,
        ),
        Student(
          name: 'Laura',
          isSelected: false.obs,
          section: 'sección3',
          hours: 4,
        ),
        Student(
          name: 'Santiago2',
          isSelected: false.obs,
          section: 'sección9',
          hours: 13,
        ),
      ],
    ),
    Play(
      playName: 'Obra 3',
      students: [
        Student(
          name: 'María',
          isSelected: false.obs,
          section: 'sección4',
          hours: 7,
        ),
        Student(
          name: 'Valentina',
          isSelected: false.obs,
          section: 'sección5',
          hours: 8,
        ),
      ],
    ),
    Play(
      playName: 'Obra 4',
      students: [
        Student(
          name: 'Caterina',
          isSelected: false.obs,
          section: 'sección6',
          hours: 10,
        ),
        Student(
          name: 'Giovanni',
          isSelected: false.obs,
          section: 'sección7',
          hours: 14,
        ),
        Student(
          name: 'Santiago1',
          isSelected: false.obs,
          section: 'sección8',
          hours: 21,
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

  generateLiquidation() async {
    await generatePDF();
  }

  generatePDF() async {
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
                'Liquidación de viáticos de los estudiantes de la obra\n\n\n'
                'Titulo de la Obra,\n'
                'Fecha inicio:  \n'
                'Fecha fin:\n'
                'Cuerpo: la lista de estudiantes (nombres completos y cédulas, correos y'
                'códigos) con su correspondiente número de sesiones y horas en las que'
                'participó y el período de tiempo en que participó\n\n\n'
                'Firma El nombre completo del docente, la cédula y la facultad a la'
                'que pertenece'
                '• Se coloca la obra como inactiva.',
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
      ..download = 'Liquidacion.pdf';
    html.document.body!.children.add(anchor);
    anchor.click();
  }
}
