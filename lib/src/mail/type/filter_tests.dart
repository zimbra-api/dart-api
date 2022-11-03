// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/filter_condition.dart';

import 'address_book_test.dart';
import 'address_test.dart';
import 'attachment_test.dart';
import 'body_test.dart';
import 'bulk_test.dart';
import 'community_connections_test.dart';
import 'community_content_test.dart';
import 'community_requests_test.dart';
import 'contact_ranking_test.dart';
import 'conversation_test.dart';
import 'current_day_of_week_test.dart';
import 'current_time_test.dart';
import 'date_test.dart';
import 'envelope_test.dart';
import 'facebook_test.dart';
import 'flagged_test.dart';
import 'header_exists_test.dart';
import 'header_test.dart';
import 'importance_test.dart';
import 'invite_test.dart';
import 'linkedin_test.dart';
import 'list_test.dart';
import 'me_test.dart';
import 'mime_header_test.dart';
import 'size_test.dart';
import 'socialcast_test.dart';
import 'true_test.dart';
import 'twitter_test.dart';

class FilterTests {
  /// Condition - allof|anyof
  final FilterCondition condition;

  /// Address book filter tests
  final List<AddressBookTest> addressBookTests;

  /// Address filter tests
  final List<AddressTest> addressTests;

  /// Envelope filter tests
  final List<EnvelopeTest> envelopeTests;

  /// Attachment filter tests
  final List<AttachmentTest> attachmentTests;

  /// Body filter tests
  final List<BodyTest> bodyTests;

  /// Bulk filter tests
  final List<BulkTest> bulkTests;

  /// Contact ranking filter tests
  final List<ContactRankingTest> contactRankingTests;

  /// Conversation filter tests
  final List<ConversationTest> conversationTests;

  /// Current day of week filter tests
  final List<CurrentDayOfWeekTest> currentDayOfWeekTests;

  /// Current time filter tests
  final List<CurrentTimeTest> currentTimeTests;

  /// Date filter tests
  final List<DateTest> dateTests;

  /// Facebook filter tests
  final List<FacebookTest> facebookTests;

  /// Flagged filter tests
  final List<FlaggedTest> flaggedTests;

  /// Header exists filter tests
  final List<HeaderExistsTest> headerExistsTests;

  /// Header filter tests
  final List<HeaderTest> headerTests;

  /// Importance filter tests
  final List<ImportanceTest> importanceTests;

  /// Invite filter tests
  final List<InviteTest> inviteTests;

  /// LinkedIn filter tests
  final List<LinkedInTest> linkedinTests;

  /// List filter tests
  final List<ListTest> listTests;

  /// Me filter tests
  final List<MeTest> meTests;

  /// Mime header filter tests
  final List<MimeHeaderTest> mimeHeaderTests;

  /// Size filter tests
  final List<SizeTest> sizeTests;

  /// Socialcast filter tests
  final List<SocialcastTest> socialcastTests;

  /// True filter tests
  final List<TrueTest> trueTests;

  /// Twitter filter tests
  final List<TwitterTest> twitterTests;

  /// Community requests filter tests
  final List<CommunityRequestsTest> communityRequestsTests;

  /// Community content filter tests
  final List<CommunityContentTest> communityContentTests;

  /// Community connections filter tests
  final List<CommunityConnectionsTest> communityConnectionsTests;

  FilterTests(
      {this.condition = FilterCondition.allof,
      this.addressBookTests = const [],
      this.addressTests = const [],
      this.envelopeTests = const [],
      this.attachmentTests = const [],
      this.bodyTests = const [],
      this.bulkTests = const [],
      this.contactRankingTests = const [],
      this.conversationTests = const [],
      this.currentDayOfWeekTests = const [],
      this.currentTimeTests = const [],
      this.dateTests = const [],
      this.facebookTests = const [],
      this.flaggedTests = const [],
      this.headerExistsTests = const [],
      this.headerTests = const [],
      this.importanceTests = const [],
      this.inviteTests = const [],
      this.linkedinTests = const [],
      this.listTests = const [],
      this.meTests = const [],
      this.mimeHeaderTests = const [],
      this.sizeTests = const [],
      this.socialcastTests = const [],
      this.trueTests = const [],
      this.twitterTests = const [],
      this.communityRequestsTests = const [],
      this.communityContentTests = const [],
      this.communityConnectionsTests = const []});

  factory FilterTests.fromMap(Map<String, dynamic> data) => FilterTests(
        condition: FilterCondition.values.firstWhere(
          (condition) => condition.name == data['condition'],
          orElse: () => FilterCondition.allof,
        ),
        addressBookTests: data['addressBookTest'] is Iterable
            ? List.from(
                (data['addressBookTest'] as Iterable).map<AddressBookTest>((test) => AddressBookTest.fromMap(test)))
            : [],
        addressTests: data['addressTest'] is Iterable
            ? List.from((data['addressTest'] as Iterable).map<AddressTest>((test) => AddressTest.fromMap(test)))
            : [],
        envelopeTests: data['envelopeTest'] is Iterable
            ? List.from((data['envelopeTest'] as Iterable).map<EnvelopeTest>((test) => EnvelopeTest.fromMap(test)))
            : [],
        attachmentTests: data['attachmentTest'] is Iterable
            ? List.from(
                (data['attachmentTest'] as Iterable).map<AttachmentTest>((test) => AttachmentTest.fromMap(test)))
            : [],
        bodyTests: data['bodyTest'] is Iterable
            ? List.from((data['bodyTest'] as Iterable).map<BodyTest>((test) => BodyTest.fromMap(test)))
            : [],
        bulkTests: data['bulkTest'] is Iterable
            ? List.from((data['bulkTest'] as Iterable).map<BulkTest>((test) => BulkTest.fromMap(test)))
            : [],
        contactRankingTests: data['contactRankingTest'] is Iterable
            ? List.from((data['contactRankingTest'] as Iterable)
                .map<ContactRankingTest>((test) => ContactRankingTest.fromMap(test)))
            : [],
        conversationTests: data['conversationTest'] is Iterable
            ? List.from(
                (data['conversationTest'] as Iterable).map<ConversationTest>((test) => ConversationTest.fromMap(test)))
            : [],
        currentDayOfWeekTests: data['currentDayOfWeekTest'] is Iterable
            ? List.from((data['currentDayOfWeekTest'] as Iterable)
                .map<CurrentDayOfWeekTest>((test) => CurrentDayOfWeekTest.fromMap(test)))
            : [],
        currentTimeTests: data['currentTimeTest'] is Iterable
            ? List.from(
                (data['currentTimeTest'] as Iterable).map<CurrentTimeTest>((test) => CurrentTimeTest.fromMap(test)))
            : [],
        dateTests: data['dateTest'] is Iterable
            ? List.from((data['dateTest'] as Iterable).map<DateTest>((test) => DateTest.fromMap(test)))
            : [],
        facebookTests: data['facebookTest'] is Iterable
            ? List.from((data['facebookTest'] as Iterable).map<FacebookTest>((test) => FacebookTest.fromMap(test)))
            : [],
        flaggedTests: data['flaggedTest'] is Iterable
            ? List.from((data['flaggedTest'] as Iterable).map<FlaggedTest>((test) => FlaggedTest.fromMap(test)))
            : [],
        headerExistsTests: data['headerExistsTest'] is Iterable
            ? List.from(
                (data['headerExistsTest'] as Iterable).map<HeaderExistsTest>((test) => HeaderExistsTest.fromMap(test)))
            : [],
        headerTests: data['headerTest'] is Iterable
            ? List.from((data['headerTest'] as Iterable).map<HeaderTest>((test) => HeaderTest.fromMap(test)))
            : [],
        importanceTests: data['importanceTest'] is Iterable
            ? List.from(
                (data['importanceTest'] as Iterable).map<ImportanceTest>((test) => ImportanceTest.fromMap(test)))
            : [],
        inviteTests: data['inviteTest'] is Iterable
            ? List.from((data['inviteTest'] as Iterable).map<InviteTest>((test) => InviteTest.fromMap(test)))
            : [],
        linkedinTests: data['linkedinTest'] is Iterable
            ? List.from((data['linkedinTest'] as Iterable).map<LinkedInTest>((test) => LinkedInTest.fromMap(test)))
            : [],
        listTests: data['listTest'] is Iterable
            ? List.from((data['listTest'] as Iterable).map<ListTest>((test) => ListTest.fromMap(test)))
            : [],
        meTests: data['meTest'] is Iterable
            ? List.from((data['meTest'] as Iterable).map<MeTest>((test) => MeTest.fromMap(test)))
            : [],
        mimeHeaderTests: data['mimeHeaderTest'] is Iterable
            ? List.from(
                (data['mimeHeaderTest'] as Iterable).map<MimeHeaderTest>((test) => MimeHeaderTest.fromMap(test)))
            : [],
        sizeTests: data['sizeTest'] is Iterable
            ? List.from((data['sizeTest'] as Iterable).map<SizeTest>((test) => SizeTest.fromMap(test)))
            : [],
        socialcastTests: data['socialcastTest'] is Iterable
            ? List.from(
                (data['socialcastTest'] as Iterable).map<SocialcastTest>((test) => SocialcastTest.fromMap(test)))
            : [],
        trueTests: data['trueTest'] is Iterable
            ? List.from((data['trueTest'] as Iterable).map<TrueTest>((test) => TrueTest.fromMap(test)))
            : [],
        twitterTests: data['twitterTest'] is Iterable
            ? List.from((data['twitterTest'] as Iterable).map<TwitterTest>((test) => TwitterTest.fromMap(test)))
            : [],
        communityRequestsTests: data['communityRequestsTest'] is Iterable
            ? List.from((data['communityRequestsTest'] as Iterable)
                .map<CommunityRequestsTest>((test) => CommunityRequestsTest.fromMap(test)))
            : [],
        communityContentTests: data['communityContentTest'] is Iterable
            ? List.from((data['communityContentTest'] as Iterable)
                .map<CommunityContentTest>((test) => CommunityContentTest.fromMap(test)))
            : [],
        communityConnectionsTests: data['communityConnectionsTest'] is Iterable
            ? List.from((data['communityConnectionsTest'] as Iterable)
                .map<CommunityConnectionsTest>((test) => CommunityConnectionsTest.fromMap(test)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        'condition': condition.name,
        if (addressBookTests.isNotEmpty) 'addressBookTest': addressBookTests.map((test) => test.toMap()).toList(),
        if (addressTests.isNotEmpty) 'addressTest': addressTests.map((test) => test.toMap()).toList(),
        if (envelopeTests.isNotEmpty) 'envelopeTest': envelopeTests.map((test) => test.toMap()).toList(),
        if (attachmentTests.isNotEmpty) 'attachmentTest': attachmentTests.map((test) => test.toMap()).toList(),
        if (bodyTests.isNotEmpty) 'bodyTest': bodyTests.map((test) => test.toMap()).toList(),
        if (bulkTests.isNotEmpty) 'bulkTest': bulkTests.map((test) => test.toMap()).toList(),
        if (contactRankingTests.isNotEmpty)
          'contactRankingTest': contactRankingTests.map((test) => test.toMap()).toList(),
        if (conversationTests.isNotEmpty) 'conversationTest': conversationTests.map((test) => test.toMap()).toList(),
        if (currentDayOfWeekTests.isNotEmpty)
          'currentDayOfWeekTest': currentDayOfWeekTests.map((test) => test.toMap()).toList(),
        if (currentTimeTests.isNotEmpty) 'currentTimeTest': currentTimeTests.map((test) => test.toMap()).toList(),
        if (dateTests.isNotEmpty) 'dateTest': dateTests.map((test) => test.toMap()).toList(),
        if (facebookTests.isNotEmpty) 'facebookTest': facebookTests.map((test) => test.toMap()).toList(),
        if (flaggedTests.isNotEmpty) 'flaggedTest': flaggedTests.map((test) => test.toMap()).toList(),
        if (headerExistsTests.isNotEmpty) 'headerExistsTest': headerExistsTests.map((test) => test.toMap()).toList(),
        if (headerTests.isNotEmpty) 'headerTest': headerTests.map((test) => test.toMap()).toList(),
        if (importanceTests.isNotEmpty) 'importanceTest': importanceTests.map((test) => test.toMap()).toList(),
        if (inviteTests.isNotEmpty) 'inviteTest': inviteTests.map((test) => test.toMap()).toList(),
        if (linkedinTests.isNotEmpty) 'linkedinTest': linkedinTests.map((test) => test.toMap()).toList(),
        if (listTests.isNotEmpty) 'listTest': listTests.map((test) => test.toMap()).toList(),
        if (meTests.isNotEmpty) 'meTest': meTests.map((test) => test.toMap()).toList(),
        if (mimeHeaderTests.isNotEmpty) 'mimeHeaderTest': mimeHeaderTests.map((test) => test.toMap()).toList(),
        if (sizeTests.isNotEmpty) 'sizeTest': sizeTests.map((test) => test.toMap()).toList(),
        if (socialcastTests.isNotEmpty) 'socialcastTest': socialcastTests.map((test) => test.toMap()).toList(),
        if (trueTests.isNotEmpty) 'trueTest': trueTests.map((test) => test.toMap()).toList(),
        if (twitterTests.isNotEmpty) 'twitterTest': twitterTests.map((test) => test.toMap()).toList(),
        if (communityRequestsTests.isNotEmpty)
          'communityRequestsTest': communityRequestsTests.map((test) => test.toMap()).toList(),
        if (communityContentTests.isNotEmpty)
          'communityContentTest': communityContentTests.map((test) => test.toMap()).toList(),
        if (communityConnectionsTests.isNotEmpty)
          'communityConnectionsTest': communityConnectionsTests.map((test) => test.toMap()).toList(),
      };
}
