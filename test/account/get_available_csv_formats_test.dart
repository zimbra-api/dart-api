import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_available_csv_formats_envelope.dart';
import 'package:zimbra_api/src/account/message/get_available_csv_formats_request.dart';

void main() {
  final faker = Faker();

  group('Get available csv formats tests', (() {
    test('Get available csv formats request', (() {
      final request = GetAvailableCsvFormatsRequest();

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetAvailableCsvFormatsRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get available csv formats response', (() {
      final name = faker.lorem.word();
      final json = {
        'Body': {
          'GetAvailableCsvFormatsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'csv': [
              {
                'name': name,
              }
            ],
          },
        },
      };
      final envelope = GetAvailableCsvFormatsEnvelope.fromJson(json);
      final response = envelope.getAvailableCsvFormatsBody.getAvailableCsvFormatsResponse;
      final csv = response!.csvFormats.first;

      expect(csv.name, name);
    }));
  }));
}
