import 'package:http/http.dart' as http;
import 'package:zimbra_api/src/upload/client.dart';
import 'package:zimbra_api/src/upload/request.dart';

void main() {
  final files = [
    http.MultipartFile.fromString('file_01', 'file_01', filename: 'file_01.txt'),
    http.MultipartFile.fromString('file_02', 'file_01', filename: 'file_02.txt'),
  ];

  final client = Client('mail.domain.com');
  client.upload(Request('requestId', 'authToken', files)).then((attachments) {
    for (final attachment in attachments) {
      print('Attachment id: ${attachment.attachmentId}');
      print('File name: ${attachment.fileName}');
      print('Content type: ${attachment.contentType}');
      print('Size: ${attachment.size}');
    }
  });
}
