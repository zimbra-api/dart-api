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
    for (var attachment in attachments) {
      print(
          'attachmentId: ${attachment.attachmentId}, fileName: ${attachment.fileName}, contentType: ${attachment.contentType}, size: ${attachment.size}');
    }
  });
}
