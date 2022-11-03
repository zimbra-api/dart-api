import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/ranking_action_op.dart';
import 'package:zimbra_api/src/mail/message/ranking_action_envelope.dart';
import 'package:zimbra_api/src/mail/message/ranking_action_request.dart';
import 'package:zimbra_api/src/mail/message/ranking_action_response.dart';
import 'package:zimbra_api/src/mail/type/ranking_action_spec.dart';

void main() {
  final faker = Faker();

  group('Ranking action tests', (() {
    test('Ranking action request', (() {
      final email = faker.internet.email();

      final request = RankingActionRequest(RankingActionSpec(
        operation: RankingActionOp.reset,
        email: email,
      ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'RankingActionRequest': {
            '_jsns': 'urn:zimbraMail',
            'action': {
              'op': RankingActionOp.reset.name,
              'email': email,
            },
          }
        },
      });
    }));

    test('Ranking action response', (() {
      final data = {
        'Body': {
          'RankingActionResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = RankingActionEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<RankingActionResponse>());
    }));
  }));
}
