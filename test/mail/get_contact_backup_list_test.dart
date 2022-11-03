import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_contact_backup_list_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_contact_backup_list_request.dart';
import 'package:zimbra_api/src/mail/message/get_contact_backup_list_response.dart';

void main() {
  final faker = Faker();

  group('Get contact backup list tests', (() {
    test('Get contact backup list request', (() {
      final request = GetContactBackupListRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetContactBackupListRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get contact backup list response', (() {
      final backup1 = faker.lorem.word();
      final backup2 = faker.lorem.word();
      final data = {
        'Body': {
          'GetContactBackupListResponse': {
            '_jsns': 'urn:zimbraMail',
            'backups': {
              'backup': [
                {
                  '_content': backup1,
                },
                {
                  '_content': backup2,
                },
              ]
            },
          }
        }
      };
      final envelope = GetContactBackupListEnvelope.fromMap(data);
      final response = envelope.body.response as GetContactBackupListResponse;
      expect(response.backups.first, backup1);
      expect(response.backups.last, backup2);
    }));
  }));
}
