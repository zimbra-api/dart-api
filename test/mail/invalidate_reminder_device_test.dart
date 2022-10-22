import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/invalidate_reminder_device_envelope.dart';
import 'package:zimbra_api/src/mail/message/invalidate_reminder_device_request.dart';
import 'package:zimbra_api/src/mail/message/invalidate_reminder_device_response.dart';

void main() {
  final faker = Faker();

  group('Invalidate reminder device tests', (() {
    test('Invalidate reminder device request', (() {
      final address = faker.internet.email();
      final request = InvalidateReminderDeviceRequest(address);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'InvalidateReminderDeviceRequest': {
            '_jsns': 'urn:zimbraMail',
            'a': address,
          }
        },
      });
    }));

    test('Invalidate reminder device response', (() {
      final json = {
        'Body': {
          'InvalidateReminderDeviceResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = InvalidateReminderDeviceEnvelope.fromJson(json);
      final response = envelope.invalidateReminderDeviceBody.invalidateReminderDeviceResponse;
      expect(response, isNotNull);
      expect(response, isA<InvalidateReminderDeviceResponse>());
    }));
  }));
}
