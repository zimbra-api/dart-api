import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/end_session_envelope.dart';
import 'package:zimbra_api/src/account/message/end_session_request.dart';
import 'package:zimbra_api/src/account/message/end_session_response.dart';

void main() {
  final faker = Faker();

  group('End session tests', (() {
    test('End session request', (() {
      final logoff = faker.randomGenerator.boolean();
      final clearAllSoapSessions = faker.randomGenerator.boolean();
      final excludeCurrentSession = faker.randomGenerator.boolean();
      final sessionId = faker.guid.guid();

      final request = EndSessionRequest(
        logoff: logoff,
        clearAllSoapSessions: clearAllSoapSessions,
        excludeCurrentSession: excludeCurrentSession,
        sessionId: sessionId,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'EndSessionRequest': {
            '_jsns': 'urn:zimbraAccount',
            'logoff': logoff,
            'all': clearAllSoapSessions,
            'excludeCurrent': excludeCurrentSession,
            'sessionId': sessionId,
          }
        },
      });
    }));

    test('End session response', (() {
      final data = {
        'Body': {
          'EndSessionResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = EndSessionEnvelope.fromMap(data);
      expect(envelope.endSessionBody.endSessionResponse, isNotNull);
      expect(envelope.endSessionBody.endSessionResponse, isA<EndSessionResponse>());
    }));
  }));
}
