class FeedbackItem {
  String? feedbackId; 
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


  
  factory FeedbackItem.fromFirestore(Map<String, dynamic> firestoreDocument) {
    return FeedbackItem(
      feedbackId: firestoreDocument['feedbackId'],
      userId: firestoreDocument['userId'],
      content: firestoreDocument['content'],
      createDate: DateTime.parse(firestoreDocument['createDate']),
    );
  }
}
