import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:proyecto_final_bases/app/models/student.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CertificatesDetailController extends GetxController {
  TextEditingController nameController = TextEditingController();

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
  RxString play = "Romeo y Julieta".obs;

  @override
  void onInit() {
    super.onInit();
  }

  generateLiquidation() async {
    await generatePDF();
  }

  final List<String> plays = [
    "Romeo y Julieta",
    "La Celestina",
    "Don Juan Tenorio",
  ];

  List<DropdownMenuItem<String>> playsType() {
    return plays.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void chancgeTypeStreet(String? selected) {
    play.value = selected!;
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
                'Certificado de participación\n\n\n'
                'El estudiante: ${students[0].name}, participó en la obra: ${play.value}, con un total de horas de: ${students[0].hours}\n',
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
