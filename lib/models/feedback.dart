class FeedbackItem {
  String id;
  String userId;
  String content;
  DateTime createDate;

  FeedbackItem({
    required this.id,
    required this.userId,
    required this.content,
    required this.createDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'content': content,
      'createDate': createDate.toIso8601String(),
    };
  }

  factory FeedbackItem.fromMap(Map<String, dynamic> map, String documentId) {
    return FeedbackItem(
      id: documentId,
      userId: map['userId'] ?? '',
      content: map['content'] ?? '',
      createDate: DateTime.parse(map['createDate'] ?? DateTime.now().toIso8601String()),
    );
  }
}
