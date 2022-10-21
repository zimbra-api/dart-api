import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/empty_dumpster_envelope.dart';
import 'package:zimbra_api/src/mail/message/empty_dumpster_request.dart';
import 'package:zimbra_api/src/mail/message/empty_dumpster_response.dart';

void main() {
  group('Empty dumpster tests', (() {
    test('Empty dumpster request', (() {
      final request = EmptyDumpsterRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'EmptyDumpsterRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Empty dumpster response', (() {
      final json = {
        'Body': {
          'EmptyDumpsterResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = EmptyDumpsterEnvelope.fromJson(json);
      expect(envelope.emptyDumpsterBody.emptyDumpsterResponse, isNotNull);
      expect(envelope.emptyDumpsterBody.emptyDumpsterResponse, isA<EmptyDumpsterResponse>());
    }));
  }));
}