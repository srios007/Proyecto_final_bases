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
    Student(name: 'Santiago', isSelected: false.obs),
    Student(name: 'Juan', isSelected: false.obs),
    Student(name: 'Camilo', isSelected: false.obs),
    Student(name: 'Laura', isSelected: false.obs),
    Student(name: 'María', isSelected: false.obs),
    Student(name: 'Valentina', isSelected: false.obs),
    Student(name: 'Caterina', isSelected: false.obs),
    Student(name: 'Giovanni', isSelected: false.obs),
    Student(name: 'Santiago1', isSelected: false.obs),
    Student(name: 'Santiago2', isSelected: false.obs),
    Student(name: 'Santiago3', isSelected: false.obs),
    Student(name: 'Santiago4', isSelected: false.obs),
    Student(name: 'Santiago5', isSelected: false.obs),
  ];
    RxString play = "obra1".obs;

  @override
  void onInit() {
    super.onInit();
  }


  generateLiquidation() async {
    await generatePDF();
  }
  final List<String> plays = [
    "obra1",
    "obra2",
    "obra3",
    "obra4",
    "obra5",
    "obra6",
    "obra7",
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
