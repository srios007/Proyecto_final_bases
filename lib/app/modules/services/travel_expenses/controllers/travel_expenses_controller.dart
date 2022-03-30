import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class TravelExpensesController extends GetxController {
  RxBool condition = true.obs;
  RxBool isLoading = false.obs;
  RxBool isActive = false.obs;
  RxBool firstPlay = true.obs;
  List<Student> students = [
    Student(
      id: '1010',
      email: 'Santiago@gmail.com',
      name: 'Santiago Rios',
      section: 'Intro',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 2,
      hours: 2,
      isSelected: false.obs,
    ),
    Student(
      id: '2124',
      email: 'jorge@gmail.com',
      name: 'Jorge Bohórquez',
      section: 'Intermedio',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 3,
      hours: 1,
      isSelected: false.obs,
    ),
    Student(
      id: '3453',
      email: 'jmostosq@gmail.com',
      name: 'Juan Manuel Ostos',
      section: 'Final',
      period: '27-FEB-22 - 05-MAR-22',
      sessions: 4,
      hours: 3,
      isSelected: false.obs,
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

  List<String> names = [];
  generateLiquidation() async {
    await generatePDF();
  }

  addStudents() async {
    for (int i = 0; i < students.length; i++) {
      names.add(
          'nombre: ${students[i].name}, email: ${students[i].email}, id: ${students[i].id}, # sesiones ${students[i].sessions}');
    }
  }

  generatePDF() async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.nunitoExtraLight();
    await addStudents();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'Decanatura de la Facultad de Artes\n\n\n'
                'Liquidación de viáticos de los estudiantes de la obra de teatro\n\n\n'
                'Titulo de la Obra: El sueño de una noche de verano\n'
                'Fecha inicio: 2022-02-26  \n'
                'Fecha fin: 2022-03-05  \n'
                'Cuerpo: la lista de estudiantes (nombres completos y cédulas, correos y'
                'códigos) con su correspondiente número de sesiones y horas en las que'
                'participó y el período de tiempo en que participó\n\n\n'
                '- ${names[0]}\n'
                '- ${names[1]}\n'
                '- ${names[2]}\n'
                'Santiago Rios, 1010119455, Facultad de ingeniería',
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
