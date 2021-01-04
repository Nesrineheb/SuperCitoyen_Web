import 'dart:async';
import 'dart:convert';
import 'dart:js' as js;

class SaveFilehelper {
  static Future<void> saveAndOpenFile(List<int> bytes) async {
    js.context['pdfBytes'] = base64.encode(bytes);
    js.context['fileName'] = 'SuperCitoyen.pdf';
    Timer.run(() {
      js.context.callMethod('download');
    });
  }
}
