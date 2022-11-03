import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_envelope.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_request.dart';
import 'package:zimbra_api/src/mail/message/begin_tracking_imap_response.dart';

void main() {
  group('Begin tracking IMAP tests', (() {
    test('Begin tracking IMAP request', (() {
      final request = BeginTrackingIMAPRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'BeginTrackingIMAPRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Begin tracking IMAP response', (() {
      final data = {
        'Body': {
          'BeginTrackingIMAPResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = BeginTrackingIMAPEnvelope.fromMap(data);
      expect(envelope.beginTrackingIMAPBody.beginTrackingIMAPResponse, isNotNull);
      expect(envelope.beginTrackingIMAPBody.beginTrackingIMAPResponse, isA<BeginTrackingIMAPResponse>());
    }));
  }));
}
