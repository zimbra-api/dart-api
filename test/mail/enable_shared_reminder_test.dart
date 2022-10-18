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
      expect(request.getEnvelope().toJson(), {
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
      final json = {
        'Body': {
          'EnableSharedReminderResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = EnableSharedReminderEnvelope.fromJson(json);
      expect(envelope.enableSharedReminderBody.enableSharedReminderResponse, isNotNull);
      expect(envelope.enableSharedReminderBody.enableSharedReminderResponse, isA<EnableSharedReminderResponse>());
    }));
  }));
}
