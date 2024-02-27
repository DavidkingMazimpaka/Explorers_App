class FeedbackItem {
  String? feedbackId; // Optional, as it's auto-generated by Firestore
  String userId;
  String content;
  DateTime createDate;

  FeedbackItem({
    this.feedbackId,
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

  // Optional: Constructor for creating a FeedbackItem from a Firestore document.
  factory FeedbackItem.fromFirestore(Map<String, dynamic> firestoreDocument) {
    return FeedbackItem(
      feedbackId: firestoreDocument['feedbackId'],
      userId: firestoreDocument['userId'],
      content: firestoreDocument['content'],
      createDate: DateTime.parse(firestoreDocument['createDate']),
    );
  }
}
