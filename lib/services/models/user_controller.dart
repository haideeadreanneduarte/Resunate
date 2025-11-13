import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user
  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .set(userData, SetOptions(merge: true));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signupUser(String userId, String email, String password,
      bool completedOnboarding) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        'password': password,
        'completed_onboarding': completedOnboarding,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateUserProfile(
      String userId, Map<String, dynamic> userData) async {
    try {
      DocumentReference userDocRef = _firestore.collection('users').doc(userId);
      DocumentSnapshot userDoc = await userDocRef.get();

      if (userDoc.exists) {
        // Merge new data with existing data
        await userDocRef.update(userData);
      } else {
        // Create new document with provided data
        await userDocRef.set(userData);
      }
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow; // Re-throw to handle in UI
    }
  }

 Future<void> updateUserPreferences(String userId, Map<String, List<String>> preferences) async {
    try {
      DocumentReference preferencesDocRef = _firestore.collection('users').doc(userId).collection('preferences').doc('userPreferences');
      await preferencesDocRef.set(preferences, SetOptions(merge: true));
    } catch (e) {
      print('Error updating user preferences: $e');
      rethrow; // Re-throw to handle in UI
    }
  }

  Future<bool> hasCompletedOnboarding(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc['completed_onboarding'] ?? false;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> setOnboardingComplete(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'completed_onboarding': true,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Get user data
  Future<DocumentSnapshot> getUser(String userId) async {
    try {
      return await _firestore.collection('users').doc(userId).get();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  // Add a daily activity log
  Future<void> addDailyActivityLog(
      String userId,
      String logId,
      String date,
      List<String> meals,
      List<String> workouts,
      List<String> meditations) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('dailyActivityLogs')
          .doc(logId)
          .set({
        'date': date,
        'activities': {
          'meals': meals,
          'workouts': workouts,
          'meditations': meditations,
        },
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // Get daily activity logs
  Future<QuerySnapshot> getDailyActivityLogs(String userId) async {
    try {
      return await _firestore
          .collection('users')
          .doc(userId)
          .collection('dailyActivityLogs')
          .get();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
