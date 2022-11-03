import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/record_imap_session_envelope.dart';
import 'package:zimbra_api/src/mail/message/record_imap_session_request.dart';
import 'package:zimbra_api/src/mail/message/record_imap_session_response.dart';

void main() {
  final faker = Faker();

  group('Record IMAP session tests', (() {
    test('Record IMAP session request', (() {
      final folderId = faker.guid.guid();

      final request = RecordIMAPSessionRequest(folderId);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'RecordIMAPSessionRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': folderId,
          }
        },
      });
    }));

    test('Record IMAP session response', (() {
      final lastItemId = faker.randomGenerator.integer(100);
      final folderUuid = faker.guid.guid();
      final data = {
        'Body': {
          'RecordIMAPSessionResponse': {
            '_jsns': 'urn:zimbraMail',
            'id': lastItemId,
            'luuid': folderUuid,
          }
        }
      };
      final envelope = RecordIMAPSessionEnvelope.fromMap(data);
      final response = envelope.body.response as RecordIMAPSessionResponse;
      expect(response.lastItemId, lastItemId);
      expect(response.folderUuid, folderUuid);
    }));
  }));
}
