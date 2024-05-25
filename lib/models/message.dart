import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;  // Corrected typo
  final String senderEmail;  // Corrected typo and followed camelCase convention
  final String receiverId;  // Corrected typo
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  // Convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
