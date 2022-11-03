import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_ical_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_ical_request.dart';

void main() {
  final faker = Faker();

  group('Get iCalendar tests', (() {
    test('Get iCalendar request', (() {
      final id = faker.guid.guid();
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;

      final request = GetICalRequest(id: id, startTime: startTime, endTime: endTime);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetICalRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
            's': startTime,
            'e': endTime,
          }
        },
      });
    }));

    test('Get iCalendar response', (() {
      final id = faker.guid.guid();
      final ical = faker.lorem.word();
      final data = {
        'Body': {
          'GetICalResponse': {
            '_jsns': 'urn:zimbraMail',
            'ical': {
              'id': id,
              '_content': ical,
            },
          }
        }
      };
      final envelope = GetICalEnvelope.fromMap(data);
      final response = envelope.getICalBody.getICalResponse!;
      final content = response.content!;

      expect(content.id, id);
      expect(content.ical, ical);
    }));
  }));
}
