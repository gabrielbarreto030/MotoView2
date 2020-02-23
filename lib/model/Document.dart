
import 'package:pdf/pdf.dart';




import 'package:pdf/widgets.dart' as pdf;
import 'package:pdf/widgets.dart';



List<int> buildPdf(PdfPageFormat format)  {
    final Document doc = Document();

    doc.addPage(
      pdf.Page(
        pageFormat: format,
        build: (pdf.Context context) {
          return pdf.ConstrainedBox(
            constraints: const pdf.BoxConstraints.expand(),
            child: pdf.FittedBox(
              child: pdf.Text(
                'Hello World',
              ),
            ),
          );
        },
      ),
    );
    
    return doc.save();
  }



