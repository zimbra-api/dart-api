import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/mail/message/add_appointment_invite_response.dart';
import 'package:zimbra_api/src/mail/type/msg.dart';
import 'package:zimbra_api/src/mail_api.dart';

void main() {
  final faker = Faker();

  group('Mail api tests', (() {
    test('Add pppointment invite', (() async {
      final api = MailApi(
        faker.internet.domainName(),
        httpClientFactory: () => MockClient((request) async {
          return http.Response(
              jsonEncode({
                'Body': {
                  'AddAppointmentInviteResponse': {
                    '_jsns': 'urn:zimbraMail',
                  },
                },
              }),
              200);
        }),
      );

      final response = await api.addAppointmentInvite(ParticipationStatus.accept, Msg());
      expect(response, isA<AddAppointmentInviteResponse>());
    }));
  }));
}
