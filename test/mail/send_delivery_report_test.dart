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
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SendDeliveryReportRequest': {
            '_jsns': 'urn:zimbraMail',
            'mid': messageId,
          }
        },
      });
    }));

    test('Send delivery report response', (() {
      final json = {
        'Body': {
          'SendDeliveryReportResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SendDeliveryReportEnvelope.fromJson(json);
      final response = envelope.sendDeliveryReportBody.sendDeliveryReportResponse;
      expect(response, isNotNull);
      expect(response, isA<SendDeliveryReportResponse>());
    }));
  }));
}
