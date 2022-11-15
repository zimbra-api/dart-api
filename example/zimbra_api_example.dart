import 'package:zimbra_api/zimbra_api.dart';

void main() {
  final api = MailApi('mail.domain.com');
  api.authByAccountName('name@domain.com', 'password').then((response) {
    if (response != null) {
      final query = 'in:inbox has:attachment';
      api.search(query: query, inDumpster: true, searchTypes: 'message').then((response) {
        if (response != null) {
          for (final message in response.messageHits) {
            print(message.subject);
          }
        }
      });
    }
  });
}
