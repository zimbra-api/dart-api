import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_envelope.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_request.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_response.dart';

void main() {
  group('Reset recent message count tests', (() {
    test('Reset recent message count request', (() {
      final request = ResetRecentMessageCountRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ResetRecentMessageCountRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Reset recent message count response', (() {
      final data = {
        'Body': {
          'ResetRecentMessageCountResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ResetRecentMessageCountEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<ResetRecentMessageCountResponse>());
    }));
  }));
}
