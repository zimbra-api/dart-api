import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/import_appointments_envelope.dart';
import 'package:zimbra_api/src/mail/message/import_appointments_request.dart';
import 'package:zimbra_api/src/mail/message/import_appointments_response.dart';
import 'package:zimbra_api/src/mail/type/content_spec.dart';

void main() {
  final faker = Faker();

  group('Import appointments tests', (() {
    test('Import appointments request', (() {
      final attachmentId = faker.guid.guid();
      final messageId = faker.guid.guid();
      final part = faker.lorem.word();
      final text = faker.lorem.word();
      final contentType = 'text/calendar';
      final folderId = faker.guid.guid();

      final request = ImportAppointmentsRequest(
        ContentSpec(
          attachmentId: attachmentId,
          messageId: messageId,
          part: part,
          text: text,
        ),
        contentType: contentType,
        folderId: folderId,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ImportAppointmentsRequest': {
            '_jsns': 'urn:zimbraMail',
            'content': {
              'aid': attachmentId,
              'mid': messageId,
              'part': part,
              '_content': text,
            },
            'ct': contentType,
            'l': folderId,
          }
        },
      });
    }));

    test('Import appointments response', (() {
      final ids = [
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100),
        faker.randomGenerator.integer(100)
      ].join(',');
      final num = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'ImportAppointmentsResponse': {
            '_jsns': 'urn:zimbraMail',
            'ids': ids,
            'n': num,
          }
        }
      };
      final envelope = ImportAppointmentsEnvelope.fromMap(data);
      final response = envelope.body.response as ImportAppointmentsResponse;
      expect(response.ids, ids);
      expect(response.num, num);
    }));
  }));
}
