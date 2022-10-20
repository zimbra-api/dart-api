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

  factory FilterTests.fromJson(Map<String, dynamic> json) => FilterTests(
        condition: FilterCondition.values.firstWhere(
          (condition) => condition.name == json['condition'],
          orElse: () => FilterCondition.allof,
        ),
        addressBookTests: json['addressBookTest'] is Iterable
            ? List.from(
                (json['addressBookTest'] as Iterable).map<AddressBookTest>((test) => AddressBookTest.fromJson(test)))
            : [],
        addressTests: json['addressTest'] is Iterable
            ? List.from((json['addressBookTest'] as Iterable).map<AddressTest>((test) => AddressTest.fromJson(test)))
            : [],
        envelopeTests: json['envelopeTest'] is Iterable
            ? List.from((json['envelopeTest'] as Iterable).map<EnvelopeTest>((test) => EnvelopeTest.fromJson(test)))
            : [],
        attachmentTests: json['attachmentTest'] is Iterable
            ? List.from(
                (json['attachmentTest'] as Iterable).map<AttachmentTest>((test) => AttachmentTest.fromJson(test)))
            : [],
        bodyTests: json['bodyTest'] is Iterable
            ? List.from((json['bodyTest'] as Iterable).map<BodyTest>((test) => BodyTest.fromJson(test)))
            : [],
        bulkTests: json['bulkTest'] is Iterable
            ? List.from((json['bulkTest'] as Iterable).map<BulkTest>((test) => BulkTest.fromJson(test)))
            : [],
        contactRankingTests: json['contactRankingTest'] is Iterable
            ? List.from((json['contactRankingTest'] as Iterable)
                .map<ContactRankingTest>((test) => ContactRankingTest.fromJson(test)))
            : [],
        conversationTests: json['conversationTest'] is Iterable
            ? List.from(
                (json['conversationTest'] as Iterable).map<ConversationTest>((test) => ConversationTest.fromJson(test)))
            : [],
        currentDayOfWeekTests: json['currentDayOfWeekTest'] is Iterable
            ? List.from((json['currentDayOfWeekTest'] as Iterable)
                .map<CurrentDayOfWeekTest>((test) => CurrentDayOfWeekTest.fromJson(test)))
            : [],
        currentTimeTests: json['currentTimeTest'] is Iterable
            ? List.from(
                (json['currentTimeTest'] as Iterable).map<CurrentTimeTest>((test) => CurrentTimeTest.fromJson(test)))
            : [],
        dateTests: json['dateTest'] is Iterable
            ? List.from((json['dateTest'] as Iterable).map<DateTest>((test) => DateTest.fromJson(test)))
            : [],
        facebookTests: json['facebookTest'] is Iterable
            ? List.from((json['facebookTest'] as Iterable).map<FacebookTest>((test) => FacebookTest.fromJson(test)))
            : [],
        flaggedTests: json['flaggedTest'] is Iterable
            ? List.from((json['flaggedTest'] as Iterable).map<FlaggedTest>((test) => FlaggedTest.fromJson(test)))
            : [],
        headerExistsTests: json['headerExistsTest'] is Iterable
            ? List.from(
                (json['headerExistsTest'] as Iterable).map<HeaderExistsTest>((test) => HeaderExistsTest.fromJson(test)))
            : [],
        headerTests: json['headerTest'] is Iterable
            ? List.from((json['headerTest'] as Iterable).map<HeaderTest>((test) => HeaderTest.fromJson(test)))
            : [],
        importanceTests: json['importanceTest'] is Iterable
            ? List.from(
                (json['importanceTest'] as Iterable).map<ImportanceTest>((test) => ImportanceTest.fromJson(test)))
            : [],
        inviteTests: json['inviteTest'] is Iterable
            ? List.from((json['inviteTest'] as Iterable).map<InviteTest>((test) => InviteTest.fromJson(test)))
            : [],
        linkedinTests: json['linkedinTest'] is Iterable
            ? List.from((json['linkedinTest'] as Iterable).map<LinkedInTest>((test) => LinkedInTest.fromJson(test)))
            : [],
        listTests: json['listTest'] is Iterable
            ? List.from((json['listTest'] as Iterable).map<ListTest>((test) => ListTest.fromJson(test)))
            : [],
        meTests: json['meTest'] is Iterable
            ? List.from((json['meTest'] as Iterable).map<MeTest>((test) => MeTest.fromJson(test)))
            : [],
        mimeHeaderTests: json['mimeHeaderTest'] is Iterable
            ? List.from(
                (json['mimeHeaderTest'] as Iterable).map<MimeHeaderTest>((test) => MimeHeaderTest.fromJson(test)))
            : [],
        sizeTests: json['sizeTest'] is Iterable
            ? List.from((json['sizeTest'] as Iterable).map<SizeTest>((test) => SizeTest.fromJson(test)))
            : [],
        socialcastTests: json['socialcastTest'] is Iterable
            ? List.from(
                (json['socialcastTest'] as Iterable).map<SocialcastTest>((test) => SocialcastTest.fromJson(test)))
            : [],
        trueTests: json['trueTest'] is Iterable
            ? List.from((json['trueTest'] as Iterable).map<TrueTest>((test) => TrueTest.fromJson(test)))
            : [],
        twitterTests: json['twitterTest'] is Iterable
            ? List.from((json['twitterTest'] as Iterable).map<TwitterTest>((test) => TwitterTest.fromJson(test)))
            : [],
        communityRequestsTests: json['communityRequestsTest'] is Iterable
            ? List.from((json['communityRequestsTest'] as Iterable)
                .map<CommunityRequestsTest>((test) => CommunityRequestsTest.fromJson(test)))
            : [],
        communityContentTests: json['communityContentTest'] is Iterable
            ? List.from((json['communityContentTest'] as Iterable)
                .map<CommunityContentTest>((test) => CommunityContentTest.fromJson(test)))
            : [],
        communityConnectionsTests: json['communityConnectionsTest'] is Iterable
            ? List.from((json['communityConnectionsTest'] as Iterable)
                .map<CommunityConnectionsTest>((test) => CommunityConnectionsTest.fromJson(test)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'condition': condition.name,
        if (addressBookTests.isNotEmpty) 'addressBookTest': addressBookTests.map((test) => test.toJson()).toList(),
        if (addressTests.isNotEmpty) 'addressTest': addressTests.map((test) => test.toJson()).toList(),
        if (envelopeTests.isNotEmpty) 'envelopeTest': envelopeTests.map((test) => test.toJson()).toList(),
        if (attachmentTests.isNotEmpty) 'attachmentTest': attachmentTests.map((test) => test.toJson()).toList(),
        if (bodyTests.isNotEmpty) 'bodyTest': bodyTests.map((test) => test.toJson()).toList(),
        if (bulkTests.isNotEmpty) 'bulkTest': bulkTests.map((test) => test.toJson()).toList(),
        if (contactRankingTests.isNotEmpty)
          'contactRankingTest': contactRankingTests.map((test) => test.toJson()).toList(),
        if (conversationTests.isNotEmpty) 'conversationTest': conversationTests.map((test) => test.toJson()).toList(),
        if (currentDayOfWeekTests.isNotEmpty)
          'currentDayOfWeekTest': currentDayOfWeekTests.map((test) => test.toJson()).toList(),
        if (currentTimeTests.isNotEmpty) 'currentTimeTest': currentTimeTests.map((test) => test.toJson()).toList(),
        if (dateTests.isNotEmpty) 'dateTest': dateTests.map((test) => test.toJson()).toList(),
        if (facebookTests.isNotEmpty) 'facebookTest': facebookTests.map((test) => test.toJson()).toList(),
        if (flaggedTests.isNotEmpty) 'flaggedTest': flaggedTests.map((test) => test.toJson()).toList(),
        if (headerExistsTests.isNotEmpty) 'headerExistsTest': headerExistsTests.map((test) => test.toJson()).toList(),
        if (headerTests.isNotEmpty) 'headerTest': headerTests.map((test) => test.toJson()).toList(),
        if (importanceTests.isNotEmpty) 'importanceTest': importanceTests.map((test) => test.toJson()).toList(),
        if (inviteTests.isNotEmpty) 'inviteTest': inviteTests.map((test) => test.toJson()).toList(),
        if (linkedinTests.isNotEmpty) 'linkedinTest': linkedinTests.map((test) => test.toJson()).toList(),
        if (listTests.isNotEmpty) 'listTest': listTests.map((test) => test.toJson()).toList(),
        if (meTests.isNotEmpty) 'meTest': meTests.map((test) => test.toJson()).toList(),
        if (mimeHeaderTests.isNotEmpty) 'mimeHeaderTest': mimeHeaderTests.map((test) => test.toJson()).toList(),
        if (sizeTests.isNotEmpty) 'sizeTest': sizeTests.map((test) => test.toJson()).toList(),
        if (socialcastTests.isNotEmpty) 'socialcastTest': socialcastTests.map((test) => test.toJson()).toList(),
        if (trueTests.isNotEmpty) 'trueTest': trueTests.map((test) => test.toJson()).toList(),
        if (twitterTests.isNotEmpty) 'twitterTest': twitterTests.map((test) => test.toJson()).toList(),
        if (communityRequestsTests.isNotEmpty)
          'communityRequestsTest': communityRequestsTests.map((test) => test.toJson()).toList(),
        if (communityContentTests.isNotEmpty)
          'communityContentTest': communityContentTests.map((test) => test.toJson()).toList(),
        if (communityConnectionsTests.isNotEmpty)
          'communityConnectionsTest': communityConnectionsTests.map((test) => test.toJson()).toList(),
      };
}
