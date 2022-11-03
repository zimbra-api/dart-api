import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/enable_shared_reminder_envelope.dart';
import 'package:zimbra_api/src/mail/message/enable_shared_reminder_request.dart';
import 'package:zimbra_api/src/mail/message/enable_shared_reminder_response.dart';
import 'package:zimbra_api/src/mail/type/shared_reminder_mount.dart';

void main() {
  final faker = Faker();

  group('Enable shared reminder tests', (() {
    test('Enable shared reminder request', (() {
      final id = faker.guid.guid();
      final showReminders = faker.randomGenerator.boolean();
      final request = EnableSharedReminderRequest(SharedReminderMount(id, showReminders: showReminders));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'EnableSharedReminderRequest': {
            '_jsns': 'urn:zimbraMail',
            'link': {
              'id': id,
              'reminder': showReminders,
            },
          }
        },
      });
    }));

    test('Enable shared reminder response', (() {
      final data = {
        'Body': {
          'EnableSharedReminderResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = EnableSharedReminderEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<EnableSharedReminderResponse>());
    }));
  }));
}
