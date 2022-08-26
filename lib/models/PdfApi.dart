// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// class PdfApi {
//   static Future<File> saveDocument({
//   required String name,
//     required Document pdf,
// }) async {
//     final bytes = await pdf.save();
//
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');
//
//     await file.writeAsBytes(bytes);
//
//     return file;
//
//   }
// }