import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/get_mini_cal_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_mini_cal_request.dart';
import 'package:zimbra_api/src/mail/message/get_mini_cal_response.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';

void main() {
  final faker = Faker();

  group('Get mini calendar tests', (() {
    test('Get mini calendar request', (() {
      final id = faker.guid.guid();
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final request = GetMiniCalRequest(
        startTime,
        endTime,
        folders: [Id(id: id)],
        timezone: CalTZInfo(
          id,
          tzStdOffset,
          tzDayOffset,
          standardTzOnset: TzOnsetInfo(
            month,
            hour,
            minute,
            second,
            dayOfMonth: dayOfMonth,
            week: week,
            dayOfWeek: dayOfWeek,
          ),
          daylightTzOnset: TzOnsetInfo(
            month,
            hour,
            minute,
            second,
            dayOfMonth: dayOfMonth,
            week: week,
            dayOfWeek: dayOfWeek,
          ),
          standardTZName: standardTZName,
          daylightTZName: daylightTZName,
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetMiniCalRequest': {
            '_jsns': 'urn:zimbraMail',
            's': startTime,
            'e': endTime,
            'folder': [
              {
                'id': id,
              }
            ],
            'tz': {
              'id': id,
              'stdoff': tzStdOffset,
              'dayoff': tzDayOffset,
              'standard': {
                'mon': month,
                'hour': hour,
                'min': minute,
                'sec': second,
                'mday': dayOfMonth,
                'week': week,
                'wkday': dayOfWeek,
              },
              'daylight': {
                'mon': month,
                'hour': hour,
                'min': minute,
                'sec': second,
                'mday': dayOfMonth,
                'week': week,
                'wkday': dayOfWeek,
              },
              'stdname': standardTZName,
              'dayname': daylightTZName,
            }
          }
        },
      });
    }));

    test('Get mini calendar response', (() {
      final busyDate = faker.date.dateTime().toString();
      final id = faker.guid.guid();
      final code = faker.lorem.word();
      final errorMessage = faker.lorem.word();

      final data = {
        'Body': {
          'GetMiniCalResponse': {
            '_jsns': 'urn:zimbraMail',
            'date': [
              {'_content': busyDate}
            ],
            'error': [
              {
                'id': id,
                'code': code,
                '_content': errorMessage,
              }
            ],
          }
        }
      };
      final envelope = GetMiniCalEnvelope.fromMap(data);
      final response = envelope.body.response as GetMiniCalResponse;
      expect(response.busyDates.first, busyDate);

      final error = response.errors.first;
      expect(error.id, id);
      expect(error.code, code);
      expect(error.errorMessage, errorMessage);
    }));
  }));
}
