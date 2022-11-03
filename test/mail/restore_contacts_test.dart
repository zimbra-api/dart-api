import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/restore_resolve.dart';
import 'package:zimbra_api/src/mail/message/restore_contacts_envelope.dart';
import 'package:zimbra_api/src/mail/message/restore_contacts_request.dart';
import 'package:zimbra_api/src/mail/message/restore_contacts_response.dart';

void main() {
  final faker = Faker();

  group('Restore contacts tests', (() {
    test('Restore contacts request', (() {
      final contactsBackupFileName = faker.lorem.word();

      final request = RestoreContactsRequest(contactsBackupFileName, resolve: RestoreResolve.reset);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'RestoreContactsRequest': {
            '_jsns': 'urn:zimbraMail',
            'contactsBackupFileName': contactsBackupFileName,
            'resolve': RestoreResolve.reset.name,
          }
        },
      });
    }));

    test('Restore contacts response', (() {
      final data = {
        'Body': {
          'RestoreContactsResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = RestoreContactsEnvelope.fromMap(data);
      final response = envelope.restoreContactsBody.restoreContactsResponse;
      expect(response, isNotNull);
      expect(response, isA<RestoreContactsResponse>());
    }));
  }));
}
