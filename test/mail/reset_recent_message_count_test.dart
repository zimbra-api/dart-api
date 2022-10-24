import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_envelope.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_request.dart';
import 'package:zimbra_api/src/mail/message/reset_recent_message_count_response.dart';

void main() {
  group('Reset recent message count tests', (() {
    test('Reset recent message count request', (() {
      final request = ResetRecentMessageCountRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ResetRecentMessageCountRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Reset recent message count response', (() {
      final json = {
        'Body': {
          'ResetRecentMessageCountResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ResetRecentMessageCountEnvelope.fromJson(json);
      final response = envelope.resetRecentMessageCountBody.resetRecentMessageCountResponse;
      expect(response, isNotNull);
      expect(response, isA<ResetRecentMessageCountResponse>());
    }));
  }));
}
