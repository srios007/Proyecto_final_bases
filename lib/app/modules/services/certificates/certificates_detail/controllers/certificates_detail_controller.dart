import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:proyecto_final_bases/app/models/search_model.dart';
import 'package:proyecto_final_bases/app/utils/utils.dart';

import '../../../../../models/providers/search_provider.dart';

class CertificatesDetailController extends GetxController {
  TextEditingController codeController = TextEditingController();
  Search? search = Search();
  RxBool isLoading = false.obs;
  RxBool empty = true.obs;

  generateCertificate() async {
    await generatePDF();
  }

  searchStudent() async {
    isLoading.value = true;
    search = await searchProvider.getEstudiante(codeController.text);
    if (search!.items!.isEmpty) {
      empty = true.obs;
    } else {
      empty = false.obs;
    }
    isLoading.value = false;
  }

  generatePDF() async {
    if (search!.items!.isNotEmpty) {
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
                  'El estudiante: ${search!.items![0].nombreestudiante} ${search!.items![0].apellidoestudiante}, participó en la obra: ${search!.items![0].titulo}, interpretndo el personje de: ${search!.items![0].nompersonaje}\n',
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
    } else {
      customDialogs.showMessageDialog(
        Get.context,
        "Busca un estudiante primero",
        "Tu pdf fue generdo con éxito",
      );
    }
  }
}
