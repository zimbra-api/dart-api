import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:zimbra_api/src/upload/attachment.dart';
import 'package:zimbra_api/src/upload/client.dart';
import 'package:zimbra_api/src/upload/request.dart';

void main() {
  final faker = Faker();

  group('Zimbra api tests', () {
    test('Account api test', () {});

    test('Mail api test', () {});

    test('Upload api test', (() {
      final attachmentId = faker.guid.guid();
      final contentType = faker.lorem.word();
      final fileName = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);

      final domain = faker.internet.domainName();
      final requestId = faker.guid.guid();
      final authToken = faker.guid.guid();
      final files = [
        http.MultipartFile.fromString('file_01', faker.randomGenerator.string(100), filename: 'file_01.txt'),
        http.MultipartFile.fromString('file_02', faker.randomGenerator.string(100), filename: 'file_02.txt'),
      ];

      final client = Client(domain);
      final request = Request(requestId, authToken, files);
      client.upload(request);
      expect(client.multipartRequest.headers['user-agent'], Client.userAgent);
      expect(client.multipartRequest.headers['cookie'], request.authTokenCookie);
      expect(client.multipartRequest.fields['requestId'], requestId);
      expect(client.multipartRequest.files, files);

      final uri = client.multipartRequest.url;
      expect(uri.authority, domain);
      expect(uri.path, Client.servicePath);
      expect(uri.query, 'fmt=${Uri.encodeQueryComponent(Client.queryFormat)}');

      final content =
          '200,"$requestId",[{"aid":"$attachmentId","ct":"$contentType","filename":"$fileName","s":$size}]';

      final attachments = Client.jsonDecode(content).map((data) => Attachment.fromMap(data)).toList();
      expect(attachments.first.attachmentId, attachmentId);
      expect(attachments.first.contentType, contentType);
      expect(attachments.first.fileName, fileName);
      expect(attachments.first.size, size);
    }));
  });
}
