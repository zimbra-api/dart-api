import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/send_delivery_report_envelope.dart';
import 'package:zimbra_api/src/mail/message/send_delivery_report_request.dart';
import 'package:zimbra_api/src/mail/message/send_delivery_report_response.dart';

void main() {
  final faker = Faker();

  group('Send delivery report tests', (() {
    test('Send delivery report request', (() {
      final messageId = faker.guid.guid();

      final request = SendDeliveryReportRequest(messageId);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SendDeliveryReportRequest': {
            '_jsns': 'urn:zimbraMail',
            'mid': messageId,
          }
        },
      });
    }));

    test('Send delivery report response', (() {
      final data = {
        'Body': {
          'SendDeliveryReportResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SendDeliveryReportEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<SendDeliveryReportResponse>());
    }));
  }));
}
