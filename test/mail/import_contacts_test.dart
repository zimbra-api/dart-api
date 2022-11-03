import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/import_contacts_envelope.dart';
import 'package:zimbra_api/src/mail/message/import_contacts_request.dart';
import 'package:zimbra_api/src/mail/message/import_contacts_response.dart';
import 'package:zimbra_api/src/mail/type/content.dart';

void main() {
  final faker = Faker();

  group('Import contacts tests', (() {
    test('Import contacts request', (() {
      final attachUploadId = faker.guid.guid();
      final value = faker.lorem.word();
      final contentType = 'text/csv';
      final folderId = faker.guid.guid();
      final csvFormat = faker.lorem.word();
      final csvLocale = faker.lorem.word();

      final request = ImportContactsRequest(
        Content(attachUploadId: attachUploadId, value: value),
        contentType: contentType,
        folderId: folderId,
        csvFormat: csvFormat,
        csvLocale: csvLocale,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ImportContactsRequest': {
            '_jsns': 'urn:zimbraMail',
            'content': {
              'aid': attachUploadId,
              '_content': value,
            },
            'ct': contentType,
            'l': folderId,
            'csvfmt': csvFormat,
            'csvlocale': csvLocale,
          }
        },
      });
    }));

    test('Import contacts response', (() {
      final listOfCreatedIds = [
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100)
      ].join(',');
      final numImported = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'ImportContactsResponse': {
            '_jsns': 'urn:zimbraMail',
            'cn': {
              'ids': listOfCreatedIds,
              'n': numImported,
            }
          }
        }
      };
      final envelope = ImportContactsEnvelope.fromMap(data);
      final response = envelope.body.response as ImportContactsResponse;
      final contact = response.contact!;
      expect(contact.listOfCreatedIds, listOfCreatedIds);
      expect(contact.numImported, numImported);
    }));
  }));
}
