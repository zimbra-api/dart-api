import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/tz_onset_info.dart';
import 'package:zimbra_api/src/mail/message/complete_task_instance_envelope.dart';
import 'package:zimbra_api/src/mail/message/complete_task_instance_request.dart';
import 'package:zimbra_api/src/mail/message/complete_task_instance_response.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/dt_time_info.dart';

void main() {
  final faker = Faker();

  group('Complete task instance tests', (() {
    test('Complete task instance request', (() {
      final id = faker.guid.guid();
      final dateTime = faker.date.dateTime().toString();
      final timezone = faker.lorem.word();
      final utcTime = faker.date.dateTime().millisecondsSinceEpoch;
      final tzStdOffset = faker.date.dateTime().minute;
      final tzDayOffset = faker.date.dateTime().minute;
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final request = CompleteTaskInstanceRequest(
        id,
        DtTimeInfo(
          dateTime: dateTime,
          timezone: timezone,
          utcTime: utcTime,
        ),
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
          'CompleteTaskInstanceRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
            'exceptId': {
              'd': dateTime,
              'tz': timezone,
              'u': utcTime,
            },
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
            },
          }
        },
      });
    }));

    test('Complete task instance response', (() {
      final data = {
        'Body': {
          'CompleteTaskInstanceResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = CompleteTaskInstanceEnvelope.fromMap(data);
      expect(envelope.completeTaskInstanceBody.completeTaskInstanceResponse, isNotNull);
      expect(envelope.completeTaskInstanceBody.completeTaskInstanceResponse, isA<CompleteTaskInstanceResponse>());
    }));
  }));
}
