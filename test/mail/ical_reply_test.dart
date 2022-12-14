import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/ical_reply_envelope.dart';
import 'package:zimbra_api/src/mail/message/ical_reply_request.dart';
import 'package:zimbra_api/src/mail/message/ical_reply_response.dart';

void main() {
  final faker = Faker();

  group('iCalendar reply tests', (() {
    test('iCalendar reply request', (() {
      final ical = faker.lorem.word();
      final request = ICalReplyRequest(ical);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ICalReplyRequest': {
            '_jsns': 'urn:zimbraMail',
            'ical': {'_content': ical},
          }
        },
      });
    }));

    test('iCalendar reply response', (() {
      final data = {
        'Body': {
          'ICalReplyResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ICalReplyEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<ICalReplyResponse>());
    }));
  }));
}
