import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_envelope.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_request.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_response.dart';

void main() {
  group('Begin tracking IMAP tests', (() {
    test('Begin tracking IMAP request', (() {
      final request = BeginTrackingIMAPRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'BeginTrackingIMAPRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Begin tracking IMAP response', (() {
      final json = {
        'Body': {
          'BeginTrackingIMAPResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = BeginTrackingIMAPEnvelope.fromJson(json);
      expect(envelope.beginTrackingIMAPBody.beginTrackingIMAPResponse, isNotNull);
      expect(envelope.beginTrackingIMAPBody.beginTrackingIMAPResponse, isA<BeginTrackingIMAPResponse>());
    }));
  }));
}
