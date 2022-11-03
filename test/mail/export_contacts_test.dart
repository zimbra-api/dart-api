import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/export_contacts_envelope.dart';
import 'package:zimbra_api/src/mail/message/export_contacts_request.dart';

void main() {
  final faker = Faker();

  group('Export contacts tests', (() {
    test('Export contacts request', (() {
      final contentType = faker.lorem.word();
      final folderId = faker.guid.guid();
      final csvFormat = faker.lorem.word();
      final csvLocale = faker.lorem.word();
      final csvDelimiter = faker.lorem.word();

      final request = ExportContactsRequest(
        contentType,
        folderId: folderId,
        csvFormat: csvFormat,
        csvLocale: csvLocale,
        csvDelimiter: csvDelimiter,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ExportContactsRequest': {
            '_jsns': 'urn:zimbraMail',
            'ct': contentType,
            'l': folderId,
            'csvfmt': csvFormat,
            'csvlocale': csvLocale,
            'csvsep': csvDelimiter,
          }
        },
      });
    }));

    test('Export contacts response', (() {
      final content = faker.lorem.word();
      final data = {
        'Body': {
          'ExportContactsResponse': {
            '_jsns': 'urn:zimbraMail',
            'content': {'_content': content},
          }
        }
      };
      final envelope = ExportContactsEnvelope.fromMap(data);
      final response = envelope.exportContactsBody.exportContactsResponse!;
      expect(response.content, content);
    }));
  }));
}
